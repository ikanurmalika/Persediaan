@extends('layout.app')

@section('content')

<form action='{{ url('surat/create') }}' method='post'>
    @csrf
<div class="row p-2">
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
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
                        <label for="">Nilai</label>
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
<div class="card shadow mb-4">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered text-left" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th class="text-center">No</th>
                        <th>Persediaan</th>
                        <th>Nilai</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $i = $data->firstItem()?>
                    @foreach ($data as $item)
                    <tr>
                        <td align="center">{{ $i }}</td>
                        <td>{{ $item->persediaan }}</td>
                        <td>{{ number_format($item->nilai) }}</td>
        
                        <td class="inline">
                            <form onsubmit="return confirm('Yakin akan menghapus data?')" class="d-inline" action="{{ url("surat/".$item->persediaan) }}" method="post">
                                @csrf
                                @method('DELETE')
                                 <button type="submit" name="submit" class="btn btn-danger btn-sm">
                                    Hapus
                                </button>
                                
                            </form>
                        </td>
                    </tr>
                    <?php $i++?>
                    @endforeach
                    @php
                        $total = 0;
                    @endphp

                    @foreach($data as $item)
                        @php
                            $total += $item->nilai; // Menghitung total
                        @endphp
                    @endforeach
                    <tr>
                        <td colspan="2">Jumlah</td>
                        <td colspan="2">{{ number_format($total)}}</td>
                    </tr>
                    <?php  ?>
                </tbody>
            </table>
        </div>

    </div>
</div>