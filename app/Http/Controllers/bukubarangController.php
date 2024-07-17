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

class bukubarangController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $katakunci = $request->katakunci;
    $jumlahbaris = 10;

    // Dapatkan pengguna yang sedang login
    $user = Auth::user();

    // Menentukan query berdasarkan peran pengguna
    if ($user->role == 'admin' || $user->role == 'ketua') {
        // Admin dan ketua bisa melihat semua data
        if (strlen($katakunci)) {
            $data = barangmasuk::where(function ($query) use ($katakunci) {
                $query->where('id_barang', 'like', "%$katakunci%")
                      ->orWhere('perangkat_daerah', 'like', "%$katakunci%")
                      ->orWhere('jenis_barang', 'like', "%$katakunci%")
                      ->orWhere('nama_barang', 'like', "%$katakunci%");
            })->paginate($jumlahbaris);
        } else {
            $data = barangmasuk::orderBy('jenis_barang', 'desc')->paginate($jumlahbaris);
        }
    } else {
        // Pengguna biasa hanya bisa melihat data yang mereka input
        if (strlen($katakunci)) {
            $data = barangmasuk::where('created_by', $user->email)  // Hanya data yang dibuat oleh pengguna
                ->where(function ($query) use ($katakunci) {
                    $query->where('id_barang', 'like', "%$katakunci%")
                          ->orWhere('perangkat_daerah', 'like', "%$katakunci%")
                          ->orWhere('jenis_barang', 'like', "%$katakunci%")
                          ->orWhere('nama_barang', 'like', "%$katakunci%");
                })
                ->paginate($jumlahbaris);
        } else {
            $data = barangmasuk::where('created_by', $user->email)  // Hanya data yang dibuat oleh pengguna
                ->orderBy('jenis_barang', 'desc')
                ->paginate($jumlahbaris);
        }
    }

    // Menghitung total barang berdasarkan data yang diakses pengguna
    $barangMasuks = barangmasuk::where('created_by', $user->email)->get();  // Hanya data yang dibuat oleh pengguna
    $barangKeluar = barangkeluar::where('created_by', $user->email)->get();  // Sama seperti di atas
    $awal = $barangMasuks->sum('jml_barang_awal');
    $masuk = $barangMasuks->sum('jml_barang');
    $keluar = $barangKeluar->sum('jml_barang');
    $totalbarang = $awal + $masuk - $keluar;

    // Mengambil data barang keluar berdasarkan peran pengguna
    if ($user->role == 'pengelola_barang' || $user->role == 'ketua') {
        $data2 = barangkeluar::orderBy('jenis_barang', 'desc')->paginate($jumlahbaris);
    } else {
        $data2 = barangkeluar::where('created_by', $user->email)  // Hanya data yang dibuat oleh pengguna
            ->orderBy('jenis_barang', 'desc')
            ->paginate($jumlahbaris);
    }

    $jenisbarang = jenisbarang::all();  // Jika jenis barang tidak spesifik untuk pengguna

    return view('bukubarang.index', compact('data', 'data2', 'totalbarang', 'jenisbarang'));
}
    public function cetakBukubarang(){
        $jenisbarang=jenisbarang::all();
        return view('bukubarang.unduhPertanggal',compact('jenisbarang'));
    }

    public function unduh($tglawal,$tglakhir)//untuk kelurahan
{
        Carbon::setLocale('id');
        $user = Auth::user();

    if ($user->role == 'pengelola_barang' ) {
        // Admin dan ketua bisa melihat semua data
        $data = barangmasuk::whereBetween('Tanggal', [$tglawal, $tglakhir])->get();
        $data2 = barangkeluar::whereBetween('Tanggal', [$tglawal, $tglakhir])->get();
    } else {
        // Pengguna biasa hanya bisa melihat data yang mereka buat
        $data = barangmasuk::whereBetween('Tanggal', [$tglawal, $tglakhir])
            ->where('created_by', $user->email)->get();
        $data2 = barangkeluar::whereBetween('Tanggal', [$tglawal, $tglakhir])
            ->where('created_by', $user->email)
            ->get();
    }
    $perangkat_daerah = '-';
    if ($data->isNotEmpty()) {
        $perangkat_daerah = $data->first()->perangkat_daerah;
    }
    $ttd_surat = ttd_surat::where('unit_kerja', 'like', '%' . $perangkat_daerah . '%')->get();
     // Menggunakan Carbon untuk mendapatkan nama bulan dari tanggal awal dan akhir
     $bulanAwal = Carbon::parse($tglawal)->format('F'); // Mengambil nama bulan
     $bulanAkhir = Carbon::parse($tglakhir)->format('F'); // Mengambil nama bulan
     $tahunAwal = Carbon::parse($tglawal)->format('Y');//Mengambil nama Tahun
     $tahunAkhir = Carbon::parse($tglakhir)->format('Y');
     $tanggal = Carbon::parse($tglakhir)->format('d'); 
    $jenisbarang =jenisbarang::get();

        return view('bukubarang.show', compact('jenisbarang','tanggal','ttd_surat','tahunAkhir','perangkat_daerah','data','data2','tglawal', 'tglakhir', 'bulanAwal', 'bulanAkhir','tahunAwal'));
}

public function download($tglawal, $tglakhir)
{
    // Panggil fungsi PreviewUnduh untuk mendapatkan data yang sama
    $previewData = $this->unduh($tglawal, $tglakhir);

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
    $dompdf->setPaper('letter', 'landscape');

    // Render view dengan data yang diperlukan
    $html = View::make('bukubarang.unduh', compact('data','tanggal','ttd_surat','data2', 'jenisbarang', 'tglawal', 'tglakhir', 'bulanAwal', 'bulanAkhir', 'tahunAwal', 'tahunAkhir', 'perangkat_daerah'))->render();

    // Memuat konten HTML ke DOMPDF
    $dompdf->loadHtml($html);

    // Render PDF (optional: bisa dipanggil methods render() atau stream())
    $dompdf->render();
    //session()->flash('success', 'Berhasil mengunduh file PDF.');
    // Mengunduh PDF ke pengguna
    return $dompdf->stream('BukuBarang.pdf');
}

public function lihat($tglawal, $tglakhir, $perangkat_daerah = null)
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
    } else {
        // Pengguna biasa hanya bisa melihat data yang mereka buat
        $data = barangmasuk::whereBetween('Tanggal', [$tglawal, $tglakhir])
            ->where('created_by', $user->email)
            ->get();
        
        $data2 = barangkeluar::whereBetween('Tanggal', [$tglawal, $tglakhir])
            ->where('created_by', $user->email)
            ->get();
    }
    $ttd_surat = ttd_surat::where(function ($query) use ($perangkat_daerah) {
        if ($perangkat_daerah == 'SE-KECAMATAN') {
            $query->where('unit_kerja', 'KECAMATAN ASTANAANYAR');
        } else {
            $query->where('unit_kerja', 'like', '%' . $perangkat_daerah . '%');
        }
    })->get();
    // Menggunakan Carbon untuk mendapatkan nama bulan dari tanggal awal dan akhir
    $bulanAwal = Carbon::parse($tglawal)->locale('id')->isoFormat('MMMM');
    $bulanAkhir = Carbon::parse($tglakhir)->locale('id')->isoFormat('MMMM');
    $tahunAwal = Carbon::parse($tglawal)->format('Y');
    $tahunAkhir = Carbon::parse($tglakhir)->format('Y');
    $tanggal = Carbon::parse($tglakhir)->format('d'); 

    $jenisbarang = jenisbarang::all();

    return view('bukubarang.show', compact('jenisbarang','tanggal', 'data','ttd_surat', 'data2', 'tglawal', 'tglakhir', 'bulanAwal', 'bulanAkhir', 'tahunAwal', 'tahunAkhir', 'perangkat_daerah'));
}
public function unduhForm($tglawal, $tglakhir,$perangkat_daerah = null)
{
    // Panggil fungsi PreviewUnduh untuk mendapatkan data yang sama
    $previewData = $this->lihat($tglawal, $tglakhir,$perangkat_daerah);

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
    $html = View::make('bukubarang.unduh', compact('data','tanggal','data2','ttd_surat', 'jenisbarang', 'tglawal', 'tglakhir', 'bulanAwal', 'bulanAkhir', 'tahunAwal', 'tahunAkhir', 'perangkat_daerah'))->render();

    // Memuat konten HTML ke DOMPDF
    $dompdf->loadHtml($html);

    // Render PDF (optional: bisa dipanggil methods render() atau stream())
    $dompdf->render();
    //session()->flash('success', 'Berhasil mengunduh file PDF.');
    // Mengunduh PDF ke pengguna
    return $dompdf->stream('BukuBarang.pdf');
}
}
