@extends('layout.app')

@section('title')
   Tambah Surat
@endsection
@section('content')

<form action='' method='post'>
    @csrf
<div class="row p-2">
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <div class="row mt-1">
                    <div class="col-md-2">
                        <label for="">Jenis Barang</label>
                    </div>
                    <div class="col-md-10">
                        <select name ="jenis_barang" class="form-control select2 @error('jenis_barang') is-invalid @enderror" id="jenis_barang" aria-label="Default select example" aria-placeholder="pilih"><!--value untuk memanggil flash di databarangControlller-->
                            <option value="">- Pilih -</option>
                            @foreach ($databarang as $produk)
                                <option value="{{ $produk->jenis_barang }}">{{ $produk->jenis_barang }}</option>
                            @endforeach
                        </select> 
                        @error('jenis_barang')
                        <div class="text-danger">{{ $message }}</div>
                        @enderror
                    </div>

                </div>
                <div class="row mt-1">
                    <div class="col-md-2">
                        <label for="">Nilai</label>
                    </div>
                    <div class="col-md-10">
                        <input type="number" class="form-control @error('nilai') is-invalid @enderror" name='nilai' 
                        value="" id="nilai">
                    </div>
                </div>
                <div class="row mt-1">
                    <div class="col-md-2">
                        
                    </div>
                    <div class="col-md-10">
                        <button type="submit" class="btn btn-primary" name="submit">Tambah</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row p-2">   
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <table class="table">
                    <tr>
                        <th>No</th>
                        <th>Persediaan</th>
                        <th>Nilai</th>
                        <th>Delete</th>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <a href="" class="btn btn-info"><i class="fas fa-times"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <td>Jumlah</td>
                        <td>Rp.</td>
                    </tr>
                </table>
                <a href="" class="btn btn-primary"><i class="fas fa-check"></i>selesai</a>
            </div>
        </div>
    </div>
</div>
                
@endsection