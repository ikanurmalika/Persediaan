<?php

namespace App\Http\Controllers;

use App\Models\barangkeluar;
use App\Models\barangmasuk;
use App\Models\jenisbarang;
use App\Models\ttd_surat;
use Carbon\Carbon;
use Dompdf\Dompdf;
use Dompdf\Options;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\View;

class LaporanController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
{
    $user = auth()->user(); // Mengambil data pengguna yang sedang login
    
    $katakunci = $request->katakunci;
    $jumlahbaris = 100;
    
    // Mengambil data jenis barang
    if (strlen($katakunci)) {
        $jenisbarang = jenisbarang::where(function($query) use ($katakunci) {
            $query->where('jenis_barang', 'like', "%$katakunci%")
                  ->orWhere('tipe', 'like', "%$katakunci%");
        })->paginate($jumlahbaris);
    } else {
        $jenisbarang = jenisbarang::orderBy('created_at', 'asc')->paginate($jumlahbaris);
    }
    
    // Mengambil data barang masuk
    if ($user->role == 'pengelola_barang') {
        $data = barangmasuk::orderBy('created_at', 'asc')->paginate($jumlahbaris);
    } else {
        $data = barangmasuk::where('created_by', $user->email)
                            ->orderBy('created_at', 'asc')
                            ->paginate($jumlahbaris);
    }
    
    // Mengambil data barang keluar
    if ($user->role == 'pengelola_barang') {
        $data2 = barangkeluar::orderBy('created_at', 'asc')->paginate($jumlahbaris);
    } else {
        $data2 = barangkeluar::where('created_by', $user->email)
                             ->orderBy('created_at', 'asc')
                             ->paginate($jumlahbaris);
    }
    
    return view('Laporan.index', compact('data', 'data2', 'jenisbarang'));
}


    public function cetakLaporan()
    {
        return view('Laporan.unduh2');
    }

    public function unduhPertanggal2($tglawal, $tglakhir)
{
    $user = auth()->user(); // Mengambil data pengguna yang sedang login

    if ($user->role == 'pengelola_barang') {
        // Jika pengguna adalah pengelola_barang, dapat mengunduh semua data
        $data = barangmasuk::whereBetween('Tanggal', [$tglawal, $tglakhir])->get();
        $data2 = barangkeluar::whereBetween('Tanggal', [$tglawal, $tglakhir])->get();
    } else {
        // Jika pengguna bukan pengelola_barang, hanya mengunduh data yang dimilikinya
        $data = barangmasuk::where('created_by', $user->email)
                    ->whereBetween('Tanggal', [$tglawal, $tglakhir])
                    ->get();
        $data2 = barangkeluar::where('created_by', $user->email)
                    ->whereBetween('Tanggal', [$tglawal, $tglakhir])
                    ->get();
    }
    $perangkat_daerah = '-';
    if ($data->isNotEmpty()) {
        $perangkat_daerah = $data->first()->perangkat_daerah;
    }

    $ttd_surat = ttd_surat::where(function ($query) use ($perangkat_daerah) {
        if ($perangkat_daerah == 'SE-KECAMATAN') {
            $query->where('unit_kerja', 'KECAMATAN ASTANAANYAR');
        } else {
            $query->where('unit_kerja', 'like', '%' . $perangkat_daerah . '%');
        }
    })->get();
    // Mengambil semua data dari tabel barangmasuk

    $jenisbarang = jenisbarang::get();
    $bulanAwal = Carbon::parse($tglawal)->locale('id')->isoFormat('MMMM');
    $bulanAkhir = Carbon::parse($tglakhir)->locale('id')->isoFormat('MMMM');
    $tahunAwal = Carbon::parse($tglawal)->format('Y');
    $tahunAkhir = Carbon::parse($tglakhir)->format('Y');
    $tanggal = Carbon::parse($tglakhir)->format('d'); 
    return view('Laporan.show', compact('jenisbarang', 'data', 'data2', 'tglawal', 'tglakhir','bulanAwal','bulanAkhir'
                ,'tahunAwal','tahunAkhir','tanggal','perangkat_daerah','ttd_surat'));
}

public function unduh($tglawal, $tglakhir,$perangkat_daerah = null)
{
    // Panggil fungsi PreviewUnduh untuk mendapatkan data yang sama
    $previewData = $this->unduhPertanggal2($tglawal, $tglakhir,$perangkat_daerah);

    // Ekstrak data dari hasil preview
    $tanggal=$previewData->getData()['tanggal'];
    $ttd_surat= $previewData->getData()['ttd_surat'];
    $data = $previewData->getData()['data'];
    $data2 = $previewData->getData()['data2'];
    $jenisbarang = $previewData->getData()['jenisbarang'];
    $bulanAwal = $previewData->getData()['bulanAwal'];
    $bulanAkhir = $previewData->getData()['bulanAkhir'];
    $tahunAwal = $previewData->getData()['tahunAwal'];
    $tahunAkhir = $previewData->getData()['tahunAkhir'];
    //$tanggal = $previewData->getData()['tanggal'];
    $perangkat_daerah = $previewData->getData()['perangkat_daerah'];
    //$kode = $previewData->getData()['kode'];

    // Menggunakan Carbon untuk mendapatkan nama bulan dari tanggal awal dan akhir
    Carbon::setLocale('id');

    // Mengatur ukuran kertas dan orientasi
    $options = new Options();
    $options->set('isHtml5ParserEnabled', true);
    $options->set('isPhpEnabled', true);
    $options->set('defaultFont', 'Arial');

    // Instansiasi DOMPDF
    $dompdf = new Dompdf($options);
    $dompdf->setPaper('f4', 'potrait');

    // Render view dengan data yang diperlukan
    $html = View::make('Laporan.unduh', compact('data','tanggal','data2','ttd_surat', 'jenisbarang', 'tglawal', 'tglakhir', 'bulanAwal', 'bulanAkhir', 'tahunAwal', 'tahunAkhir', 'perangkat_daerah'))->render();

    // Memuat konten HTML ke DOMPDF
    $dompdf->loadHtml($html);

    // Render PDF (optional: bisa dipanggil methods render() atau stream())
    $dompdf->render();
    //session()->flash('success', 'Berhasil mengunduh file PDF.');
    // Mengunduh PDF ke pengguna
    return $dompdf->stream('Laporan-Rekapitulasi.pdf');
}

public function show($tglawal, $tglakhir, $perangkat_daerah = null)
{
    Carbon::setLocale('id');
    $user = Auth::user();

    if ($user->role == 'pengelola_barang') {
        // Admin dan ketua bisa melihat semua data
        $barang = barangmasuk::whereBetween('Tanggal', [$tglawal, $tglakhir]);
        $barang2 = barangkeluar::whereBetween('Tanggal', [$tglawal, $tglakhir]);
        
        if ($perangkat_daerah && $perangkat_daerah != 'SE-KECAMATAN') {
            $barang->where('perangkat_daerah', $perangkat_daerah);
            $barang2->where('perangkat_daerah', $perangkat_daerah);
        }

        $data = $barang->get();
        $data2 = $barang2->get();
        // Mengelompokkan data berdasarkan perangkat daerah
        $groupedData = $data->groupBy('perangkat_daerah');
        $groupedData2 = $data2->groupBy('perangkat_daerah');
    } else {
        // Pengguna biasa hanya bisa melihat data yang mereka buat
        $data = barangmasuk::whereBetween('Tanggal', [$tglawal, $tglakhir])
            ->where('created_by', $user->email)
            ->get();
        
        $data2 = barangkeluar::whereBetween('Tanggal', [$tglawal, $tglakhir])
            ->where('created_by', $user->email)
            ->get();
            // Mengelompokkan data berdasarkan perangkat daerah
        $groupedData = $data->groupBy('perangkat_daerah');
        $groupedData2 = $data2->groupBy('perangkat_daerah');
    }
    $ttd_surat = ttd_surat::where(function ($query) use ($perangkat_daerah) {
        if ($perangkat_daerah == 'SE-KECAMATAN') {
            $query->where('unit_kerja', 'KECAMATAN ASTANAANYAR');
        } else {
            $query->where('unit_kerja', 'like', '%' . $perangkat_daerah . '%');
        }
    })->get();
    $perangkat = barangmasuk::pluck('perangkat_daerah')->unique();

    $jenisbarang = jenisbarang::all();
    $bulanAwal = Carbon::parse($tglawal)->locale('id')->isoFormat('MMMM');
    $bulanAkhir = Carbon::parse($tglakhir)->locale('id')->isoFormat('MMMM');
    $tahunAwal = Carbon::parse($tglawal)->format('Y');
    $tahunAkhir = Carbon::parse($tglakhir)->format('Y');
    $tanggal = Carbon::parse($tglakhir)->format('d'); 

    return view('Laporan.show', compact('jenisbarang','groupedData','groupedData2','tanggal', 'data','ttd_surat', 'data2', 'tglawal', 'tglakhir', 'bulanAwal', 'bulanAkhir', 'tahunAwal', 'tahunAkhir', 'perangkat_daerah'));
}

public function unduhForm($tglawal, $tglakhir,$perangkat_daerah = null)
{
    // Panggil fungsi PreviewUnduh untuk mendapatkan data yang sama
    $previewData = $this->show($tglawal, $tglakhir,$perangkat_daerah = null);

    // Ekstrak data dari hasil preview
    $tanggal=$previewData->getData()['tanggal'];
    $ttd_surat= $previewData->getData()['ttd_surat'];
    $data = $previewData->getData()['data'];
    $data2 = $previewData->getData()['data2'];
    $jenisbarang = $previewData->getData()['jenisbarang'];
    $bulanAwal = $previewData->getData()['bulanAwal'];
    $bulanAkhir = $previewData->getData()['bulanAkhir'];
    $tahunAwal = $previewData->getData()['tahunAwal'];
    $tahunAkhir = $previewData->getData()['tahunAkhir'];
    //$tanggal = $previewData->getData()['tanggal'];
    $perangkat_daerah = $previewData->getData()['perangkat_daerah'];
    //$kode = $previewData->getData()['kode'];

    // Menggunakan Carbon untuk mendapatkan nama bulan dari tanggal awal dan akhir
    Carbon::setLocale('id');

    // Mengatur ukuran kertas dan orientasi
    $options = new Options();
    $options->set('isHtml5ParserEnabled', true);
    $options->set('isPhpEnabled', true);
    $options->set('defaultFont', 'Arial');

    // Instansiasi DOMPDF
    $dompdf = new Dompdf($options);
    $dompdf->setPaper('f4', 'landscape');

    // Render view dengan data yang diperlukan
    $html = View::make('Laporan.unduh', compact('data','tanggal','data2','ttd_surat', 'jenisbarang', 'tglawal', 'tglakhir', 'bulanAwal', 'bulanAkhir', 'tahunAwal', 'tahunAkhir', 'perangkat_daerah'))->render();

    // Memuat konten HTML ke DOMPDF
    $dompdf->loadHtml($html);

    // Render PDF (optional: bisa dipanggil methods render() atau stream())
    $dompdf->render();
    //session()->flash('success', 'Berhasil mengunduh file PDF.');
    // Mengunduh PDF ke pengguna
    return $dompdf->stream('Laporan-Rekapitulasi.pdf');
}

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
