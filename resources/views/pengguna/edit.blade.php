@extends('layout.template')

<!-- START FORM -->
@section('content')
<!--jika ada error-->

<form action='{{ url('pengguna/'.$data->email) }}' method='post'> 
@csrf
@method('PUT')
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <a href='{{ url('pengguna') }}'class="btn btn-primary"> kembali </a>
        <div class="mb-3 row">
            <label for="name" class="col-sm-2 col-form-label">Nama</label>
            <div class="col-sm-10">
                <input type="text" class="form-control  @error('name') is-invalid @enderror" name='name' 
                value="{{ $data->name}} {{ old('name') }}" id="name">
                @error('name')
                    <div class="text-danger">{{ $message }}</div>
                 @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="jabatan" class="col-sm-2 col-form-label">Jabatan</label>
            <div class="col-sm-10">
                <input type="text" class="form-control  @error('jabatan') is-invalid @enderror" name='jabatan' 
                value="{{ $data->jabatan}} " id="jabatan">
                @error('jabatan')
                    <div class="text-danger">{{ $message }}</div>
                 @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="nip" class="col-sm-2 col-form-label">NIP</label>
            <div class="col-sm-10">
                <input type="text" class="form-control  @error('nip') is-invalid @enderror" name='nip' 
                value="{{ $data->nip}} {{ old('nip') }}" id="nip">
                @error('nip')
                    <div class="text-danger">{{ $message }}</div>
                 @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="email" class="col-sm-2 col-form-label">Email</label>
            <div class="col-sm-10">
                <input type="text" class="form-control  @error('email') is-invalid @enderror" name='email' 
                value="{{ $data->email}} {{ old('email') }}" id="email">
                @error('email')
                    <div class="text-danger">{{ $message }}</div>
                 @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="password" class="col-sm-2 col-form-label">Password</label>
            <div class="col-sm-10">
                <input type="text" class="form-control  @error('password') is-invalid @enderror" name='password' 
                value="{{ $data->password }} {{ old('password') }}" id="password" >
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
                value="{{ $data->role }} " id="role" >
                @error('role')
                    <div class="text-danger">{{ $message }}</div>
                 @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="nip" class="col-sm-2 col-form-label"></label>
            <div class="col-sm-10"><button type="submit" class="btn btn-primary" name="submit">Simpan</button></div>
        </div>
      
    </div>
</form>
    <!-- AKHIR FORM -->
@endsection
