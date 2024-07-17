<?php

namespace App\Http\Controllers;

use App\Models\databarang;
use App\Models\PengajuanBarang;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class PengajuanBarangcontroller extends Controller
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
                $data = PengajuanBarang::where(function ($query) use ($katakunci) {
                    $query->where('id_pengajuan','like',"%$katakunci%")
                    ->orwhere('nama','like',"%$katakunci%")
                    ->orwhere('nama_barang','like',"%$katakunci%")
                    ->orwhere('jml_barang','like',"%$katakunci%")
                    ->orwhere('jabatan','like',"%$katakunci%")
                    ->orwhere('status','like',"%$katakunci%");
                })->paginate($jumlahbaris);
            } else {
                $data = PengajuanBarang::orderBy('id_pengajuan', 'desc')->paginate($jumlahbaris);
            }
        } else {
            // Pengguna biasa hanya dapat melihat data yang mereka input
            if (strlen($katakunci)) {
                $data = PengajuanBarang::where('created_by', $user->email)
                    ->where(function ($query) use ($katakunci) {
                        $query->where('id_pengajuan','like',"%$katakunci%")
                        ->orwhere('nama','like',"%$katakunci%")
                        ->orwhere('nama_barang','like',"%$katakunci%")
                        ->orwhere('jml_barang','like',"%$katakunci%")
                        ->orwhere('jabatan','like',"%$katakunci%")
                        ->orwhere('status','like',"%$katakunci%");
                    })
                    ->paginate($jumlahbaris);
            } else {
                $data = PengajuanBarang::where('created_by', $user->email)
                    ->orderBy('id_pengajuan', 'desc')
                    ->paginate($jumlahbaris);
            }
        }

        return view('pengajuan.index')->with('data', $data);
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
        
    $Barang = PengajuanBarang::latest()->first();

    if ($Barang === null) {
        $no_urut = "0001";
    } else {
        //menambahkan 4 digit terakhir dan increment 1
        $id = intval(substr($Barang->id_pengajuan, -4));
        $no_urut = str_pad($id + 1, 4, "0", STR_PAD_LEFT);
    }
    $id_pengajuan = "1" . $no_urut;

        Session::flash('id_pengajuan',$request->id_pengajuan);
        Session::flash('nama',$request->nama);
        Session::flash('nama_barang',$request->nama_barang);
        Session::flash('jml_barang',$request->jml_barang);
        //validasi data yang harus di isi
       $request->validate([
         
            'nama' =>'required',
            'jml_barang' => 'required',
            'nama_barang' => 'required',
        ],[ //setting pesan error
            
            'nama.required'=>'Nama wajib diisi',
            'jml_barang.required'=>'Jumlah Barang wajib di isi',
            'nama_barang.required'=>'Nama Barang wajib di isi',
        ]);

        //create data ke database
        $data =[
            'id_pengajuan'=>$id_pengajuan,
            'nama'=>$request->nama,
            'nama_barang'=>$request->nama_barang,
            'jml_barang'=>$request->jml_barang,
            'jabatan'=>$request->jabatan,
            'status'=>$request->status,
            'created_by' => Auth::user()->email, 
        ];
        PengajuanBarang::create($data); //nama database yang dituju
        //setelah menambahkan data maka akan kembali ke halaman databarang
        return redirect()->to('pengajuan')->with('success','Berhasil menambahkan data');
    }

    /**
     * Display the specified resource.
     */
    

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        PengajuanBarang::where('id_pengajuan',$id)->delete();
        return redirect()->to('pengajuan')->with('success','Data berhasil dihapus');
    }
    
}
