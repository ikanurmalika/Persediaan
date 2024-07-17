<?php

namespace Database\Seeders;

use App\Models\user;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DummyUsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $userData = [
            [
                'name'=>'pengelola',
                'email'=>'pengelola@gmail.com',
                'jabatan'=>'pengelola',
                'nip'=>'1123546',
                'role'=>'pengelola_barang',
                'password' =>bcrypt('123456')
            ],
            [
                'name'=>'ketua',
                'email'=>'ketua@gmail.com',
                'jabatan'=>'ketua',
                'nip'=>'1123546',
                'role'=>'ketua',
                'password' =>bcrypt('123456')
            ],
            [
                'name'=>'kelurahan',
                'email'=>'kelurahan@gmail.com',
                'jabatan'=>'kelurahan',
                'nip'=>'1123546',
                'role'=>'kelurahan',
                'password' =>bcrypt('123456')
            ],
            [
                'name'=>'pengguna',
                'email'=>'pengguna@gmail.com',
                'jabatan'=>'pengguna',
                'nip'=>'1123546',
                'role'=>'pengguna',
                'password' =>bcrypt('123456')
            ],
        ];
        foreach($userData as $key =>$val){
            user::create($val);
        }
    }
}
