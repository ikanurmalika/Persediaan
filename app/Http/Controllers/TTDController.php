<?php

namespace App\Http\Controllers;

use App\Models\ttd_surat;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class TTDController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $katakunci= $request->katakunci;
        $jumlahbaris =10;
        if(strlen($katakunci)){
            $data= ttd_surat::where('unit_kerja','like',"%$katakunci%")
            ->orwhere('semester','like',"%$katakunci%")
            ->orwhere('tanggal','like',"%$katakunci%")
            ->paginate($jumlahbaris);
        }else{
            $data = ttd_surat::orderBy('created_at','desc')->paginate($jumlahbaris);
        }
        
        return view('ttd_surat.index')->with('data',$data);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $ttd_surat =ttd_surat::all();
        return view('ttd_surat.create',compact('ttd_surat'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        Session::flash('unit_kerja',$request->unit_kerja);
        Session::flash('nama1',$request->nama1);
        Session::flash('nip1',$request->nip1);
        Session::flash('jabatan1',$request->jabatan1);
        Session::flash('nama2',$request->nama2);
        Session::flash('nip2',$request->nip2);
        Session::flash('jabatan2',$request->jabatan2);
        Session::flash('nama3',$request->nama3);
        Session::flash('nip3',$request->nip3);
        Session::flash('jabatan3',$request->jabatan3);
        //validasi data yang harus di isi
        $request->validate([
            'unit_kerja' => 'required|unique:ttd_surat,unit_kerja',
            'nama1' => 'required',
            'nip1' => 'required',
            'jabatan1' =>'required',
            'nama2' => 'required',
            'nip2' => 'required',
            'jabatan2' =>'required',

        ],[ //setting pesan error
            
            'unit_kerja.required'=>'Unit Kerja wajib di isi',
            'unit_kerja.unique'=>'Unit Kerja sudah terdaftar,silahkan isi unit kerja yang lain',
            'nama1.required'=>'Nama wajib di isi',
            'nip1.required'=>'NIP wajib di isi',
            'jabatan1.required'=>'Jabatan wajib di isi',
            'nama2.required'=>'Nama wajib di isi',
            'nip2.required'=>'NIP wajib di isi',
            'jabatan2.required'=>'Jabatan wajib di isi',
        ]);
        
        //create data ke database
        $data =[
           'unit_kerja'=>$request->unit_kerja,
            'nama1'=>$request->nama1,
            'nip1'=>$request->nip1,
            'jabatan1'=>$request->jabatan1,
            'nama2'=>$request->nama2,
            'nip2'=>$request->nip2,
            'jabatan2'=>$request->jabatan2,
            'nama3'=>$request->nama3,
            'nip3'=>$request->nip3,
            'jabatan3'=>$request->jabatan3
        ];
        
        ttd_surat::create($data); 
        return redirect()->to('TTD-Surat')->with('success','Berhasil menambahkan data');
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
        $data = ttd_surat::where('unit_kerja',$id)->first();
        return view('ttd_surat.edit')->with('data',$data);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'nama1' => 'required',
            'nip1' => 'required',
            'jabatan1' =>'required',
            'nama2' => 'required',
            'nip2' => 'required',
            'jabatan2' =>'required',

        ],[ //setting pesan error
            
            'nama1.required'=>'Nama wajib di isi',
            'nip1.required'=>'NIP wajib di isi',
            'jabatan1.required'=>'Jabatan wajib di isi',
            'nama2.required'=>'Nama wajib di isi',
            'nip2.required'=>'NIP wajib di isi',
            'jabatan2.required'=>'Jabatan wajib di isi',
        ]);
        
        //create data ke database
        $data =[
           'unit_kerja'=>$request->unit_kerja,
            'nama1'=>$request->nama1,
            'nip1'=>$request->nip1,
            'jabatan1'=>$request->jabatan1,
            'nama2'=>$request->nama2,
            'nip2'=>$request->nip2,
            'jabatan2'=>$request->jabatan2,
            'nama3'=>$request->nama3,
            'nip3'=>$request->nip3,
            'jabatan3'=>$request->jabatan3
        ];
        
        ttd_surat::where('unit_kerja',$id)->update($data);
        return redirect()->to('TTD-Surat')->with('success','Berhasil update data');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        ttd_surat::where('unit_kerja',$id)->delete();
        return redirect()->to('TTD-Surat')->with('success','Berhasil menghapus data');
    }
}
