@extends('layout.app')
<!-- START FORM -->
@section('content')
<!--jika ada error-->

<form action='{{ url('barangkeluar') }}' method='post' id='myForm'> 
@csrf
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <h5 align="center" class="text-primary"><b>Tambah Data Barang Keluar</b> </h5>
        <div class="mb-3 row">
            <label for="Tanggal" class="col-sm-2 col-form-label datepicker">Tanggal</label>
            <div class="col-sm-2">
                <input type="date" class="form-control" name='Tanggal' 
                value="{{ Session::get('Tanggal') }}" id="Tanggal"> 
                @error('Tanggal')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="inputField" class="col-sm-2 col-form-label">Perangkat daerah</label>
            <div class="col-sm-10">
                <!--<input  class="form-control" name='perangkat_daerah' 
                value="{{ Session::get('perangkat_daerah') }}{{ old('perangkat_daerah') }}" id="perangkat_daerah" > 
                -->
                <select name="perangkat_daerah" id="perangkat_daerah" class="form-control select2">
                    <option value="">- Pilih -</option>
                    <option value="KECAMATAN ASTANAANYAR">KECAMATAN ASTANAANYAR</option>
                    <option value="KELURAHAN CIBADAK">KELURAHAN CIBADAK </option>
                    <option value="KELURAHAN KARASAK">KELURAHAN KARASAK</option>
                    <option value="KELURAHAN NYENGSERET">KELURAHAN NYENGSERET</option>
                    <option value="KELURAHAN KARANGANYAR">KELURAHAN KARANGANYAR</option>
                    <option value="KELURAHAN PELINDUNG HEWAN">KELURAHAN PELINDUNG HEWAN</option>
                    <option value="KELURAHAN PANJUNAN">KELURAHAN PANJUNAN</option>
                    </select>
                @error('perangkat_daerah')
                    <div class="text-danger">{{ $message }}</div>
                @enderror

            </div>
        </div>
        <div class="mb-3 row">
            <label for="jenis_barang" class="col-sm-2 col-form-label">Jenis Barang</label>
            <div class="col-sm-10">
                <select name ="jenis_barang" class="form-control select2 " id="jenis_barang">
                    <option value="{{ old('jenis_barang') }}">- Pilih -</option>
                    @foreach ($jenisbarang as $item)
                        <option value="{{ $item->jenis_barang }}{{ old('jenis_barang') }}">{{ $item->jenis_barang }}</option>
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
                    <option value="">- Pilih -</option>
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
                    <option value="">- Pilih -</option>
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
                <input type="text" class="form-control" name='jml_barang' 
                value="{{ Session::get('jml_barang') }} {{ old('jml_barang') }}" onkeyup="sum()" id="jml_barang">

                @error('jml_barang')
                    <div class="text-danger">{{ $message }}</div>
                @enderror

            </div>
        </div>
        <div class="mb-3 row">
            <label for="satuan" class="col-sm-2 col-form-label">Satuan</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name='satuan' 
                value="{{ Session::get('satuan') }} {{ old('satuan') }}" id="satuan">

                @error('satuan')
                    <div class="text-danger">{{ $message }}</div>
                @enderror

            </div>
        </div>
        
        <div class="mb-3 row">
            <label for="untuk" class="col-sm-2 col-form-label">Untuk</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name='untuk' 
                value="{{ Session::get('untuk') }}{{ old('untuk') }}" id="untuk">

                @error('untuk')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="ket" class="col-sm-2 col-form-label">Keterangan</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name='ket' 
                value="{{ Session::get('ket') }} {{ old('ket') }}" id="ket">
                @error('ket')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="nama_barang" class="col-sm-2 col-form-label"></label>
            <div class="col-sm-10">
                <button type="submit" class="btn btn-primary" name="submit">Simpan</button>
                <a href='{{ url('barangkeluar') }}'class="btn btn-primary ">Kembali</a>
            </div>
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









