@extends('layout.app')
@section('title','dashboard')

<!-- START FORM -->
@section('content')
<!--jika ada error-->

<form action='{{ url('cetak-bukubarang') }}' method='get'> 
@csrf
<!--@ method('PUT')-->
<div class="my-3 p-3 bg-body rounded shadow-sm">
    <div>
    <h5 align="center" class="text-primary"><b>Buku Barang</b></h5>
    <p>Silahkan pilih tanggal terlebih dahulu:</p>
    </div>

    <div class="mb-3 row">
        <label for="Tanggal" class="col-sm-2 col-form-label datepicker">Tanggal Awal</label>
        <div class="col-sm-4">
            <input type="date" class="form-control @error('tglawal') is-invalid @enderror" name='tglawal' 
            value="{{ Session::get('Tanggal') }}" id="tglawal" > 
            @error('tglawal')
                <div class="text-danger">{{ $message }}</div>
            @enderror
        </div>
    </div>
    <div class="mb-3 row">
        <label for="Tanggal" class="col-sm-2 col-form-label datepicker">Tanggal Akhir</label>
        <div class="col-sm-4">
            <input type="date" class="form-control @error('tglakhir') is-invalid @enderror" name='tglakhir' 
            value="{{ Session::get('Tanggal') }}" id="tglakhir"> 
            @error('tglakhir')
                <div class="text-danger">{{ $message }}</div>
            @enderror
        </div>
    </div>
    @if(Auth::user()->role =='pengelola_barang')
    <div class="mb-3 row">
        <label for="perangkat_daerah" class="col-sm-2 col-form-label datepicker">Perangkat Daerah</label>
        <div class="col-sm-4">
            <select name="perangkat_daerah" id="perangkat_daerah" class="form-control select2">
            <option value="">- Pilih -</option>
            <option value="SE-KECAMATAN">SE-KECAMATAN</option>
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
    @endif
    <!--
    <div class="mb-3 row">
        <label for="kode" class="col-sm-2 col-form-label">Jenis Barang</label>
        <div class="col-sm-4">
            <select name="kode" id="kode" class="form-control select2">
                <option value="">- Pilih Jenis Barang -</option>
                <option value="semua">- Semua Jenis Barang -</option>
                @foreach($jenisbarang as $barang)
                <option value="{{ $barang->kode }}" {{ old('kode') == $barang->kode ? 'selected' : '' }}> {{ $barang->kode }} {{ $barang->jenis_barang }} </option>
                @endforeach
            </select>
            @error('kode')
            <div class="text-danger">{{ $message }}</div>
            @enderror
        </div>
    </div>
-->
<div class="mb-3 row">
    <label for="nama_barang" class="col-sm-2 col-form-label"></label>
    <div class="col-sm-10">
                @if(Auth::user()->role =='pengelola_barang')
<a href="" onclick="this.href='/LihatBukubarang/'+document.getElementById('tglawal').value
        +'/'+document.getElementById('tglakhir').value+(document.getElementById('perangkat_daerah') ? '/' + document.getElementById('perangkat_daerah').value : '')"
    class="btn btn-primary btn-sm">Lihat Data</a>
@endif
@if(Auth::user()->role =='kelurahan')
<a href="" onclick="this.href='/BukuBarang-show/'+document.getElementById('tglawal').value
+'/'+document.getElementById('tglakhir').value"class="btn btn-primary btn-sm">Lihat Data</a>
@endif    
    </div>
</div>



    </div>
</form>
    
@endsection