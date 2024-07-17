
@extends('layout.template')

<!-- START FORM -->
@section('content')
<!--jika ada error-->

<form action='{{ url('create') }}' method='post'> 
@csrf
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <h5 align="center" class="text-primary"><strong>Register</strong></h5>
        <div class="mb-3 row">
            <label for="name" class="col-sm-2 col-form-label">Nama</label>
            <div class="col-sm-10">
                <input type="text" class="form-control  @error('name') is-invalid @enderror" name='name' 
                value="{{ Session::get('name') }} " id="name">
                @error('name')
                    <div class="text-danger">{{ $message }}</div>
                 @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="jabatan" class="col-sm-2 col-form-label">Jabatan</label>
            <div class="col-sm-10">
                <input type="text" class="form-control  @error('jabatan') is-invalid @enderror" name='jabatan' 
                value="{{ Session::get('jabatan') }}" id="jabatan">
                @error('jabatan')
                    <div class="text-danger">{{ $message }}</div>
                 @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="nip" class="col-sm-2 col-form-label">NIP</label>
            <div class="col-sm-10">
                <input type="text" class="form-control  @error('nip') is-invalid @enderror" name='nip' 
                value="{{ Session::get('nip')}} " id="nip">
                @error('nip')
                    <div class="text-danger">{{ $message }}</div>
                 @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="email" class="col-sm-2 col-form-label">Email</label>
            <div class="col-sm-10">
                <input type="text" class="form-control  @error('email') is-invalid @enderror" name='email' 
                value="{{ Session::get('email') }}" id="email">
                @error('email')
                    <div class="text-danger">{{ $message }}</div>
                 @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="password" class="col-sm-2 col-form-label">Password</label>
            <div class="col-sm-10">
                <input type="text" class="form-control  @error('password') is-invalid @enderror" name='password' 
                value="{{ Session::get('password') }} " id="password" >
                @error('password')
                    <div class="text-danger">{{ $message }}</div>
                 @enderror
            </div>
        </div>
        <p>( Role: 1.pengelola_barang; 2.ketua; 3.kelurahan; 4.pengguna )</p>
        <div class="mb-3 row">
            <label for="role" class="col-sm-2 col-form-label">Role</label>
            <div class="col-sm-10">
                <input type="text" class="form-control  @error('role') is-invalid @enderror" name='role' 
                value="{{ Session::get('role') }} " id="role" >
                @error('role')
                    <div class="text-danger">{{ $message }}</div>
                 @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="nip" class="col-sm-2 col-form-label"></label>
            <div class="col-sm-10"><button type="submit" class="btn btn-primary" name="submit">Simpan</button>
                <a href='{{ url('pengguna') }}'class="btn btn-primary"> kembali </a>
            </div>
        </div>
      
    </div>
</form>
    <!-- AKHIR FORM -->
@endsection
