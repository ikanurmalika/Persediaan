@extends('layout.app')

<!-- START FORM -->
@section('content')
<!--jika ada error-->

<form action='{{ url('barangkeluar/'.$data->id_transaksi_keluar) }}' method='post'> 
@csrf
@method('PUT')
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <a href='{{ url('barangkeluar') }}'class="btn btn-primary"> kembali </a>
        <div class="mb-3 row">
            <label for="Tanggal" class="col-sm-2 col-form-label datepicker">Tanggal</label>
            <div class="col-sm-2">
                <input type="date" class="form-control" name='Tanggal' 
                value="{{$data->Tanggal}}" id="Tanggal"> 
            </div>
        </div>
        <div class="mb-3 row">
            <label for="perangkat_daerah" class="col-sm-2 col-form-label">Perangkat Daerah</label>
            <div class="col-sm-10">
                <select name="perangkat_daerah" id="jenis_barang" class="form-control">
                    <option value="{{ $data->perangkat_daerah }} ">{{ $data->perangkat_daerah }} </option>
                    <option value="KECAMATAN ASTANAANYAR">KECAMATAN ASTANAANYAR</option>
                    <option value="KELURAHAN CIBADAK">KELURAHAN CIBADAK </option>
                    <option value="KELURAHAN KARASAK">KELURAHAN KARASAK</option>
                    <option value="KELURAHAN NYENGSERET">KELURAHAN NYENGSERET</option>
                    <option value="KELURAHAN KARANGANYAR">KELURAHAN KARANGANYAR</option>
                    <option value="KELURAHAN PELINDUNG HEWAN">KELURAHAN PELINDUNG HEWAN</option>
                    <option value="KELURAHAN PANJUNAN">KELURAHAN PANJUNAN</option>
                    
                </select>
            </div>
        </div>
        <div class="mb-3 row">
            <label for="id_transaksi_keluar" class="col-sm-2 col-form-label">ID Transaksi</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name='id_transaksi_keluar' 
                value="{{ $data->id_transaksi_keluar}}" id="id_transaksi_keluar" >
            </div>
        </div>
        <div class="mb-3 row">
            <label for="jenis_barang" class="col-sm-2 col-form-label">Jenis Barang</label>
            <div class="col-sm-10">
                <select name="jenis_barang" id="jenis_barang" class="form-control">
                    <option value="{{ $data->jenis_barang }} ">{{ $data->jenis_barang }} </option>
                    @foreach($jenisbarang as $barang)
                    <option value="{{ $barang->jenis_barang }}">{{ $barang->jenis_barang }}</option>
                    @endforeach
                </select>
                @error('jenis_barang')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <!--
        <div class="mb-3 row">
            <label for="nama_barang" class="col-sm-2 col-form-label">Nama Barang</label>
            <div class="col-sm-10">
                <select name ="nama_barang" class="form-control select2" id="nama_barang" aria-label="Default select example" >
                    <option value="{{ $data->nama_barang }}">{{ $data->id_barang }} {{ $data->nama_barang }}- Rp.{{ number_format($data->harga_barang )}} </option>
                    @foreach ($databarang as $item)
                        <option value="{{ $item->nama_barang }}">{{ $item->id_barang }} {{ $item->nama_barang }} - Rp.{{ number_format($item->harga) }}</option>
                    @endforeach
                </select> 
                @error('nama_barang')
                <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
    -->
        <div class="mb-3 row">
            <label for="id_barang" class="col-sm-2 col-form-label">Id Barang</label>
            <div class="col-sm-10">
                <select name ="id_barang" class="form-control select2" id="id_barang" aria-label="Default select example" ><!--value untuk memanggil flash di databarangControlller-->
                    <option value="{{ $data->id_barang }} ">{{ $data->id_barang }}- {{ $data->nama_barang }} - Rp.{{number_format($data->harga_barang)}}  </option>
                    @foreach ($databarang as $item)
                        <option value="{{ $item->id_barang }}">{{ $item->id_barang }} {{ $item->nama_barang }} - Rp.{{ number_format($item->harga) }}</option>
                    @endforeach
                </select>   
               @error('id_barang')
                <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="jml_barang" class="col-sm-2 col-form-label">Jumlah Barang</label>
            <div class="col-sm-10">
                <input type="number" class="form-control" name='jml_barang' 
                value="{{ $data->jml_barang }}" id="jml_barang">
                @error('jml_barang')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="satuan" class="col-sm-2 col-form-label">Satuan</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name='satuan' 
                value="{{ $data->satuan }}" id="satuan">
                @error('satuan')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        
        <div class="mb-3 row">
            <label for="untuk" class="col-sm-2 col-form-label">Untuk</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name='untuk' 
                value="{{ $data->untuk}}" id="untuk">
                @error('untuk')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="ket" class="col-sm-2 col-form-label">Keterangan</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name='ket' 
                value="{{ $data->ket }}" id="ket">
                @error('ket')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="nama_barang" class="col-sm-2 col-form-label"></label>
            <div class="col-sm-10"><button type="submit" class="btn btn-primary" name="submit">Simpan</button></div>
        </div>
      
    </div>
</form>
    <!-- AKHIR FORM -->
@endsection

<script>
    function sum(){
        var txtFirstNumberValue = document.getElementById('jml_barang').value;
        var txtSecondNumberValue = document.getElementById('harga_barang').value;
        var result = parseInt(txtFirstNumberValue)* parseInt(txtSecondNumberValue);
        if (!isNaN(result)){
            document.getElementById('total').value=result;
        }
    }
    </script>
