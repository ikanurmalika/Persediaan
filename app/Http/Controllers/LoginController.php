<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class loginController extends Controller
{
    public function index (){
        return view('login');
    }
    public function postlogin (Request $request){
        //dd($request->all());
        if (Auth::attempt($request->only('email','password'))){
            return redirect('dashboard');
        }
        return redirect ('login');
    }
        
}
    
