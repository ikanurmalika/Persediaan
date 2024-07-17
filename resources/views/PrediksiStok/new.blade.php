@extends('layout.app')
@section('title', 'Prediksi Stok')
@section('content')

<div class="my-3 p-3 bg-body rounded shadow-sm">

    <!-- FORM PENCARIAN -->
    <div class="pb-3">
        <form class="d-flex" action="{{ url('Prediksi-Stok') }}" method="get">
            <input class="form-control me-1" type="search" name="katakunci" value="{{ Request::get('katakunci') }}"
                   placeholder="Masukkan kata kunci">
            <button class="btn btn-primary" type="submit">
                <i class="fas fa-search fa-sm"></i>
            </button>
        </form>
    </div>
    
    <!-- TABEL DATA -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Perencanaan Stok</h6>
    </div>
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0"
                style="overflow-x: auto; white-space: nowrap;">
                <thead>
                    <tr>
                        <th scope="col">No</th>
                        <th scope="col">Nama Barang</th>
                        <th scope="col">Total Persediaan {{ $TahunLalu }}</th>
                        
                        <th scope="col">Rata-Rata {{ $TahunLalu }}</th>
                        <th scope="col">Safety Stock {{ $TahunLalu }}</th>
                        <th scope="col">Maksimal Stok {{ $TahunLalu}}</th>
                        <th scope="col">Minimal Stok {{ $TahunLalu}}</th>
                        <th scope="col">Total Persediaan {{ $TahunIni }}</th>
                        <th scope="col">Rata-Rata {{ $TahunIni }}</th>
                        <th scope="col">Safety Stock {{ $TahunIni }}</th>
                        <th scope="col">Maksimal Stok {{ $TahunIni}}</th>
                        <th scope="col">Minimal Stok {{ $TahunIni}}</th>
                        
                    </tr>
                </thead>
                <tbody>
                    @foreach ($data as $index => $item)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td align="left">{{ $item->nama_barang }}</td>
                           
                            <td>{{ $item->A_maks2 }}</td>
                            <td>{{ $item->ratarata_tahun_lalu }}</td> 
                            <td>{{ $item->SS_tahun_lalu }}</td> 
                            <td>{{ $item->mak_tahun_lalu }}</td> 
                            <td>{{ $item->min_tahun_lalu }}</td>
                            <td>{{ $item->jumlah_barang_tahun_ini}}</td> 
                            <td>{{ $item->ratarata_tahun_ini }}</td> 
                            <td>{{ $item->SS_tahun_ini }}</td> 
                            <td>{{ $item->mak_tahun_ini }}</td> 
                            <td>{{ $item->min_tahun_ini}}</td> 
                        </tr>
                    @endforeach
                </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
{{ $data->links() }}
@endsection
