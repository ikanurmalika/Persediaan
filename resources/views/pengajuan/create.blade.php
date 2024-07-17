@extends('layout.app')
<!-- START FORM -->
@section('content')
<!--jika ada error-->

<form action='{{ url('pengajuan') }}' method='post'> 
@csrf
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <a href='{{ url('pengajuan') }}'class="btn btn-primary">kembali</a>
        
        <div class="mb-3 row">
            <label for="nama" class="col-sm-2 col-form-label">Nama</label>
            <div class="col-sm-10">
                <input type="text" class="form-control @error('nama') is-invalid @enderror" name='nama' 
                value="{{ Session::get('nama') }}" id="nama"> 
                @error('nama')
            <div class="text-danger">{{ $message }}</div>
            @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="jabatan" class="col-sm-2 col-form-label">Jabatan</label>
            <div class="col-sm-10">
                <input type="text" class="form-control @error('jabatan') is-invalid @enderror" name='jabatan' 
                value="{{ Session::get('jabatan') }}" id="jabatan"> 
                @error('jabatan')
            <div class="text-danger">{{ $message }}</div>
            @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="nama_barang" class="col-sm-2 col-form-label">Nama Barang</label>
            <div class="col-sm-10">
                <select name="nama_barang" id="nama_barang" class="form-control select2 @error('nama_barang') is-invalid @enderror" placeholder="- Pilih nama barang-">
                    @foreach($databarang as $barang)
                        <option value="{{ $barang->nama_barang }} ">{{ $barang->nama_barang }}</option>
                    @endforeach
                </select>
                @error('nama_barang')
            <div class="text-danger">{{ $message }}</div>
            @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="jml_barang" class="col-sm-2 col-form-label">Jumlah Barang</label>
            <div class="col-sm-10">
                <input type="text" class="form-control @error('jml_barang') is-invalid @enderror" name='jml_barang' 
                value="{{ Session::get('jml_barang') }}" id="jml_barang">
                @error('jml_barang')
            <div class="text-danger">{{ $message }}</div>
            @enderror
            </div>
        </div>
       
        <div class="mb-3 row">
            <label for="jml_barang" class="col-sm-2 col-form-label"></label>
            <div class="col-sm-10"><button type="submit" class="btn btn-primary" name="submit">Simpan</button></div>
        </div>
      
    </div>
</form>
    <!-- AKHIR FORM -->
@endsection
