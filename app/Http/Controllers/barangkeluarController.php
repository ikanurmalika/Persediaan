<?php

namespace App\Http\Controllers;
use App\Models\barangkeluar;
use App\Models\databarang;
use App\Models\jenisbarang;
use App\Models\ttd_surat;
use Carbon\Carbon;
use Dompdf\Dompdf;
use Dompdf\Options;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\View;

class barangkeluarController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
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
                $data = barangkeluar::where(function ($query) use ($katakunci) {
                    $query->where('id_barang','like',"%$katakunci%")
                    ->orwhere('perangkat_daerah','like',"%$katakunci%")
                    ->orwhere('jenis_barang','like',"%$katakunci%")
                    ->orwhere('nama_barang','like',"%$katakunci%")
                    ->orwhere('jml_barang','like',"%$katakunci%")
                    ->orwhere('harga_barang','like',"%$katakunci%")
                    ->orwhere('untuk','like',"%$katakunci%")
                    ->orwhere('ket','like',"%$katakunci%")
                    ->orwhere('Tanggal','like',"%$katakunci%");
                })->paginate($jumlahbaris);
            } else {
                $data = barangkeluar::orderBy('id_transaksi_keluar', 'desc')->paginate($jumlahbaris);
            }
        } else {
            // Pengguna biasa hanya dapat melihat data yang mereka input
            if (strlen($katakunci)) {
                $data = barangkeluar::where('created_by', $user->email)
                    ->where(function ($query) use ($katakunci) {
                        $query->where('id_barang','like',"%$katakunci%")
                        ->orwhere('perangkat_daerah','like',"%$katakunci%")
                        ->orwhere('jenis_barang','like',"%$katakunci%")
                        ->orwhere('nama_barang','like',"%$katakunci%")
                        ->orwhere('jml_barang','like',"%$katakunci%")
                        ->orwhere('harga_barang','like',"%$katakunci%")
                        ->orwhere('untuk','like',"%$katakunci%")
                        ->orwhere('ket','like',"%$katakunci%")
                        ->orwhere('Tanggal','like',"%$katakunci%");
                    })
                    ->paginate($jumlahbaris);
            } else {
                $data = barangkeluar::where('created_by', $user->email)
                    ->orderBy('id_transaksi_keluar', 'desc')
                    ->paginate($jumlahbaris);
            }
        }

        return view('barangkeluar.index')->with('data', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request, )
    {
        $databarang = databarang::all();
        $jenisbarang =jenisbarang::all();
        return view('barangkeluar.create',compact('databarang','jenisbarang'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
    //buat id transaksi otomatis
        $barang= barangkeluar::latest()->first();
        
        $barang_id ="2";
        if ($barang==null){
            //kode pertama
            $nomor_urut ="000001";
        }else {
            
            $nomor_urut=intval(substr($barang->id_transaksi_keluar,1,4))+1;
            $nomor_urut=str_pad($nomor_urut,6,"0", STR_PAD_LEFT);
        }
        $idtransaksi= $barang_id. $nomor_urut;
        
    //untuk mengisi id barang berdasarkan nama_barang  
        // Cari id_barang berdasarkan nama_barang
        //$databrg = Databarang::where('nama_barang', $nama_barang)->first();
        $databrg = Databarang::where('id_barang', $request->id_barang)
                ->first();
        // Jika barang ditemukan, kembalikan id_barang
        if ($databrg) {
            $barang= $databrg->nama_barang;
            $hargabarang=$databrg->harga;
        } else {
            // Jika barang tidak ditemukan, kembalikan null atau pesan error
            $barang= '-';
            $hargabarang='0';
        }
        $jenisbarang= jenisbarang::where('jenis_barang',$request->jenis_barang)->first();
           if ($jenisbarang){
            $kode= $jenisbarang->kode;
           }else{
            $kode='-';
           }
        //$id_brg =$barangId;
        $harga_brg=$hargabarang;
        $jumlah_barang = $request->jml_barang;
        $total =+ $harga_brg* $jumlah_barang;

        Session::flash('id_barang',$request->id_barang);
        Session::flash('id_barang',$request->id_transaksi_keluar);
        Session::flash('jenis_barang',$request->jenis_barang);
        Session::flash('nama_barang',$request->nama_barang);
        Session::flash('harga_barang',$harga_brg);
        //validasi data yang harus di isi
       $request->validate([
            
            'jenis_barang' => 'required',
            'id_barang' => 'required',
            'untuk' => 'required',
            'ket' => 'required',
            'satuan' => 'required',
            'perangkat_daerah' => 'required',
            'jml_barang' => 'required',
            'Tanggal' => 'required',
        ],[ //setting pesan error
            
            'jenis_barang.required'=>'Jenis Barang wajib di isi',
            'id_barang.required'=>'Nama Barang wajib di isi',
            'untuk.required'=>'Untuk wajib di isi',
            'ket.required'=>'Keterangan wajib di isi',
            'satuan.required'=>'Satuan wajib di isi',
            'perangkat_daerah.required'=>'Perangkat daerah wajib di isi',
            'jml_barang.required'=>'Jumlah barang wajib di isi',
            'Tanggal.required'=>'Tanggal wajib di isi',
        ]);

        //create data ke database
        $data =[
            'perangkat_daerah'=>$request->perangkat_daerah,
            'id_transaksi_keluar'=>$idtransaksi,
            'id_barang'=>$request->id_barang,
            'kode'=>$kode,
            'jenis_barang'=>$request->jenis_barang,
            'nama_barang'=>$barang,
            'jml_barang'=>$request->jml_barang,
            'harga_barang'=>$harga_brg,
            'untuk'=>$request->untuk,
            'ket'=>$request->ket,
            'Tanggal'=>$request->Tanggal,
            'total_harga_keluar'=>$total,
            'satuan'=>$request->satuan,
            'created_by' => Auth::user()->email, 
        ];
        barangkeluar::create($data); //nama database yang dituju
        //setelah menambahkan data maka akan kembali ke halaman databarang
        return redirect()->to('barangkeluar')->with('success','Berhasil menambahkan data');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        // menyimpan nilai jenis_barang dalam session untuk menampilkannya di antarmuka pengguna
       $databarang= databarang::all();
       $jenisbarang=jenisbarang::all();
       $data = barangkeluar::where('id_transaksi_keluar',$id)->first();
       return view('barangkeluar.edit',compact('databarang','jenisbarang'))->with('data',$data);

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $nama_barang = $request->nama_barang;
        // Cari id_barang berdasarkan nama_barang
        //$databrg = Databarang::where('nama_barang', $nama_barang)->first();
        $databrg = Databarang::where('id_barang', $request->id_barang)
                ->first();
        // Jika barang ditemukan, kembalikan id_barang
        if ($databrg) {
            $barang= $databrg->nama_barang;
            $hargabarang=$databrg->harga;
        } else {
            // Jika barang tidak ditemukan, kembalikan null atau pesan error
            $barang= '-';
            $hargabarang='0';
        }
        $jenisbarang= jenisbarang::where('jenis_barang',$request->jenis_barang)->first();
           if ($jenisbarang){
            $kode= $jenisbarang->kode;
           }else{
            $kode='-';
           }
        //$id_brg =$barangId;
        $harga_brg=$hargabarang;
        $jumlah_barang = $request->jml_barang;
        $total =+ $harga_brg* $jumlah_barang;
        $request->validate([
            
            'jenis_barang' => 'required',
            'id_barang' => 'required',
            'untuk' => 'required',
            'ket' => 'required',
            'satuan' => 'required',
            'perangkat_daerah' => 'required',
            'jml_barang' => 'required',
            'Tanggal' => 'required',
        ],[ //setting pesan error
            
            'jenis_barang.required'=>'Jenis Barang wajib di isi',
            'id_barang.required'=>'Nama Barang wajib di isi',
            'untuk.required'=>'Untuk wajib di isi',
            'ket.required'=>'Keterangan wajib di isi',
            'satuan.required'=>'Satuan wajib di isi',
            'perangkat_daerah.required'=>'Perangkat daerah wajib di isi',
            'jml_barang.required'=>'Jumlah barang wajib di isi',
            'Tanggal.required'=>'Tanggal wajib di isi',
        ]);
        $create = Auth::user()->email;
        //create data ke database
        $data =[
            'perangkat_daerah'=>$request->perangkat_daerah,
            'id_transaksi_keluar'=>$request->id_transaksi_keluar,
            'id_barang'=>$request->id_barang,
            'jenis_barang'=>$request->jenis_barang,
            'kode'=>$kode,
            'nama_barang'=>$barang,
            'jml_barang'=>$request->jml_barang,
            'harga_barang'=>$harga_brg,
            'untuk'=>$request->untuk,
            'ket'=>$request->ket,
            'Tanggal'=>$request->Tanggal,
            'total_harga_keluar'=>$total,
            'satuan'=>$request->satuan,
            'created_by' =>$create,
        ];
        //create data ke database
        barangkeluar::where('id_transaksi_keluar',$id)->update($data); //nama database yang dituju
        //setelah menambahkan data maka akan kembali ke halaman databarang
        return redirect()->to('barangkeluar')->with('success','Berhasil melakukan update data');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        barangkeluar::where('id_transaksi_keluar',$id)->delete();
        return redirect()->to('barangkeluar')->with('success','Berhasil menghapus data');
    }

    public function unduhForm(){
        $databarang= databarang::all();
        $jenisbarang=jenisbarang::all();
        return view('barangkeluar.unduh',compact('databarang','jenisbarang'));
    }
//untuk pengelola_barang
    public function PreviewUnduh($tglawal, $tglakhir, $kode, $perangkat_daerah = null)
    {
            // Mengubah waktu menjadi Indonesia
            Carbon::setLocale('id');
            
            // Memperoleh user yang sedang login
            $user = Auth::user();
            
            // Query untuk memfilter barangmasuk berdasarkan rentang tanggal
            $barang = barangkeluar::whereBetween('Tanggal', [$tglawal, $tglakhir]);
            
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
            return view('barangkeluar.show', compact('unduh','ttd_surat','jenis', 'tglawal', 'tglakhir', 'bulanAwal', 'bulanAkhir', 'tahunAwal', 'tahunAkhir', 'perangkat_daerah', 'kode', 'tanggal'));
    }
//untuk pengelola_barang
    public function unduhPertanggal($tglawal, $tglakhir, $kode, $perangkat_daerah = null)
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
    $html = View::make('barangkeluar.unduhPertanggal', compact('unduh','ttd_surat', 'jenis', 'tglawal', 'tglakhir', 'bulanAwal', 'bulanAkhir', 'tahunAwal', 'tahunAkhir', 'perangkat_daerah', 'kode', 'tanggal'))->render();

    // Memuat konten HTML ke DOMPDF
    $dompdf->loadHtml($html);

    // Render PDF (optional: bisa dipanggil methods render() atau stream())
    $dompdf->render();
    //session()->flash('success', 'Berhasil mengunduh file PDF.');
    // Mengunduh PDF ke pengguna
    return $dompdf->stream('BukuPengeluaran.pdf');
}

//untuk kelurahan
public function unduh($tglawal, $tglakhir, $kode)
{
    Carbon::setLocale('id');
    $user = Auth::user();
    //$perangkat_daerah = '-';
    $unduh = null;

    // Pengaturan query berdasarkan peran pengguna
    if ($user->role == 'pengelola_barang' || $user->role == 'ketua') {
        // Admin dan ketua bisa melihat semua data
        $unduh = barangkeluar::whereBetween('Tanggal', [$tglawal, $tglakhir]);
    } else {
        // Pengguna biasa hanya bisa melihat data yang mereka buat
        $unduh = barangkeluar::whereBetween('Tanggal', [$tglawal, $tglakhir])
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
    // Menggunakan Carbon untuk mendapatkan nama bulan dari tanggal awal dan akhir
    $bulanAwal = Carbon::parse($tglawal)->locale('id')->isoFormat('MMMM');
    $bulanAkhir = Carbon::parse($tglakhir)->locale('id')->isoFormat('MMMM');
    $tahunAwal = Carbon::parse($tglawal)->format('Y');
    $tahunAkhir = Carbon::parse($tglakhir)->format('Y');
    $tanggal = Carbon::parse($tglakhir)->format('d');

    return view('barangkeluar.show', compact('unduh','ttd_surat', 'kode', 'perangkat_daerah', 'tglawal', 
        'tglakhir', 'bulanAwal', 'bulanAkhir', 'tahunAwal', 'tahunAkhir', 'tanggal'));
}


public function download($tglawal, $tglakhir, $kode, $perangkat_daerah = null)
{
    // Panggil fungsi PreviewUnduh untuk mendapatkan data yang sama
    $previewData = $this->unduh($tglawal, $tglakhir, $kode, $perangkat_daerah);

    // Ekstrak data dari hasil preview
    $ttd_surat= $previewData->getData()['ttd_surat'];
    $unduh = $previewData->getData()['unduh'];
   // $jenis_barang = $previewData->getData()['jenis_barang'];
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
    $html = View::make('barangkeluar.unduhPertanggal', compact('unduh','ttd_surat', 'tglawal', 'tglakhir', 'bulanAwal', 'bulanAkhir', 'tahunAwal', 'tahunAkhir', 'perangkat_daerah', 'kode', 'tanggal'))->render();

    // Memuat konten HTML ke DOMPDF
    $dompdf->loadHtml($html);

    // Render PDF (optional: bisa dipanggil methods render() atau stream())
    $dompdf->render();
    //session()->flash('success', 'Berhasil mengunduh file PDF.');
    // Mengunduh PDF ke pengguna
    return $dompdf->stream('BukuPengeluaran.pdf');
}
    /*
    public function unduhPertanggal(Request $request,$tglawal,$tglakhir,$namabarang, $perangkat_daerah){
        //dd(["Tanggal Awal :".$tglawal,"Tanggal Akhir :".$tglakhir]);
        $databarang= databarang::all();
        Carbon::setLocale('id');
        $user = Auth::user();

    if ($user->role == 'pengelola_barang' || $user->role == 'ketua') {
        // Admin dan ketua bisa melihat semua data
        $unduh = barangkeluar::whereBetween('Tanggal', [$tglawal, $tglakhir],'nama_barang',$namabarang, 'perangkat_daerah',$perangkat_daerah)->get();
    } else {
        // Pengguna biasa hanya bisa melihat data yang mereka buat
        $unduh = barangkeluar::whereBetween('Tanggal', [$tglawal, $tglakhir],'nama_barang',$namabarang)
            ->where('created_by', $user->email)
            ->get();
    }
     // Menggunakan Carbon untuk mendapatkan nama bulan dari tanggal awal dan akhir
     $bulanAwal = Carbon::parse($tglawal)->format('F'); // Mengambil nama bulan
     $bulanAkhir = Carbon::parse($tglakhir)->format('F'); // Mengambil nama bulan
     $tahunAwal = Carbon::parse($tglawal)->format('Y');//Mengambil nama Tahun
 
     return view('barangkeluar.unduhPertanggal', compact('unduh', 'tglawal', 'tglakhir', 'bulanAwal'
     , 'bulanAkhir','tahunAwal','namabarang','perangkat_daerah','databarang'));

    }

    */

}
