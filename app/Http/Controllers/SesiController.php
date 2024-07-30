<?php

namespace App\Http\Controllers;

use App\Models\user;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

class SesiController extends Controller
{
    function index (Request $request){
        return view('pengguna.login');
    }

    function login(Request $request){
        $request->validate([
            'email'=>'required',
            'password'=>'required'
        ],[
            'email.required'=>'Email wajib diisi',
            'password.required'=>'Password wajib diisi',
        ]);
        //cek apakah email&password sudah sesuai?
        $info =[
            'email'=>$request->email,
            'password'=>$request->password,
        ];
        //pengecekan
        if(Auth::attempt($info)){
            if(Auth::user()->role =='pengelola_barang'){
                return redirect('dashboard/pengelola');
            }elseif(Auth::user()->role =='ketua'){
                return redirect('/dashboard/ketua');
            }elseif(Auth::user()->role =='kelurahan'){
                return redirect('/dashboard/kelurahan');
            }elseif(Auth::user()->role =='pengguna'){
                return redirect('/dashboard/pengguna');
            }
        }else{
            return redirect('')->withErrors('Username dan Password yang dimasukkan salah')->withInput();
        }
    }
    function logout(){
        Auth::logout();
        return redirect('');
    }

    function register(){
        
        return view('pengguna.create');
    }

    function create(Request $request){
        Session::flash('email',$request->email);
        Session::flash('password',$request->password);
        Session::flash('name',$request->name);
        Session::flash('role',$request->role);
        $request->validate([
            'email'=>'required|email|unique:user',
            'password'=>'required|min:6',
            'name'=>'required',
            'role'=>'required',
            'jabatan'=>'required',
            'nip'=>'required',
            //'id'=>'required'
        ],[
            'email.required'=>'Email wajib diisi',
            'email.email'=>'Silahkan masukkan Email yang valid',
            'email.unique'=>'Email sudah digunakan, silahkan pilih email lain',
            'password.required'=>'Password wajib diisi',
            'password.min'=>'Minimum password yang diizinkan adalah 6 karakter',
            'name.required'=>'Nama wajib diisi',
            'role.required'=>'Role wajib diisi',
            'jabatan.required'=>'Jabatan wajib diisi',
            'nip.required'=>'NIP wajib diisi',

        ]);
        $data =[
            'email'=>$request->email,
            'name'=>$request->name,
            'password'=>Hash::make($request->password),
            'jabatan'=>$request->jabatan,
            'nip'=>$request->nip,
            'role'=>$request->role
        ];
        user::create($data);
        //cek apakah email&password sudah sesuai?
        $info =[
            'email'=>$request->email,
            'password'=>$request->password,
        ];
        return redirect()->to('pengguna')->with('success','Berhasil menambahkan data');
    }

    public function edit($id)
    {
       $data = user::where('nip',$id)->first();
       return view('pengguna.edit')->with('data',$data);

    }

    public function update(Request $request, $id){
        $request->validate([
            'email'=>'required|email|unique:user',
            'password'=>'required|min:6',
            'name'=>'required',
            'role'=>'required',
            'jabatan'=>'required',
            'nip'=>'required',
            //'role'=>'required'
        ],[
            'email.required'=>'Email wajib diisi',
            'email.email'=>'Silahkan masukkan Email yang valid',
            'email.unique'=>'Email sudah digunakan, silahkan pilih email lain',
            'password.required'=>'Password wajib diisi',
            'password.min'=>'Minimum password yang diizinkan adalah 6 karakter',
            'name.required'=>'Nama wajib diisi',
            'role.required'=>'Role wajib diisi',
            'jabatan.required'=>'Role wajib diisi',
            'nip.required'=>'Role wajib diisi',

        ]);
        $data =[
            'id'=>$request->id,
            'email'=>$request->email,
            'name'=>$request->name,
            'password'=>Hash::make($request->password),
            'jabatan'=>$request->jabatan,
            'nip'=>$request->nip,
            'role'=>$request->role
        ];
        user::where('nip',$id)->update($data); //nama database yang dituju
        //setelah menambahkan data maka akan kembali ke halaman databarang
        return redirect()->to('pengguna')->with('success','Berhasil melakukan update data');

        $info =[
            'email'=>$request->email,
            'password'=>$request->password,
        ];
        //pengecekan
        if(Auth::attempt($info)){
            return redirect('pengguna')->with('success','Data Pengguna behasil diperbarui')->withInput();
        }else{
            return redirect('pengguna/{id}/edit')->withErrors('Email dan password yang dimasukkan tidak valid')->withInput();
        }
    }
    public function destroy($id)
    {
        $user = User::findOrFail($id);
        $user->delete();

        return redirect('pengguna')->with('success', 'Data pengguna berhasil dihapus.');
    }

    public function LupaPassword()
    {
        return view('pengguna.Lupapassword');
    }

    // Function to handle forgot password logic (simplified for demonstration purposes)
    /*public function GantiPassword(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
        ], [
            'email.required' => 'Email wajib diisi',
            'email.email' => 'Silahkan masukkan Email yang valid',
        ]);

        $user = User::where('email', $request->email)->first();
        if ($user) {
            // Implement logic to send a password reset link to the user
            return redirect()->back()->with('success', 'Link reset password telah dikirim ke email Anda');
        } else {
            return redirect()->back()->withErrors('Email tidak ditemukan');
        }
    }*/
   
}
