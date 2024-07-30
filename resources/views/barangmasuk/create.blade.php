@extends('layout.app')
<!-- START FORM -->
@section('content')
<!--jika ada error-->

<form action='{{ url('barangmasuk') }}' method='post'> 
@csrf
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <h5 align="center" class="text-primary"><b>Tambah Data Barang Masuk</b> </h5>
        <div class="row mb-3">
            <div class="col-md-2">
                <label for="Tanggal">Tanggal</label>
            </div>
            <div class="col-md-4">
                <input type="date" class="form-control @error('Tanggal') is-invalid @enderror"
                 name="Tanggal" id="Tanggal">
                @error('Tanggal')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="col-md-2" align="right">
                <label for="perangkat_daerah">Perangkat Daerah</label>
            </div>
            <div class="col-md-4">
                <select name ="perangkat_daerah" class="form-control select2 @error('perangkat_daerah') is-invalid @enderror" id="perangkat_daerah" aria-label="Default select example" aria-placeholder="pilih"><!--value untuk memanggil flash di databarangControlller-->
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
                <select name ="jenis_barang" class="form-control select2 @error('jenis_barang') is-invalid @enderror" id="jenis_barang" aria-label="Default select example" aria-placeholder="pilih"><!--value untuk memanggil flash di databarangControlller-->
                    <option value="">- Pilih -</option>
                    @foreach ($jenisbarang as $item)
                        <option value="{{ $item->jenis_barang }}">{{ $item->jenis_barang }}</option>
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
        </div>-->
        <div class="mb-3 row">
            <label for="id_barang" class="col-sm-2 col-form-label">Nama Barang</label>
            <div class="col-sm-10">
                <select name ="id_barang" class="form-control select2" id="id_barang" aria-label="Default select example" ><!--value untuk memanggil flash di databarangControlller-->
                    <option value="">- Pilih -</option>
                    @foreach ($databarang as $item)
                        <option value="{{ $item->id_barang }}">{{ $item->id_barang }} - {{ $item->nama_barang }} - Rp.{{ $item->harga }} </option>
                    @endforeach
                </select> 
                @error('id_barang')
                <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="jml_barang" class="col-sm-2 col-form-label">Jumlah Barang Masuk</label>
            <div class="col-sm-10">
                <input type="number" class="form-control @error('jml_barang') is-invalid @enderror" name='jml_barang' 
                value="{{ Session::get('jml_barang') }}" id="jml_barang">
                @error('jml_barang')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
            
        </div>
        <div class="mb-3 row">
            <label for="jml_barang_awal" class="col-sm-2 col-form-label">Saldo Awal</label>
            <div class="col-sm-10">
                <input type="number" class="form-control @error('jml_barang_awal') is-invalid @enderror" name='jml_barang_awal' 
                value="{{ Session::get('jml_barang_awal') }}" id="jml_barang_awal">
                @error('jml_barang_awal')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
            
        </div>
        <div class="mb-3 row">
            <label for="satuan" class="col-sm-2 col-form-label">Satuan</label>
            <div class="col-sm-10">
                <input type="text" class="form-control @error('satuan') is-invalid @enderror" name='satuan' 
                value="{{ Session::get('satuan') }}" id="satuan">
                @error('satuan')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
            
        </div>
        <div class="mb-3 row">
            <label for="dari" class="col-sm-2 col-form-label">Dari, LS/GU</label>
            <div class="col-sm-10">
                <input type="text" class="form-control @error('satuan') is-invalid @enderror" name='dari' 
                value="{{ Session::get('dari') }}" id="dari">
                @error('dari')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="ket" class="col-sm-2 col-form-label">Ket./PPTK</label>
            <div class="col-sm-10">
                <input type="text" class="form-control @error('ket') is-invalid @enderror" name='ket' 
                value="{{ Session::get('ket') }}" id="ket">
                @error('ket')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <p class="text-danger">**opsional:</p>
        <div class="row mb-3">
            <div class="col-md-2">
                <label for="tanggal_ba_penerimaan">Tanggal B.A. Penerimaan  <i class="text-danger">*</i></label>
            </div>
            <div class="col-md-4">
                <input type="date" class="form-control @error('tanggal_ba_penerimaan') is-invalid @enderror" name="tanggal_ba_penerimaan" id="tanggal_ba_penerimaan">
                @error('tanggal_ba_penerimaan')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="col-md-2" align="right">
                <label for="nomor_ba_penerimaan">Nomor B.A. Penerimaan <i class="text-danger">*</i></label>
            </div>
            <div class="col-md-4">
                <input type="text" class="form-control @error('nomor_ba_penerimaan') is-invalid @enderror" name="nomor_ba_penerimaan" id="nomor_ba_penerimaan">
                @error('nomor_ba_penerimaan')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-2">
                <label for="tanggal_dokumen_faktur">Tanggal Dokumen Faktur <i class="text-danger">*</i></label>
            </div>
            <div class="col-md-4">
                <input type="date" class="form-control @error('tanggal_dokumen_faktur') is-invalid @enderror" name="tanggal_dokumen_faktur" id="tanggal_dokumen_faktur">
                @error('tanggal_dokumen_faktur')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>

            <div class="col-md-2" align="right">
                <label for="nomor_dokumen_faktur">Nomor Dokumen Faktur <i class="text-danger">*</i></label>
            </div>
            <div class="col-md-4">
                <input type="text" class="form-control @error('nomor_dokumen_faktur') is-invalid @enderror" 
                name="nomor_dokumen_faktur" id="nomor_dokumen_faktur">
                @error('nomor_dokumen_faktur')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="nama_barang" class="col-sm-2 col-form-label"></label>
            <div class="col-sm-10">
                <button type="submit" class="btn btn-primary" name="submit"> <i class="fas fa-save"></i> Simpan </button>
                <a href='{{ url('barangmasuk') }}'class="btn btn-primary ">kembali</a>
            </div>
        </div>
      
    </div>
</form>
    <!-- AKHIR FORM -->
@endsection
