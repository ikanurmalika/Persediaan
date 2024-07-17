@extends('layout.app')
<!-- START FORM -->
@section('content')
<!--jika ada error-->

<form action='{{ url('TTD-Surat') }}' method='post'> 
@csrf
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <div class="pb-3">
        <a href='{{ url('TTD-Surat') }}'class="btn btn-primary ">kembali</a>
        </div>
        <div class="mb-3 row">
            <label for="unit_kerja" class="col-sm-2 col-form-label datepicker">Perangkat Daerah</label>
            <div class="col-sm-4">
                <select name="unit_kerja" id="unit_kerja" class="form-control select2">
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
                @error('unit_kerja')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>

        <p>1. Data Pejabat Penatausahaan Pengguna Barang / Kuasa Pengguna Barang</p>
        <div class="mb-3 row">
            <label for="nama1" class="col-sm-2 col-form-label">Nama </label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name='nama1' 
                value="{{ Session::get('nama1') }}" id="nama1">
                @error('nama1')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="nip1" class="col-sm-2 col-form-label">NIP </label>
            <div class="col-sm-10">
                <input type="number" class="form-control" name='nip1' 
                value="{{ Session::get('nip1') }}" id="nip1">
                @error('nip1')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="jabatan1" class="col-sm-2 col-form-label">Selaku / Jabatan</label>
            <div class="col-sm-10">
                <select name ="jabatan1" class="form-control select2 @error('jabatan1') is-invalid @enderror" id="jabatan1" aria-label="Default select example" aria-placeholder="pilih"><!--value untuk memanggil flash di databarangControlller-->
                    <option value="">- Pilih -</option>
                    <option value="Kuasa Pengguna Barang">Kuasa Pengguna Barang</option>
                    <option value="Pengguna Barang">Pengguna Barang </option>
                    <option value="Pengurus Barang Pennguna">Pengurus Barang Pengguna</option>
                    <option value="Pejabat Penatausahaan Pengguna Barang">Pejabat Penatausahaan Pengguna Barang </option>
                    
                </select> 
                @error('jabatan1')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>

        <p>2. Pengurus Barang Pengguna</p>
        <div class="mb-3 row">
            <label for="nama2" class="col-sm-2 col-form-label">Nama </label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name='nama2' 
                value="{{ Session::get('nama2') }}" id="nama1">
                @error('nama2')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="nip2" class="col-sm-2 col-form-label">NIP </label>
            <div class="col-sm-10">
                <input type="number" class="form-control" name='nip2' 
                value="{{ Session::get('nip2') }}" id="nip2">
                @error('nip2')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="jabatan2" class="col-sm-2 col-form-label">Selaku / Jabatan</label>
            <div class="col-sm-10">
                <select name ="jabatan2" class="form-control select2 @error('jabatan2') is-invalid @enderror" id="jabatan2" aria-label="Default select example" aria-placeholder="pilih"><!--value untuk memanggil flash di databarangControlller-->
                    <option value="">- Pilih -</option>
                    <option value="Kuasa Pengguna Barang">Kuasa Pengguna Barang</option>
                    <option value="Pengguna Barang">Pengguna Barang </option>
                    <option value="Pengurus Barang Pennguna">Pengurus Barang Pengguna</option>
                    <option value="Pejabat Penatausahaan Pengguna Barang">Pejabat Penatausahaan Pengguna Barang </option>
                    
                </select> 
                @error('jabatan2')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <p>3. Camat</p>
        <div class="mb-3 row">
            <label for="nama3" class="col-sm-2 col-form-label">Nama </label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name='nama3' 
                value="{{ Session::get('nama3') }}" id="nama3">
                @error('nama3')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="nip3" class="col-sm-2 col-form-label">NIP </label>
            <div class="col-sm-10">
                <input type="number" class="form-control" name='nip3' 
                value="{{ Session::get('nip3') }}" id="nip3">
                @error('nip3')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="jabatan3" class="col-sm-2 col-form-label">Selaku / Jabatan</label>
            <div class="col-sm-10">
                <select name ="jabatan3" class="form-control select2 @error('jabatan3') is-invalid @enderror" id="jabatan1" aria-label="Default select example" aria-placeholder="pilih"><!--value untuk memanggil flash di databarangControlller-->
                    <option value="">- Pilih -</option>
                    <option value="Kuasa Pengguna Barang">Kuasa Pengguna Barang</option>
                    <option value="Pengguna Barang">Pengguna Barang </option>
                    <option value="Pengurus Barang Pennguna">Pengurus Barang Pengguna</option>
                    <option value="Pejabat Penatausahaan Pengguna Barang">Pejabat Penatausahaan Pengguna Barang </option>
                    
                </select> 
                @error('jabatan3')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="mb-3 row">
            <label for="jabatan" class="col-sm-2 col-form-label"></label>
            <div class="col-sm-10"><button type="submit" class="btn btn-primary" name="submit">Simpan</button></div>
        </div>
      
    </div>
</form>
    <!-- AKHIR FORM -->
@endsection
