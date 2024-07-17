@extends('layout.app')

@section('content')

<form action='{{ url('surat') }}' method='post'>
    @csrf
<div class="row p-2">
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <a href='{{ url('surat') }}'class="btn btn-primary">kembali</a>
                <div class="row mt-1">
                    <div class="col-md-2">
                        <label for="persediaan">Jenis Barang</label>
                    </div>
                    <div class="col-md-10">
                        <select name ="persediaan" class="form-control select2 @error('persediaan') is-invalid @enderror" id="jenis_barang" aria-label="Default select example" aria-placeholder="pilih"><!--value untuk memanggil flash di databarangControlller-->
                            <option value="">- Pilih -</option>
                            @foreach ($databarang as $produk)
                                <option value="{{ $produk->jenis_barang }}">{{ $produk->jenis_barang }}</option>
                            @endforeach
                        </select> 
                        @error('persediaan')
                        <div class="text-danger">{{ $message }}</div>
                        @enderror
                    </div>

                </div>
                <div class="row mt-1">
                    <div class="col-md-2">
                        <label for="nilai">Nilai</label>
                    </div>
                    <div class="col-md-10">
                        <input type="number" class="form-control @error('nilai') is-invalid @enderror" name='nilai' 
                        value="{{ Session::get('nilai') }}" id="nilai">
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
</form>
                
@endsection