@extends('layout.template')

@section('content')
 <!-- START DATA -->
 <div class="my-3 p-3 bg-body rounded shadow-sm">
    <!-- FORM PENCARIAN -->
    <div class="pb-3">
      <form class="d-flex" action="{{ url('pengguna') }}" method="get">
          <input class="form-control me-1" type="search" name="katakunci" value="{{ Request::get('katakunci') }}" 
          placeholder="Masukkan kata kunci" aria-label="Search">
          <button class="btn btn-primary" type="submit">
            <i class="fas fa-search fa-sm"></i>
        </button>
      </form>
    </div>
    
    <!-- TOMBOL TAMBAH DATA -->
    <div class="pb-3">
      <a href='{{ url('register') }}' class="btn btn-primary">+ Tambah Data</a>
    </div>
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Data Pengguna</h6>
    </div>
<div class="table-responsive">
    <table class="table table-bordered text-center" id="dataTable" width="auto" cellspacing="0">
        <thead>
            <tr>
                <th >No</th>
                <th >Email</th>
                <th >Role</th>
                <th >Nama</th>
                <th >Jabatan</th>
                <th >NIP</th>
                <th >Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php $i = $data->firstItem()?>
            @foreach ($data as $item)
            <tr>
                <td>{{ $i }}</td>
                <td>{{ $item->email}}</td>
                <td>{{ $item->role }}</td>
                <td>{{ $item->name }}</td>
                <td>{{ $item->jabatan }}</td>
                <td>{{ $item->nip }}</td>
                <td class="inline">
                    <a href='{{ url('pengguna/'.$item->email.'/edit') }}' class="btn btn-warning btn-sm" >Edit</a>
                    <form class='d-inline' onsubmit="return confirm('Yakin akan menghapus data?')" action="{{ url("pengguna/".$item->email) }}" method="post">
                        @csrf
                        @method('DELETE')
                        <button type="submit" name="submit" class="btn btn-danger btn-sm">
                            Del
                        </button>
                    </form>
                 
                </td>
            </tr>
            <?php $i++?>
            @endforeach
            
        </tbody>
    </table>
</div>
   {{ $data->links() }}
</div>
<!-- AKHIR DATA -->
@include('pengguna.modal.create')

@endsection
      