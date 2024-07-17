<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\barangmasuk;
use App\Models\databarang;
use App\Models\jenisbarang;
use App\Models\ttd_surat;
use App\Models\user;
use Carbon\Carbon;
use Barryvdh\DomPDF\Facade\Pdf;
use Dompdf\Dompdf;
use Dompdf\Options;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\View;

class barangmasukController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $katakunci = $request->katakunci;
        $jumlahbaris = 10;

        // Gunakan Auth::user() untuk mendapatkan pengguna yang sedang login
        $user = Auth::user(); 
        

        // Jika pengguna adalah pengelola atau ketua, mereka bisa melihat semua data
        if ($user->role =='pengelola_barang' || $user->role =='ketua') {
            if (strlen($katakunci)) {
                // Query dengan filter kata kunci
                $data = barangmasuk::where(function ($query) use ($katakunci) {
                    $query->where('jenis_barang', 'like', "%$katakunci%")
                          ->orWhere('perangkat_daerah', 'like', "%$katakunci%")
                          ->orWhere('nama_barang', 'like', "%$katakunci%");
                })->paginate($jumlahbaris);
            } else {
                $data = barangmasuk::orderBy('id_transaksi_masuk', 'desc')->paginate($jumlahbaris);
            }
        } else {
            // Pengguna biasa hanya dapat melihat data yang mereka input
            if (strlen($katakunci)) {
                $data = barangmasuk::where('created_by', $user->email)
                    ->where(function ($query) use ($katakunci) {
                        $query->where('jenis_barang', 'like', "%$katakunci%")
                              ->orWhere('perangkat_daerah', 'like', "%$katakunci%")
                              ->orWhere('nama_barang', 'like', "%$katakunci%");
                    })
                    ->paginate($jumlahbaris);
            } else {
                $data = barangmasuk::where('created_by', $user->email)
                    ->orderBy('id_transaksi_masuk', 'desc')
                    ->paginate($jumlahbaris);
            }
        }

        return view('barangmasuk.index')->with('data', $data);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $jenisbarang = jenisbarang::all();
        $databarang = databarang::all();
        return view('barangmasuk.create',compact('databarang', 'jenisbarang'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
{
    // Buat id transaksi otomatis
    $barang = barangmasuk::latest()->first();
    
    $barang_id = "3";
    if ($barang == null) {
        // Kode pertama
        $nomor_urut = "000001";
    } else {
        $nomor_urut = intval(substr($barang->id_transaksi_masuk, 1, 6)) + 1;
        $nomor_urut = str_pad($nomor_urut, 6, "0", STR_PAD_LEFT);
    }
    $idtransaksi = $barang_id . $nomor_urut;

    // Ambil nama_barang dari request
    $nama_barang = $request->nama_barang;
    
    // Cari id_barang berdasarkan nama_barang yang dipilih
    $databrg = Databarang::where('id_barang', $request->id_barang)
                ->first();
    
    // Jika barang ditemukan, kembalikan id_barang dan harga barang yang sesuai
    if ($databrg) {
        $barang = $databrg->nama_barang;
        $hargabarang = $databrg->harga;
    } else {
        // Jika barang tidak ditemukan, sesuaikan dengan kebijakan aplikasi Anda
        $barang = '-';
        $hargabarang = '0'; // Atau berikan nilai default sesuai kebutuhan
    }
    $jenisbarang= jenisbarang::where('jenis_barang',$request->jenis_barang)->first();
           if ($jenisbarang){
            $kode= $jenisbarang->kode;
           }else{
            $kode='-';
    }
    // Hitung total harga berdasarkan harga barang dan jumlah barang
    $jumlah_barang = $request->jml_barang;
    $total = $hargabarang * $jumlah_barang;

    // Hitung total harga awal berdasarkan harga barang dan jumlah barang awal
    $jumlah_barang_awal = $request->jml_barang_awal;
    $total_awal = $hargabarang * $jumlah_barang_awal;

    // Validasi data yang harus diisi
    $request->validate([
        'jenis_barang' => 'required',
        
        'id_barang' => 'required',
        'ket' => 'required',
        'satuan' => 'required',
        'perangkat_daerah' => 'required',
        'jml_barang' => 'required',
        'jml_barang_awal' => 'required',
        'Tanggal' => 'required',
        'dari' => 'required',
    ], [
        // Setting pesan error
        'jenis_barang.required' => 'Jenis Barang wajib di isi',
        
        'id_barang.required' => 'ID Barang wajib di isi',
        'ket.required' => 'Keterangan wajib di isi',
        'satuan.required' => 'Satuan wajib di isi',
        'perangkat_daerah.required' => 'Perangkat daerah wajib di isi',
        'jml_barang.required' => 'Jumlah barang wajib di isi',
        'jml_barang_awal.required' => 'Jumlah barang wajib di isi',
        'Tanggal.required' => 'Tanggal wajib di isi',
        'dari.required' => 'Dari wajib di isi',
    ]);

    // Buat array data untuk disimpan ke database
    $data = [
        'perangkat_daerah' => $request->perangkat_daerah,
        'id_transaksi_masuk' => $idtransaksi,
        'id_barang' => $request->id_barang,
        'jenis_barang' => $request->jenis_barang,
        'kode'=>$kode,
        'nama_barang' => $barang,
        'jml_barang' => $request->jml_barang,
        'harga_barang' => $hargabarang,
        'jml_harga' => $total,
        'jml_barang_awal' => $request->jml_barang_awal,
        'jml_harga_awal' => $total_awal,
        'ket' => $request->ket,
        'satuan' => $request->satuan,
        'Tanggal' => $request->Tanggal,
        'dari' => $request->dari,
        'created_by' => Auth::user()->email,
        'nomor_dokumen_faktur' => $request->nomor_dokumen_faktur,
        'tanggal_dokumen_faktur' => $request->tanggal_dokumen_faktur,
        'nomor_ba_penerimaan' => $request->nomor_ba_penerimaan,
        'tanggal_ba_penerimaan' => $request->tanggal_ba_penerimaan,
    ];

    // Simpan data ke database menggunakan model barangmasuk
    barangmasuk::create($data);

    // Redirect kembali ke halaman barangmasuk dengan pesan sukses
    return redirect()->to('barangmasuk')->with('success', 'Berhasil menambahkan data');
}


    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $data = barangmasuk::where('id_transaksi_masuk',$id)->first();
        $databarang= databarang::all();
        $jenisbarang=jenisbarang::all();
       return view('barangmasuk.edit',compact('databarang','jenisbarang'))->with('data',$data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
           //untuk mengisi id barang berdasarkan nama_barang  
           $nama_barang = $request->nama_barang;
           // Cari id_barang berdasarkan nama_barang
           $databrg = Databarang::where('id_barang', $request->id_barang)
                    ->first();
           // Jika barang ditemukan, kembalikan id_barang
           if ($databrg) {
               //$barangId= $databrg->id_barang;
               $barang = $databrg->nama_barang;
               $hargabarang=$databrg->harga;
           } else {
               // Jika barang tidak ditemukan, kembalikan null atau pesan error
              // $barangId='0';
              $barang = '-';
               $hargabarang='0';
           }
           $jenisbarang= jenisbarang::where('jenis_barang',$request->jenis_barang)->first();
           if ($jenisbarang){
            $kode= $jenisbarang->kode;
           }else{
            $kode='-';
           }
           
           $harga_brg=$hargabarang;
           $kodebrg=$kode;
   
           $jumlah_barang = $request->jml_barang;
           $total =+ $harga_brg* $jumlah_barang;
   
           $jumlah_barang_awal = $request->jml_barang_awal;
           $total_awal =+ $harga_brg* $jumlah_barang_awal;
   
           $request->validate([
            'jenis_barang' => 'required',
            //'nama_barang' => 'required',
            'ket' => 'required',
            'satuan' => 'required',
            'perangkat_daerah' => 'required',
            'jml_barang' => 'required',
            'jml_barang_awal' => 'required',
            'Tanggal' => 'required',
            'dari' => 'required',
        ],[ //setting pesan error
            'jenis_barang.required'=>'Jenis Barang wajib di isi',
            //'nama_barang.required'=>'Nama Barang wajib di isi',
            'ket.required'=>'Keterangan wajib di isi',
            'satuan.required'=>'Satuan wajib di isi',
            'perangkat_daerah.required'=>'Perangkat daerah wajib di isi',
            'jml_barang.required'=>'Jumlah barang wajib di isi',
            'jml_barang_awal.required'=>'Jumlah barang wajib di isi',
            'Tanggal.required'=>'Tanggal wajib di isi',
            'dari.required'=>'Dari wajib di isi',
        ]);


        //create data ke database
        $data =[
            'perangkat_daerah'=>$request->perangkat_daerah,
            'id_transaksi_masuk'=>$request->id_transaksi_masuk,
            'id_barang'=>$request->id_barang,
            'jenis_barang'=>$request->jenis_barang,
            'nama_barang'=>$barang,
            'jml_barang'=>$request->jml_barang,
            'harga_barang'=>$harga_brg,
            'kode'=>$kode,
            'jml_harga'=>$total,
            'jml_barang_awal'=>$request->jml_barang_awal,
            'jml_harga_awal'=>$total_awal,
            'ket'=>$request->ket,
            'satuan'=>$request->satuan,
            'Tanggal'=>$request->Tanggal,
            'dari'=>$request->dari,
            'nomor_dokumen_faktur'=>$request->nomor_dokumen_faktur,
            'tanggal_dokumen_faktur'=>$request->tanggal_dokumen_faktur,
            'nomor_ba_penerimaan'=>$request->nomor_ba_penerimaan,
            'tanggal_ba_penerimaan'=>$request->tanggal_ba_penerimaan,
        ];
        barangmasuk::where('id_transaksi_masuk',$id)->update($data); //nama database yang dituju
        //setelah menambahkan data maka akan kembali ke halaman databarang
        return redirect()->to('barangmasuk')->with('success','Berhasil melakukan update data');
        
    }




    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        barangmasuk::where('id_transaksi_masuk',$id)->delete();
        return redirect()->to('barangmasuk')->with('success','Berhasil melakukan delete');
    }

    public function unduhForm2(){
        $databarang= barangmasuk::all();
        $jenisbarang=jenisbarang::all();
        return view('barangmasuk.unduh2', compact('databarang', 'jenisbarang'));
    }

    public function PreviewUnduh($tglawal, $tglakhir, $kode, $perangkat_daerah = null)
    {
            // Mengubah waktu menjadi Indonesia
            Carbon::setLocale('id');
            $barangmasuk= barangmasuk::all();
            // Memperoleh user yang sedang login
            $user = Auth::user();
            
            // Query untuk memfilter barangmasuk berdasarkan rentang tanggal
            $barang = barangmasuk::whereBetween('Tanggal', [$tglawal, $tglakhir]);
            
            // Menambah kondisi berdasarkan jenis barang jika bukan 'semua'
        if ($kode && $kode != 'semua') {
            // Mencari jenis barang berdasarkan nama yang cocok
            $barang->where(function ($query) use ($kode) {
                $query->where('kode', 'like', '%' . $kode . '%');
            });
        }
            
            // Menambah kondisi berdasarkan perangkat daerah jika role adalah pengelola_barang
            if ($user->role == 'pengelola_barang' && $perangkat_daerah !== null && $perangkat_daerah != 'SE-KECAMATAN') {
                $barang->where('perangkat_daerah', $perangkat_daerah);
            }
            
            // Menambah kondisi berdasarkan peran/role pengguna
            if (!in_array($user->role, ['pengelola_barang', 'ketua'])) {
                $barang->where('created_by', $user->email);
            }
            $jenis= jenisbarang::all();
            // Mengambil hasil query
            $unduh = $barang->get();
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
            $tanggal = Carbon::parse($tglakhir)->format('d'); // Mengambil tanggal dalam format dua digit
            
            
            // Mengirimkan data ke view
            return view('barangmasuk.show', compact('unduh','barangmasuk','ttd_surat','jenis', 'tglawal', 'tglakhir', 'bulanAwal', 'bulanAkhir', 'tahunAwal', 'tahunAkhir', 'perangkat_daerah', 'kode', 'tanggal'));
    }

    public function unduhPertanggal2($tglawal, $tglakhir, $kode, $perangkat_daerah = null)
{
    // Panggil fungsi PreviewUnduh untuk mendapatkan data yang sama
    $previewData = $this->PreviewUnduh($tglawal, $tglakhir, $kode, $perangkat_daerah);

    // Ekstrak data dari hasil preview
    $ttd_surat= $previewData->getData()['ttd_surat'];
    $unduh = $previewData->getData()['unduh'];
    $jenis = $previewData->getData()['jenis'];
    $bulanAwal = $previewData->getData()['bulanAwal'];
    $bulanAkhir = $previewData->getData()['bulanAkhir'];
    $tahunAwal = $previewData->getData()['tahunAwal'];
    $tahunAkhir = $previewData->getData()['tahunAkhir'];
    $tanggal = $previewData->getData()['tanggal'];
    $perangkat_daerah = $previewData->getData()['perangkat_daerah'];
    $kode = $previewData->getData()['kode'];

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
    $html = View::make('barangmasuk.unduhPertanggal2', compact('unduh','ttd_surat', 'jenis', 'tglawal', 'tglakhir', 'bulanAwal', 'bulanAkhir', 'tahunAwal', 'tahunAkhir', 'perangkat_daerah', 'kode', 'tanggal'))->render();

    // Memuat konten HTML ke DOMPDF
    $dompdf->loadHtml($html);

    // Render PDF (optional: bisa dipanggil methods render() atau stream())
    $dompdf->render();
    //session()->flash('success', 'Berhasil mengunduh file PDF.');
    // Mengunduh PDF ke pengguna
    return $dompdf->stream('Barangmasuk.pdf');
}

public function unduh($tglawal, $tglakhir, $kode)
{
    Carbon::setLocale('id');
    $user = Auth::user();
    $unduh = null;
    
    // Pengaturan query berdasarkan peran pengguna
    if ($user->role == 'pengelola_barang' || $user->role == 'ketua') {
        // Admin dan ketua bisa melihat semua data
        $unduh = barangmasuk::whereBetween('Tanggal', [$tglawal, $tglakhir]);
    } else {
        // Pengguna biasa hanya bisa melihat data yang mereka buat
        $unduh = barangmasuk::whereBetween('Tanggal', [$tglawal, $tglakhir])
                            ->where('created_by', $user->email);
    }

    // Filter berdasarkan kode jika diberikan
    if ($kode && $kode != 'semua') {
        $unduh->where('kode', 'like', '%' . $kode . '%');
    }
    // Ambil hasil dari query
    $unduh = $unduh->get();

    $perangkat_daerah = '-';
    if ($unduh->isNotEmpty()) {
        $perangkat_daerah = $unduh->first()->perangkat_daerah;
    }
    $ttd_surat = ttd_surat::where(function ($query) use ($perangkat_daerah) {
        if ($perangkat_daerah == 'SE-KECAMATAN') {
            $query->where('unit_kerja', 'KECAMATAN ASTANAANYAR');
        } else {
            $query->where('unit_kerja', 'like', '%' . $perangkat_daerah . '%');
        }
    })->get();

    $jenis= jenisbarang::all();
    // Menggunakan Carbon untuk mendapatkan nama bulan dari tanggal awal dan akhir
    $bulanAwal = Carbon::parse($tglawal)->locale('id')->isoFormat('MMMM');
    $bulanAkhir = Carbon::parse($tglakhir)->locale('id')->isoFormat('MMMM');
    $tahunAwal = Carbon::parse($tglawal)->format('Y');
    $tahunAkhir = Carbon::parse($tglakhir)->format('Y');
    $tanggal = Carbon::parse($tglakhir)->format('d');

    return view('barangmasuk.show', compact('unduh', 'kode', 'perangkat_daerah', 'tglawal', 
        'tglakhir', 'bulanAwal', 'bulanAkhir', 'tahunAwal', 'tahunAkhir', 'tanggal','ttd_surat'));
}

   
public function unduhKelurahan($tglawal, $tglakhir, $kode, $perangkat_daerah = null)
{
    // Panggil fungsi PreviewUnduh untuk mendapatkan data yang sama
    $previewData = $this->unduh($tglawal, $tglakhir, $kode, $perangkat_daerah);

    // Ekstrak data dari hasil preview
    $unduh = $previewData->getData()['unduh'];
    //$jenis = $previewData->getData()['jenis'];
    $ttd_surat= $previewData->getData()['ttd_surat'];
    $bulanAwal = $previewData->getData()['bulanAwal'];
    $bulanAkhir = $previewData->getData()['bulanAkhir'];
    $tahunAwal = $previewData->getData()['tahunAwal'];
    $tahunAkhir = $previewData->getData()['tahunAkhir'];
    $tanggal = $previewData->getData()['tanggal'];
    $perangkat_daerah = $previewData->getData()['perangkat_daerah'];
    $kode = $previewData->getData()['kode'];

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
    $html = View::make('barangmasuk.unduhPertanggal2', compact('unduh','ttd_surat', 'tglawal', 'tglakhir', 'bulanAwal', 'bulanAkhir', 'tahunAwal', 'tahunAkhir', 'perangkat_daerah', 'kode', 'tanggal'))->render();

    // Memuat konten HTML ke DOMPDF
    $dompdf->loadHtml($html);

    // Render PDF (optional: bisa dipanggil methods render() atau stream())
    $dompdf->render();
    //session()->flash('success', 'Berhasil mengunduh file PDF.');
    // Mengunduh PDF ke pengguna
    return $dompdf->stream('Barangmasuk.pdf');
}

}

/*
    public function unduh($tglawal,$tglakhir){
        Carbon::setLocale('id');
        $user = Auth::user();
    if ($kode && $kode != 'semua') {
            // Mencari jenis barang berdasarkan nama yang cocok
            $barang->where(function ($query) use ($kode) {
                $query->where('kode', 'like', '%' . $kode . '%');
            });
        }
    if ($user->role == 'pengelola_barang' || $user->role == 'ketua') {
        // Admin dan ketua bisa melihat semua data
        $unduh = barangmasuk::whereBetween('Tanggal', [$tglawal, $tglakhir])->get();
    } else {
        // Pengguna biasa hanya bisa melihat data yang mereka buat
        $unduh = barangmasuk::whereBetween('Tanggal', [$tglawal, $tglakhir])
            ->where('created_by', $user->email)
            ->get();
    }
     // Menggunakan Carbon untuk mendapatkan nama bulan dari tanggal awal dan akhir
     $bulanAwal = Carbon::parse($tglawal)->format('F'); // Mengambil nama bulan
     $bulanAkhir = Carbon::parse($tglakhir)->format('F'); // Mengambil nama bulan
     $tahunAwal = Carbon::parse($tglawal)->format('Y');//Mengambil nama Tahun
 
     return view('barangmasuk.unduhPertanggal2', compact('unduh', 'tglawal', 'tglakhir', 'bulanAwal', 'bulanAkhir','tahunAwal'));

}
 */
