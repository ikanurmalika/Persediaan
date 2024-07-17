@extends('layout.app')
@section('title','barangkeluar')
@section('content')
 <!-- START DATA -->
 <div class="my-3 p-3 bg-body rounded shadow-sm">
    <!-- FORM PENCARIAN -->
    <div class="pb-3">
      <form class="d-flex" action="{{ url('barangmasuk') }}" method="get">
          <input class="form-control me-1" type="search" name="katakunci" value="{{ Request::get('katakunci') }}" 
          placeholder="Masukkan kata kunci" aria-label="Search">
          <button class="btn btn-primary" type="submit">
            <i class="fas fa-search fa-sm"></i>
        </button>
      </form>
    </div>
    
    <!-- TOMBOL TAMBAH DATA -->
    <div class="pb-3">
      <a href='{{ url('barangmasuk/create') }}' class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm "> Tambah</a>
      <a href='{{ url('unduh2') }}' class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
        class="fas fa-download fa-sm text-white-50"></i> Unduh</a>
    </div>
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Barang Masuk</h6>
    </div>
<div class="card shadow mb-4">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0"
            style="overflow-x: auto; white-space: nowrap;">
                <thead>
                    <tr>
                        <th >No</th>
                        <th >Tanggal</th>
                        <th >Dari, LS/GU</th>
                        <th >ID Barang</th>
                        <th >Nama Barang</th>
                        <th >Jumlah Barang</th>
                        <th >Satuan</th>
                        <th >Harga</th>
                        <th >Jumlah Harga</th>
                        <th >Ket./PPTK</th>
                        <th >Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @php
                    $totalbarang = 0;
                    $totalharga=0;
                    @endphp
                    <?php $i = $data->firstItem()?>
                    @foreach ($data as $item)
                    <tr>
                        @php
                        $totalbarang = $item->jml_barang + $item->jml_barang_awal;
                        $totalharga= $item->jml_harga + $item->jml_harga_awal;
                        @endphp
                        <td>{{ $i }}</td>
                        <td>{{ $item->Tanggal}}</td>
                        <td>{{ $item->dari}}</td>
                        <td>{{ $item->id_barang }}</td>
                        <td>{{ $item->nama_barang }}</td>
                        <td>{{ $totalbarang}}</td>
                        <td>{{ $item->satuan}}</td>
                        <td>{{ number_format($item->harga_barang) }}</td>
                        <td>{{ number_format($totalharga) }}</td>
                        <td>{{ $item->ket}}</td>
        
                        <td class="inline">
                            <a href='{{ url('barangmasuk/'.$item->id_transaksi_masuk.'/edit') }}' class=" btn btn-warning btn-sm"><i class="fas fa-edit"></i> Edit</a>
                            <form onsubmit="return confirm('Yakin akan menghapus data?')" class="d-inline" action="{{ url("barangmasuk/".$item->id_transaksi_masuk) }}" method="post">
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
      