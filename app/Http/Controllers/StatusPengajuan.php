<?php

namespace App\Http\Controllers;

use App\Models\databarang;
use App\Models\PengajuanBarang;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class StatusPengajuan extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $katakunci= $request->katakunci;
        $jumlahbaris =10;
        if(strlen($katakunci)){
            $data= PengajuanBarang::where('id_pengajuan','like',"%$katakunci%")
            ->orwhere('nama','like',"%$katakunci%")
            ->orwhere('nama_barang','like',"%$katakunci%")
            ->orwhere('jml_barang','like',"%$katakunci%")
            ->orwhere('jabatan','like',"%$katakunci%")
            ->orwhere('status','like',"%$katakunci%")
            ->paginate($jumlahbaris);
        }else{
            $data = PengajuanBarang::orderBy('id_pengajuan','desc')->paginate($jumlahbaris);
        }
        
        return view('pengajuan.index_admin')->with('data',$data);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $databarang = databarang::all();
        return view('pengajuan.create',compact('databarang'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        Session::flash('id_pengajuan',$request->id_pengajuan);
        Session::flash('nama',$request->nama);
        Session::flash('nama_barang',$request->nama_barang);
        Session::flash('jml_barang',$request->jml_barang);
        //validasi data yang harus di isi
       $request->validate([
            'id_pengajuan' =>'required|numeric|unique:pengajuan_barangs,id_pengajuan',
            'nama' =>'required',
            'jml_barang' => 'required',
            'nama_barang' => 'required',
        ],[ //setting pesan error
            'id_pengajuan.required'=>'ID Pengajuan wajib diisi',
            'id_pengajuan.numeric'=>'ID Pengajuan harus berupa angka',
            'id_pengajuan.unique'=>'ID Pengajuan yang diisi sudah ada ',
            'nama.required'=>'Nama wajib diisi',
            'jml_barang.required'=>'Jumlah Barang wajib di isi',
            'nama_barang.required'=>'Nama Barang wajib di isi',
        ]);

        //create data ke database
        $data =[
            'id_pengajuan'=>$request->id_pengajuan,
            'nama'=>$request->nama,
            'nama_barang'=>$request->nama_barang,
            'jml_barang'=>$request->jml_barang,
            'jabatan'=>$request->jabatan,
            'status'=>$request->status,
        ];
        PengajuanBarang::create($data); //nama database yang dituju
        //setelah menambahkan data maka akan kembali ke halaman databarang
        return redirect()->to('statuspengajuan')->with('success','Berhasil menambahkan data');
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
        $data = PengajuanBarang::where('id_pengajuan',$id)->first();
       return view('pengajuan.update')->with('data',$data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        
        //create data ke database
        $data =[
            'id_pengajuan'=>$request->id_pengajuan,
            'nama'=>$request->nama,
            'nama_barang'=>$request->nama_barang,
            'jml_barang'=>$request->jml_barang,
            'jabatan'=>$request->jabatan,
            'status'=>$request->status,
        ];
        PengajuanBarang::where('id_pengajuan',$id)->update($data); //nama database yang dituju
        //setelah menambahkan data maka akan kembali ke halaman databarang
        return redirect()->to('statuspengajuan')->with('success','Berhasil melakukan update data');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        
        PengajuanBarang::where('id_pengajuan',$id)->delete();
        return redirect()->to('statuspengajuan')->with('success','Berhasil melakukan delete');
    }

    public function updateStatus( string $id){
       
        $data = PengajuanBarang::findOrFail('id_pengajuan',$id);
        $data->status = 'Diterima';
        $data->save();
        return redirect()->back()->with('success', 'Status sudah diupdate');
    }


}
