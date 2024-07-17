<?php

namespace App\Http\Controllers;

use App\Models\user;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

class penggunaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $katakunci= $request->katakunci;
        $jumlahbaris =10;
        if(strlen($katakunci)){
            $data= user::where('role','like',"%$katakunci%")
            ->orwhere('name','like',"%$katakunci%")
            ->orwhere('email','like',"%$katakunci%")
            ->orwhere('jabatan','like',"%$katakunci%")
            ->paginate($jumlahbaris);
        }else{
            $data = user::orderBy('id','desc')->paginate($jumlahbaris);
        }
        
        return view('pengguna.index')->with('data',$data);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {
        $user = user::all();
        //return view('pengguna.create',compact('user'));
        Session::flash('email',$request->email);
        Session::flash('password',$request->password);
        Session::flash('name',$request->name);
        Session::flash('role',$request->role);
        $request->validate([
            'email'=>'required|email|unique:user',
            'password'=>'required|min:6',
            'name'=>'required',
            'role'=>'required'
        ],[
            'email.required'=>'Email wajib diisi',
            'email.email'=>'Silahkan masukkan Email yang valid',
            'email.unique'=>'Email sudah digunakan, silahkan pilih email lain',
            'password.required'=>'Password wajib diisi',
            'password.min'=>'Minimum password yang diizinkan adalah 6 karakter',
            'name.required'=>'Nama wajib diisi',
            'Role.required'=>'Role wajib diisi',
        ]);
        $data =[
            'email'=>$request->email,
            'name'=>$request->name,
            'password'=>Hash::make($request->password),
            'jabatan'=>$request->jabatan,
            'nip'=>$request->nip,
            'role'=>$request->role
        ];
        User::create($data);
        //cek apakah email&password sudah sesuai?
        $info =[
            'email'=>$request->email,
            'password'=>$request->password,
        ];
        //pengecekan
        return redirect()->to('pengguna.modal.create')->with('success','Berhasil menambahkan data');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        Session::flash('email',$request->email);
        Session::flash('password',$request->password);
        Session::flash('name',$request->name);
        Session::flash('role',$request->role);
        //validasi data yang harus di isi
       $request->validate([
            'email' =>'required|unique:user,email',
            'name' => 'required',
            'jabatan' => 'required',
            'password'=>'required|min:6',
            'role' => 'required',
            'nip'=>'required',
        ],[ //setting pesan error
            'email.required'=>'Email wajib diisi',
            'email.unique'=>'Email yang diisi sudah ada ',
            'name.required'=>'Nama wajib di isi',
            'nip.required'=>'NIP wajib di isi',
            'jabatan.required'=>'Jabatan wajib di isi',
            'password.required'=>'Password wajib di isi',
            'password.min'=>'Minimum password yang diizinkan adalah 6 karakter',
            'role.required'=>'Role wajib di isi',
        ]);
        
        //create data ke database
        $data =[
            'email'=>$request->email,
            'name'=>$request->name,
            'password'=>Hash::make($request->password),
            'jabatan'=>$request->jabatan,
            'nip'=>$request->nip,
            'role'=>$request->role,
        ];
        if ($request->has('password') && !empty($request->password)) {
            if (strlen($request->password) < 6) {
                return redirect()->back()->withErrors('Minimum password yang diizinkan adalah 6 karakter')->withInput();
            }
            $data['password'] = Hash::make($request->password);
        }
        user::create($data); //nama database yang dituju
        //setelah menambahkan data maka akan kembali ke halaman databarang
        return redirect()->to('pengguna')->with('success','Berhasil menambahkan data');

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
    public function edit(Request $request,string $id)
    {
        $data =user::all();
        $data = user::where('email',$id)->first();
       return view('pengguna.edit',compact('data'))->with('data',$data);
   
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'email' =>'required',
            'name' => 'required',
            'jabatan' => 'required',
            'password'=>'required|min:6',
            'role' => 'required',
            'nip'=>'required',
        ],[ //setting pesan error
            'email.required'=>'Email wajib di isi',
            'nip.required'=>'NIP wajib di isi',
            'jabatan.required'=>'Jabatan wajib di isi',
            'password.min'=>'Minimum password yang diizinkan adalah 6 karakter',
            'password.required'=>'Password wajib di isi',
            'role.required'=>'Role wajib di isi',
        ]);

        //create data ke database
        $data =[
            'email'=>$request->email,
            'password'=>$request->password,
            'role'=>$request->role,
            'name'=>$request->name,
            'nip'=>$request->nip,
            'jabatan'=>$request->jabatan,
        ];
        if ($request->filled('password')) {
            $data['password'] = Hash::make($request->password); // Hash password
        }
        user::where('email',$id)->update($data); //nama database yang dituju
        //setelah menambahkan data maka akan kembali ke halaman databarang
        return redirect()->to('pengguna')->with('success','Berhasil melakukan update data');
        
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        user::where('email',$id)->delete();
        return redirect()->to('pengguna')->with('success','Berhasil melakukan delete');
    }
}
