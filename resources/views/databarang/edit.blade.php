@extends('layout.app')

<!-- START FORM -->
@section('content')
<!--jika ada error-->

<form action='{{ url('databarang/'.$data->id_barang) }}' method='post'> 
@csrf
@method('PUT')
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <h5 class="text-primary" align="center"><b>Edit Data Barang</b></h5>
        <div class="mb-3 row">
            <label for="id_barang" class="col-sm-2 col-form-label">ID Barang</label>
            <div class="col-sm-10">
                <input name="id_barang" id="id" value="{{ $data->id_barang }}" readonly>
            </div>
        </div>
        <div class="mb-3 row">
            <label for="kode" class="col-sm-2 col-form-label">Kode</label>
            <div class="col-sm-10">
                <input name="kode" id="kode_brg" value="{{ $data->kode }}" readonly>
            </div>
        </div>
        <div class="mb-3 row">
            <label for="jenis_barang" class="col-sm-2 col-form-label">Jenis Barang</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name='jenis_barang' 
                value="{{ $data->jenis_barang }}{{ old('jenis_barang') }}" id="jenis_brng">
                @error('jenis_barang')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="nama_barang" class="col-sm-2 col-form-label">Nama Barang</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name='nama_barang' 
                value="{{ $data->nama_barang }}{{ old('nama_barang') }}" id="nama_brng">
                @error('nama_barang')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="harga" class="col-sm-2 col-form-label">Harga Barang</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name='harga' 
                value="{{ $data->harga }}" id="harga">
                @error('harga')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="nama_barang" class="col-sm-2 col-form-label"></label>
            <div class="col-sm-10">
                <button type="submit" class="btn btn-primary" name="submit">Simpan</button>
                <a href='{{ url('databarang') }}'class="btn btn-primary"> Kembali </a>
            </div>
        </div>
      
    </div>
</form>
    <!-- AKHIR FORM -->
@endsection
