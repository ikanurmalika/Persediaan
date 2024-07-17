@extends('layout.app')

@section('content')

<form action="{{ url('surat') }}" method="post">
    @csrf
    <div class="row p-2">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="row mt-1">
                        <div class="col-md-2">
                            <label for="tanggal">Tanggal</label>
                        </div>
                        <div class="col-md-4">
                            <input type="date" class="form-control @error('tanggal') is-invalid @enderror" name="tanggal" id="tanggal">
                            @error('tanggal')
                                <div class="text-danger">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="col-md-2" align="right">
                            <label for="semester">Semester</label>
                        </div>
                        <div class="col-md-4">
                            <input type="number" class="form-control @error('semester') is-invalid @enderror" name="semester" id="semester">
                            @error('semester')
                                <div class="text-danger">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col-md-2">
                            <label for="no_surat">Nomor Surat</label>
                        </div>
                        <div class="col-md-10">
                            <input type="text" class="form-control @error('no_surat') is-invalid @enderror" name="no_surat" id="no_surat">
                            @error('no_surat')
                                <div class="text-danger">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col-md-2">
                            <label for="unit_kerja">Perangkat Daerah</label>
                        </div>
                        <div class="col-md-10">
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
                    <div id="dynamic-form">
                        <div class="row mt-1">
                            <div class="col-md-2">
                                <label for="persediaan">Jenis Barang</label>
                            </div>
                            <div class="col-md-10">
                                <select name="persediaan[]" class="form-control select2 @error('persediaan') is-invalid @enderror" id="jenis_barang" aria-label="Default select example">
                                    <option value="">- Pilih -</option>
                                    @foreach ($jenisbarang as $produk)
                                        <option value="{{ $produk->jenis_barang }}">{{ $produk->jenis_barang }}</option>
                                    @endforeach
                                </select>
                                @error('persediaan')
                                    <div class="text-danger">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>
                        <div class="row mt-1">
                            <div class="col-md-2">
                                <label for="nilai">Nilai</label>
                            </div>
                            <div class="col-md-10">
                                <input type="number" class="form-control @error('nilai') is-invalid @enderror" name="nilai[]" id="nilai">
                                @error('nilai')
                                    <div class="text-danger">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>
                    </div>
                
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <button type="button" class="btn btn-secondary" id="add-row">Tambah Baris</button>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <a href="{{ url('surat') }}" class="btn btn-primary">Kembali</a>
                            <button type="submit" class="btn btn-primary" name="submit">Tambah</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<script>
document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('add-row').addEventListener('click', function () {
        var dynamicForm = document.getElementById('dynamic-form');
        var newRow = `
        <hr style="border: 1px solid #000;">
        <div class="row mt-1">
            <div class="col-md-2">
                <label for="persediaan">Jenis Barang</label>
            </div>
            <div class="col-md-10">
                <select name="persediaan[]" class="form-control select2 @error('persediaan') is-invalid @enderror" aria-label="Default select example">
                    <option value="">- Pilih -</option>
                    @foreach ($databarang as $produk)
                        <option value="{{ $produk->jenis_barang }}">{{ $produk->jenis_barang }}</option>
                    @endforeach
                </select>
                @error('persediaan')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        <div class="row mt-1">
            <div class="col-md-2">
                <label for="nilai">Nilai</label>
            </div>
            <div class="col-md-10">
                <input type="number" class="form-control @error('nilai') is-invalid @enderror" name="nilai[]" id="nilai">
                @error('nilai')
                    <div class="text-danger">{{ $message }}</div>
                @enderror
            </div>
        </div>
        `;
        dynamicForm.insertAdjacentHTML('beforeend', newRow);
    });
});
</script>
<script>
    $(document).ready(function() {
     $('#jenis_barang').select2();
});
</script>
@endsection
