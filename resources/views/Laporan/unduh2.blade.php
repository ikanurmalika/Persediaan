@extends('layout.app')
@section('title','dashboard')

<!-- START FORM -->
@section('content')
<!--jika ada error-->

<form action='{{ url('barangkeluar') }}' method='get'> 
@csrf
<!--@ method('PUT')-->
    <!--<div class="my-3 p-3 bg-body rounded shadow-sm">
        <a href='{{ url('laporan') }}' class="btn btn-primary btn-sm"> kembali </a>
        </div>-->
        <div>
            <h5 align="center" class="text-primary"><b>Laporan Rekapitulasi </b></h5>
            <p>Silahkan pilih tanggal terlebih dahulu:</p>
        </div>
        <div class="my-3 p-3 bg-body rounded shadow-sm">

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
        <div class="col-sm-4">
            @if(Auth::user()->role =='pengelola_barang')
            <a href="" onclick="this.href='/show-laporan/'+document.getElementById('tglawal').value
                    +'/'+document.getElementById('tglakhir').value+(document.getElementById('perangkat_daerah') ? '/' + document.getElementById('perangkat_daerah').value : '')"
                class="btn btn-primary btn-sm">Lihat Laporan</a>
            @endif
            @if(Auth::user()->role =='kelurahan')
                    <a href="" onclick="this.href='/show-laporan-kel/'+document.getElementById('tglawal').
                    value +'/'+ document.getElementById('tglakhir').value"  class="btn btn-primary btn-sm" >
                    Lihat Laporan</a>
            @endif
        </div>
        
      
    </div>
</form>
    <!-- AKHIR FORM -->
@endsection
