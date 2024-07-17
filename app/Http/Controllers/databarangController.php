<?php

namespace App\Http\Controllers;

//use App\Models\data_barang;

use App\barang;
use App\Models\databarang;
use App\Models\jenisbarang;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class databarangController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $katakunci= $request->katakunci;
        $jumlahbaris =10;
        if(strlen($katakunci)){
            $data= databarang::where('id_barang','like',"%$katakunci%")
            ->orwhere('jenis_barang','like',"%$katakunci%")
            ->orwhere('nama_barang','like',"%$katakunci%")
            ->paginate($jumlahbaris);
        }else{
            $data = databarang::orderBy('id_barang','desc')->paginate($jumlahbaris);
        }
        
        return view('databarang.index')->with('data',$data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $jenisbarang =jenisbarang::all();
        return view('databarang.create',compact('jenisbarang'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //untuk mengisi id barang berdasarkan jenis_barang  
        $jenis_barang = $request->jenis_barang;
        // Cari id_barang berdasarkan jenis_barang
        $jenisbrg = jenisbarang::where('jenis_barang', $jenis_barang)->first();
        // Jika barang ditemukan, kembalikan kode_barang
        if ($jenisbrg) {
            $kode_barang= $jenisbrg->kode;
        } else {
            // Jika barang tidak ditemukan, kembalikan null atau pesan error
            $kode_barang='0';
        }
        $kode =$kode_barang;

        $barang= databarang::latest()->first();
        //$kodebarang=databarang::latest()->first();
        $barang_id ="1";
        //$kode="5.1.02.01.01.";
        if ($barang == null ){
            //kode pertama
            $nomor_urut ="00001";
            $nomor ="0001";
        }else {
            
            $nomor_urut=substr($barang->id_barang,1,5)+1;
            $nomor_urut=str_pad($nomor_urut,5,"0", STR_PAD_LEFT);
            //$nomor=intval(substr($kodebarang->kode,13,4))+1;
            //$nomor=str_pad($nomor,4,"0", STR_PAD_LEFT);
        }
        $idbarang= $barang_id. $nomor_urut;
        //$kdbarang= $kode.$nomor;

        Session::flash('id_barang',$idbarang);
        Session::flash('kode',$kode);
        Session::flash('jenis_barang',$request->jenis_barang);
        Session::flash('nama_barang',$request->nama_barang);
        Session::flash('harga',$request->harga);
        //validasi data yang harus di isi
        $request->validate([
            'jenis_barang' => 'required',
            'nama_barang' => 'required',
            'harga' => 'required ',
            'harga' => 'numeric ',
        ],[ //setting pesan error
            'jenis_barang.required'=>'Jenis Barang wajib di isi',
            'nama_barang.required'=>'Nama Barang wajib di isi',
            'harga.numeric'=>'Harga harus berupa angka',
            'harga.required'=>'Harga wajib di isi',
        ]);
        
        //create data ke database
        $RequestData['id_barang']=$idbarang;
        $RequestKode['kode']=$kode;
        $data =[
            'id_barang'=>$idbarang,
            'kode'=>$kode,
            'jenis_barang'=>$request->jenis_barang,
            'nama_barang'=>$request->nama_barang,
            'harga'=>$request->harga
        ];
        
        databarang::create($data); 
        return redirect()->to('databarang')->with('success','Berhasil menambahkan data');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
       $data = databarang::where('id_barang',$id)->first();
       return view('databarang.edit')->with('data',$data);

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
        //untuk mengisi id barang berdasarkan jenis_barang  
        $jenis_barang = $request->jenis_barang;
        // Cari id_barang berdasarkan jenis_barang
        $jenisbrg = jenisbarang::where('jenis_barang', $jenis_barang)->first();
        // Jika barang ditemukan, kembalikan kode_barang
        if ($jenisbrg) {
            $kode_barang= $jenisbrg->kode;
        } else {
            // Jika barang tidak ditemukan, kembalikan null atau pesan error
            $kode_barang='0';
        }
        $kode =$kode_barang;

        $barang= databarang::latest()->first();
        //$kodebarang=databarang::latest()->first();
        $barang_id ="1";
        //$kode="5.1.02.01.01.";
        if ($barang == null ){
            //kode pertama
            $nomor_urut ="00001";
            $nomor ="0001";
        }else {
            
            $nomor_urut=substr($barang->id_barang,1,5)+1;
            $nomor_urut=str_pad($nomor_urut,5,"0", STR_PAD_LEFT);
            //$nomor=intval(substr($kodebarang->kode,13,4))+1;
            //$nomor=str_pad($nomor,4,"0", STR_PAD_LEFT);
        }
        $idbarang= $barang_id. $nomor_urut;
        $request->validate([
            'jenis_barang' => 'required',
            'nama_barang' => 'required',
            'harga' => 'required',
        ],[ //setting pesan error
            'jenis_barang.required'=>'Jenis Barang wajib di isi',
            'nama_barang.required'=>'Nama Barang wajib di isi',
            'harga.required'=>'Harga wajib di isi',
        ]);

        //create data ke database
        $data =[
            'kode'=>$request->kode,
            'id_barang'=>$idbarang,
            'jenis_barang'=>$request->jenis_barang,
            'nama_barang'=>$request->nama_barang,
            'harga'=>$request->harga,
        ];
        databarang::where('id_barang',$id)->update($data); //nama database yang dituju
        //setelah menambahkan data maka akan kembali ke halaman databarang
        return redirect()->to('databarang')->with('success','Berhasil melakukan update data');
        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        databarang::where('id_barang',$id)->delete();
        return redirect()->to('databarang')->with('success','Berhasil Berhasil menghapus data');
    }
}
