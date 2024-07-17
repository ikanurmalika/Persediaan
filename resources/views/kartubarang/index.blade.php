@extends('layout.app')
@section('title','databarang')
@section('content')
 <!-- START DATA -->
 <div class="my-3 p-3 bg-body rounded shadow-sm">
    <!-- FORM PENCARIAN -->
    <div class="pb-3">
      <form class="d-flex" action="{{ url('kartubarang') }}" method="get">
          <input class="form-control me-1" type="search" name="katakunci" value="{{ Request::get('katakunci') }}" 
          placeholder="Masukkan kata kunci" aria-label="Search">
          <button class="btn btn-primary" type="submit">
            <i class="fas fa-search fa-sm"></i>
        </button>
      </form>
    </div>
    
    <!-- TOMBOL TAMBAH DATA -->
    <div class="card-header py-3 d-flex justify-content-between align-items-center">
        <h6 class="m-0 font-weight-bold text-primary">Kartu Barang</h6>
        <a href="{{ url('unduh-kartubarang') }}" class="btn btn-sm btn-primary shadow-sm">
            <i class="fas fa-download fa-sm text-white-50"></i> Unduh
        </a>
    </div>
    
<div class="card shadow mb-4">
    <div class="card-body">
        
        <div class="table-responsive">
            <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0"
                style="overflow-x: auto; white-space: nowrap;">
        <thead>
            <tr>
                <th scope="col">No</th>
                <th scope="col">ID Barang</th>
                <th scope="col">Nama Barang</th>
                <th scope="col">Harga Barang</th>
                <th scope="col">Aksi</th>
            </tr>
        </thead>
        <tbody>
            @php $no = 1; @endphp
            @foreach ($data as $item)
            <tr>
                <td>{{ $no++ }}</td>
                <td align="left">{{ $item->id_barang }}</td>
                <td align="left">{{ $item->nama_barang }}</td>
                <td align="left">{{ $item->harga }}</td>
                <td>
                    <a href='{{ url('kartubarang/'.$item->id_barang) }}' class="btn btn-warning btn-sm"><i class="fas fa-eye"></i></a>
                </td>
            </tr>
            @endforeach
            
        </tbody>
    </table>
</div>

</div>
</div>
   {{ $data->links() }}
</div>
<!-- AKHIR DATA -->

@endsection
      