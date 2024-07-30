@extends('layout.app')
<!-- START FORM -->
@section('content')
<!--jika ada error-->

<form action='{{ url('databarang') }}' method='post'> 
@csrf
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <div class="pb-3">
        <h5 class="text-primary" align="center"><b>Tambah Data Barang</b></h5>
        </div>
        <div class="mb-3 row">
            <label for="jenis_barang" class="col-sm-2 col-form-label">Jenis Barang</label>
            <div class="col-sm-10">
                <select name ="jenis_barang" class="form-control select2 @error('jenis_barang') is-invalid @enderror" id="jenis_barang" aria-label="Default select example" aria-placeholder="pilih"><!--value untuk memanggil flash di databarangControlller-->
                    <option value="">- Pilih -</option>
                    @foreach ($jenisbarang as $item)
                        <option value="{{ $item->jenis_barang }}">{{ $item->jenis_barang }}</option>
                    @endforeach
                </select> 
                @error('jenis_barang')
                <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="nama_barang" class="col-sm-2 col-form-label">Nama Barang</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name='nama_barang' 
                value="{{ Session::get('nama_barang') }}" id="namabarang">
                @error('nama_barang')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="harga" class="col-sm-2 col-form-label">Harga Barang</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name='harga' 
                value="{{ Session::get('harga') }}" id="harga">
                @error('harga')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="jurusan" class="col-sm-2 col-form-label"></label>
            <div class="col-sm-10">
                <button type="submit" class="btn btn-primary" name="submit">Simpan</button>
                <a href='{{ url('databarang') }}'class="btn btn-primary ">kembali</a>
            </div>
        </div>
      
    </div>
</form>
    <!-- AKHIR FORM -->
@endsection
