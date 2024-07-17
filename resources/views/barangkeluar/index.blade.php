@extends('layout.app')
@section('title','barangkeluar')
@section('content')
 <!-- START DATA -->
 <div class="my-3 p-3 bg-body rounded shadow-sm">
    <!-- FORM PENCARIAN -->
    <div class="pb-3">
      <form class="d-flex" action="{{ url('barangkeluar') }}" method="get">
          <input class="form-control me-1" type="search" name="katakunci" value="{{ Request::get('katakunci') }}" 
          placeholder="Masukkan kata kunci" aria-label="Search">
          <button class="btn btn-primary" type="submit">
            <i class="fas fa-search fa-sm"></i>
        </button>
      </form>
    </div>
    
    <!-- TOMBOL TAMBAH DATA -->
    <div class="pb-3">
      <a href='{{ url('barangkeluar/create') }}'  class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"> Tambah</a>
      <a href='{{ url('unduh') }}' class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
        class="fas fa-download fa-sm text-white-50"></i> Unduh</a>
    </div>
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Barang Keluar</h6>
    </div>
<div class="card shadow mb-4">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered text-center" id="dataTable" style="overflow-x: auto;
            white-space: nowrap;" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th scope="col" >No</th>
                        <th scope="col">Tanggal</th>
                        
                        <th scope="col">Nama Barang</th>
                        <th scope="col">Jumlah Barang</th>
                        <th scope="col">Satuan</th>
                        <th scope="col">Harga Barang</th>
                        <th scope="col">Total</th>
                        <th scope="col">Untuk</th>
                        <th scope="col">Keterangan</th>
                        <th scope="col">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $i = $data->firstItem()?>
                    @foreach ($data as $item)
                    <tr>
                        <td>{{ $i }}</td>
                        <td>{{ $item->Tanggal}}</td>
                        
                        <td>{{ $item->nama_barang }}</td>
                        <td>{{ $item->jml_barang }}</td>
                        <td>{{ $item->satuan}}</td>
                        <td>{{ $item->harga_barang }}</td>
                        <td>{{ $item->total_harga_keluar }}</td>
                        <td>{{ $item->untuk}}</td>
                        <td>{{ $item->ket}}</td>
        
                        <td class="inline">
                            <a href='{{ url('barangkeluar/'.$item->id_transaksi_keluar.'/edit') }}' class=" btn btn-warning btn-sm"><i class="fas fa-edit"></i> Edit</a>
                            <form onsubmit="return confirm('Yakin akan menghapus data?')" class="d-inline" action="{{ url("barangkeluar/".$item->id_transaksi_keluar) }}" method="post">
                                @csrf
                                @method('DELETE')
                                <button type="submit" name="submit" class="btn btn-danger btn-sm">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                    <?php $i++?>
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
      