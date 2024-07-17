@extends('layout.app')
@section('title','databarang')
@section('content')
 <!-- START DATA -->
 <div class="my-3 p-3 bg-body rounded shadow-sm">
    <!-- FORM PENCARIAN -->
    <div class="pb-3">
      <form class="d-flex" action="{{ url('TTD-Surat') }}" method="get">
          <input class="form-control me-1" type="search" name="katakunci" value="{{ Request::get('katakunci') }}" 
          placeholder="Masukkan kata kunci" aria-label="Search">
          <button class="btn btn-primary" type="submit">
            <i class="fas fa-search fa-sm"></i>
        </button>
      </form>
    </div>
    
    <!-- TOMBOL TAMBAH DATA -->
    <div class="pb-3">
      <a href='{{ url('TTD-Surat/create') }}' class="btn btn-primary btn-sm"> Tambah Data</a>
    </div>
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Pengaturan Tanda Tangan Surat</h6>
    </div>
<div class="card shadow mb-4">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0"
                style="overflow-x: auto; white-space: nowrap;">
        <thead>
            <tr>
                <th scope="col">No</th>
                <th scope="col">Perangkat Daerah</th>
                <th scope="col">Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php $i = $data->firstItem()?>
            @foreach ($data as $item)
            <tr>
                <td>{{ $i }}</td>
                <td>{{ $item->unit_kerja }}</td>
                <td>
                    <a href='{{ url('TTD-Surat/'.$item->unit_kerja.'/edit') }}' class="btn btn-warning btn-sm">Edit</a>
                    <form class='d-inline' onsubmit="return confirm('Yakin akan menghapus data?')" action="{{ url("TTD-Surat/".$item->unit_kerja) }}" method="post">
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

</div>
</div>
   {{ $data->links() }}
</div>
<!-- AKHIR DATA -->

@endsection
      