@extends('layout.app')

<!-- START FORM -->
@section('content')
<!--jika ada error-->

<form action='{{ url('statuspengajuan/'.$data->id_pengajuan) }}' method='post'> 
@csrf
@method('PUT')
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <a href='{{ url('statuspengajuan') }}'class="btn btn-primary"> >>kembali </a>
        <div class="mb-3 row">
            <label for="id_pengajuan" class="col-sm-2 col-form-label">ID Pengajuan</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name='id_pengajuan' 
                value="{{ $data->id_pengajuan }}" id="id_pengajuan" readonly>
            </div>
               
            
        </div>
        <div class="mb-3 row">
            <label for="nama" class="col-sm-2 col-form-label">Nama :</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name='nama' 
                value="{{ $data->nama }}" id="nama" readonly>
            </div>
                
        </div>
        <div class="mb-3 row">
            <label for="jabatan" class="col-sm-2 col-form-label">Jabatan</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name='jabatan' 
                value="{{ $data->jabatan }}" id="jabatan" readonly>
            
            </div>
        </div>
        <div class="mb-3 row">
            <label for="nama_barang" class="col-sm-2 col-form-label">Nama Barang</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name='nama_barang' 
                value="{{ $data->nama_barang }}" id="nam_barang" readonly>
            </div>
                
        </div>
        <div class="mb-2 row">
            <label for="jml_barang" class="col-sm-2 col-form-label">Jumlah Barang</label>
            <div class="col-sm-10">
                 
                <input type="text" class="form-control" name='jml_barang' 
                value="{{ $data->jml_barang }}" id="jml_barang" readonly>
            
            </div>
        </div>
        <div class="mb-3 row">
            <label for="status" class="col-sm-2 col-form-label">Status</label>
            <div class="col-sm-5">
                <select name="status" id="status" class="form-control " value="{{ $data->status }}">
                        
                        <option >Diterima</option>
                        <option >Ditolak</option>

                </select>
            </div>
        </div>
        <div class="mb-3 row">
            <label for="nama_barang" class="col-sm-2 col-form-label"></label>
            <div class="col-sm-10"><button type="submit" class="btn btn-primary" name="submit">SIMPAN</button></div>
        </div>
      
    </div>
</form>
    <!-- AKHIR FORM -->
@endsection
