@extends('layout.app')
@section('title','databarang')
@section('content')
 <!-- START DATA -->
 <div class="my-3 p-3 bg-body rounded shadow-sm">
    <!-- FORM PENCARIAN -->
    <div class="pb-3">
      <form class="d-flex" action="{{ url('surat') }}" method="get">
          <input class="form-control me-1" type="search" name="katakunci" value="{{ Request::get('katakunci') }}" 
          placeholder="Masukkan kata kunci" aria-label="Search">
          <button class="btn btn-primary" type="submit">
            <i class="fas fa-search fa-sm"></i>
        </button>
      </form>
    </div>
    
    <!-- TOMBOL TAMBAH DATA -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary"> Surat Inventaris </h6>
    </div>
<div class="card shadow mb-4">
    <div class="card-body">
        <div class="pb-3">
            <a href='{{ url('surat/create') }}' class="btn btn-primary btn btn-sm"> Tambah</a>
          </div>
        <div class="table-responsive">
            <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0"
                style="overflow-x: auto; white-space: nowrap;">
        <thead>
            <tr>
                <th scope="col">No</th>
                <th scope="col">Tanggal</th>
                <th scope="col">Semester</th>
                <th scope="col">Unit Kerja</th>
                <th scope="col">Aksi</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($data as $item)
            <tr>
                <td>{{ $loop->iteration }}</td>
                <td align="left">{{ $item->tanggal}}</td>
                <td align="left">{{ $item->semester }}</td>
                <td align="left">{{ $item->unit_kerja }}</td>
                <td>
                    <a href='{{ url('surat/'.$item->tanggal.'/show') }}' class="btn btn-primary btn-sm"><i class="fas fa-eye"></i></a>
                        <a href="{{ url('surat/'.$item->tanggal.'/edit') }}" class="btn btn-warning btn-sm  " >
                            <i class="fas fa-edit"></i> Edit </a>
                    <form onsubmit="return confirm('Yakin akan menghapus data?')" class="d-inline" action="{{ url('surat/'.$item->tanggal.'/delete')}}" method="post">
                        @csrf
                        @method('DELETE')
                        <button type="submit" name="submit" class="btn btn-danger btn-sm">
                            <i class="fas fa-trash"></i> 
                        </button>
                    </form>
                
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
      