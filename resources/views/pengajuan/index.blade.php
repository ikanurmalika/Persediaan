@extends('layout.app')
@section('title','barangkeluar')
@section('content')
 <!-- START DATA -->
 <div class="my-3 p-3 bg-body rounded shadow-sm">
    <!-- FORM PENCARIAN -->
    <div class="pb-3">
      <form class="d-flex" action="{{ url('pengajuan') }}" method="get">
          <input class="form-control me-1" type="search" name="katakunci" value="{{ Request::get('katakunci') }}" 
          placeholder="Masukkan kata kunci" aria-label="Search">
          <button class="btn btn-primary" type="submit">
            <i class="fas fa-search fa-sm"></i>
        </button>
      </form>
    </div>
    
    <!-- TOMBOL TAMBAH DATA -->
    <div class="pb-3">
      <a href='{{ url('pengajuan/create') }}' class="btn btn-primary">+ Tambah</a>
    </div>
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Barang Keluar</h6>
    </div>
<div class="card shadow mb-4">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th >No</th>
                        <th >ID Pengajuan</th>
                        <th >Nama</th>
                        <th >Jabatan</th>
                        <th >Nama Barang</th>
                        <th >Jumlah Barang</th>
                        <th >Status</th>
                        <th >Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $i = $data->firstItem()?>
                    @foreach ($data as $item)
                    <tr>
                        <td>{{ $i }}</td>
                        <td>{{ $item->id_pengajuan }}</td>
                        <td>{{ $item->nama }}</td>
                        <td>{{ $item->jabatan }}</td>
                        <td>{{ $item->nama_barang }}</td>
                        <td>{{ $item->jml_barang }}</td>
                        <td >
                            <span class="badge badge-{{ $item->status_style }}">{{ $item->status ?? 'Diproses'}}</span>
                        </td>
        
                        <td class="inline">
                            <form onsubmit="return confirm('Yakin akan menghapus data?')" class="d-inline" action="{{ url("pengajuan/".$item->id_pengajuan) }}" method="post">
                                @csrf
                                @method('DELETE')
                                @if ($item->status=='Diterima' || $item->status=='Ditolak')
                                Pengajuan sudah divalidasi
                                @else
                                 <button type="submit" name="submit" class="btn btn-danger btn-sm">
                                    Delete
                                </button>

                                @endif
                                
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
      