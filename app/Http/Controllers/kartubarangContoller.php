<?php

namespace App\Http\Controllers;

use App\Models\barangkeluar;
use App\Models\barangmasuk;
use App\Models\databarang;
use App\Models\jenisbarang;
use App\Models\ttd_surat;
use Carbon\Carbon;
use Dompdf\Dompdf;
use Dompdf\Options;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\View as FacadesView;

class kartubarangContoller extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $katakunci= $request->katakunci;
        $jumlahbaris =10;
        if(strlen($katakunci)){
            $data= databarang::where('id_barang','like',"%$katakunci%")
            ->orwhere('nama_barang','like',"%$katakunci%")
            ->paginate($jumlahbaris);
        }else{
            $data = databarang::orderBy('id_barang','asc')->paginate($jumlahbaris);
        }
        return view('kartubarang.index')->with('data',$data);
    }

    public function show( $id)
    {
        $user = auth()->user();
    if ($user->role == 'kelurahan') {
        // Mendapatkan databarang berdasarkan ID barang dan ID pengguna
        $databarang = databarang::where('id_barang', $id);
        
        // Pastikan databarang ditemukan sebelum melanjutkan
        if ($databarang) {
            $barangmasuk = barangmasuk::where('id_barang', $id)->where('created_by', $user->email)->get();
            $barangkeluar = barangkeluar::where('id_barang', $id)->where('created_by', $user->email)->get();
        } else {
            // Jika databarang tidak ditemukan, set barangmasuk dan barangkeluar ke koleksi kosong
            $barangmasuk = collect();
            $barangkeluar = collect();
        }
    } else {
        // Mendapatkan data berdasarkan ID barang saja
        $databarang = databarang::where('id_barang', $id)->get();
        $barangmasuk = barangmasuk::where('id_barang', $id)->get();
        $barangkeluar = barangkeluar::where('id_barang', $id)->get();
    }
    return view('kartubarang.show', compact('databarang', 'barangmasuk', 'barangkeluar'));
   
    }

    public function unduhForm2()
    {
        $databarang = BarangMasuk::all();
        $jenisbarang = JenisBarang::all();

        return view('kartubarang.unduh2', compact('databarang', 'jenisbarang'));
    }

    public function lihat($tglawal, $tglakhir, $id_barang, $perangkat_daerah = null)
    {
        Carbon::setLocale('id');
        $user = Auth::user();

        $barangmasuk = BarangMasuk::whereBetween('Tanggal', [$tglawal, $tglakhir]);
        $barangkeluar = BarangKeluar::whereBetween('Tanggal', [$tglawal, $tglakhir]);

        if ($id_barang && $id_barang != 'semua') {
            $barangmasuk->where('id_barang', 'like', '%' . $id_barang . '%');
            $barangkeluar->where('id_barang', 'like', '%' . $id_barang . '%');
        }

        if ($user->role == 'pengelola_barang') {
            if ($perangkat_daerah && $perangkat_daerah != 'SE-KECAMATAN') {
                $barangmasuk->where('perangkat_daerah', $perangkat_daerah);
                $barangkeluar->where('perangkat_daerah', $perangkat_daerah);
            }
        } else {
            $barangmasuk->where('created_by', $user->email);
            $barangkeluar->where('created_by', $user->email);
        }

        $barangmasuk = $barangmasuk->get();
        $barangkeluar = $barangkeluar->get();

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

        $jenisbarang = JenisBarang::all();

        return view('kartubarang.preview', compact(
            'jenisbarang', 'tanggal', 'ttd_surat', 'barangmasuk', 'barangkeluar',
            'tglawal', 'tglakhir', 'bulanAwal', 'bulanAkhir','id_barang', 'tahunAwal', 'tahunAkhir', 'perangkat_daerah'
        ));
    }

public function unduhForm($tglawal, $tglakhir,$id_barang,$perangkat_daerah = null)
{
    // Panggil fungsi PreviewUnduh untuk mendapatkan data yang sama
    $previewData = $this->lihat($tglawal, $tglakhir,$id_barang,$perangkat_daerah);

    // Ekstrak data dari hasil preview

    $tanggal=$previewData->getData()['tanggal'];
    $ttd_surat= $previewData->getData()['ttd_surat'];
    $barangmasuk = $previewData->getData()['barangmasuk'];
    $barangkeluar = $previewData->getData()['barangkeluar'];
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
    $html = FacadesView::make('kartubarang.unduh', compact('barangkeluar','id_barang','tanggal','barangmasuk','ttd_surat', 'jenisbarang', 'tglawal', 'tglakhir', 'bulanAwal', 'bulanAkhir', 'tahunAwal', 'tahunAkhir', 'perangkat_daerah'))->render();

    // Memuat konten HTML ke DOMPDF
    $dompdf->loadHtml($html);

    // Render PDF (optional: bisa dipanggil methods render() atau stream())
    $dompdf->render();
    //session()->flash('success', 'Berhasil mengunduh file PDF.');
    // Mengunduh PDF ke pengguna
    return $dompdf->stream('KartuBarang.pdf');
}

public function preview($tglawal, $tglakhir, $id_barang)
    {
        Carbon::setLocale('id');
        $user = Auth::user();

        $barangmasuk = BarangMasuk::whereBetween('Tanggal', [$tglawal, $tglakhir]);
        $barangkeluar = BarangKeluar::whereBetween('Tanggal', [$tglawal, $tglakhir]);

        if ($id_barang && $id_barang != 'semua') {
            $barangmasuk->where('id_barang', 'like', '%' . $id_barang . '%');
            $barangkeluar->where('id_barang', 'like', '%' . $id_barang . '%');
        }

        if ($user->role == 'kelurahan') {
            $barangmasuk->where('created_by', $user->email);
            $barangkeluar->where('created_by', $user->email);
        }

        if (!$barangkeluar && !$barangmasuk) {
            abort(404, 'Barang tidak ditemukan.');
        }

        $barangmasuk = $barangmasuk->get();
        $barangkeluar = $barangkeluar->get();
        $perangkat_daerah = '-';

        if ($barangmasuk->isNotEmpty() && $barangkeluar->isNotEmpty()) {
            $perangkat_daerah = $barangkeluar->first()->perangkat_daerah ?: $barangmasuk->first()->perangkat_daerah;
        } elseif ($barangmasuk->isNotEmpty()) {
            $perangkat_daerah = $barangmasuk->first()->perangkat_daerah;
        } elseif ($barangkeluar->isNotEmpty()) {
            $perangkat_daerah = $barangkeluar->first()->perangkat_daerah;
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

        $jenisbarang = JenisBarang::all();

        return view('kartubarang.preview', compact(
            'jenisbarang', 'tanggal', 'ttd_surat', 'barangmasuk', 'barangkeluar',
            'tglawal', 'tglakhir', 'bulanAwal', 'bulanAkhir','id_barang', 'tahunAwal', 'tahunAkhir', 'perangkat_daerah'
        ));
    }

    public function unduhKartu($tglawal, $tglakhir,$id_barang,$perangkat_daerah=null)
    {
        // Panggil fungsi PreviewUnduh untuk mendapatkan data yang sama
        $previewData = $this->preview($tglawal, $tglakhir,$id_barang,$perangkat_daerah);
    
        // Ekstrak data dari hasil preview
    
        $tanggal=$previewData->getData()['tanggal'];
        $ttd_surat= $previewData->getData()['ttd_surat'];
        $barangmasuk = $previewData->getData()['barangmasuk'];
        $barangkeluar = $previewData->getData()['barangkeluar'];
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
        $html = FacadesView::make('kartubarang.unduh', compact('barangkeluar','id_barang','tanggal','barangmasuk','ttd_surat', 'jenisbarang', 'tglawal', 'tglakhir', 'bulanAwal', 'bulanAkhir', 'tahunAwal', 'tahunAkhir', 'perangkat_daerah'))->render();
    
        // Memuat konten HTML ke DOMPDF
        $dompdf->loadHtml($html);
    
        // Render PDF (optional: bisa dipanggil methods render() atau stream())
        $dompdf->render();
        //session()->flash('success', 'Berhasil mengunduh file PDF.');
        // Mengunduh PDF ke pengguna
        return $dompdf->stream('KartuBarang.pdf');
    }
    public function CetakKartubarang($id)
{
    // Ambil data barang, barang masuk, dan barang keluar berdasarkan ID barang
    $databarang = databarang::where('id_barang', $id)->first(); // Hanya ambil satu item
    $barangmasuk = barangmasuk::where('id_barang', $id)->get();
    $barangkeluar = barangkeluar::where('id_barang', $id)->get();

    // Pastikan barang ditemukan, jika tidak, kembalikan respons error
    if (!$databarang) {
        abort(404, 'Barang tidak ditemukan.');
    }

    return view('kartubarang.unduh', compact('databarang', 'barangmasuk', 'barangkeluar'));
}


    /**
     * Show the form for editing the specified resource.
     */
    public function edit( $id)
    {
        
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
