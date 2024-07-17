@extends('layout.app')
@section('title', 'Edit Surat')
@section('content')
<form action="{{ url('surat/update') }}" method="POST">
    @csrf
    @method('PUT')
    <div class="row p-2">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Tanggal</th>
                                <th>Semester</th>
                                <th>Nomor Surat</th>
                                <th>Unit Kerja</th>
                                <th>Jenis Barang</th>
                                <th>Nilai</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($data as $surat)
                                <tr>
                                    <input type="hidden" name="id[]" value="{{ $surat->id }}">
                                    <td>
                                        <input type="date" name="tanggal[]" value="{{ $surat->tanggal }}" class="form-control @error('tanggal') is-invalid @enderror">
                                        @error('tanggal')
                                            <div class="text-danger">{{ $message }}</div>
                                        @enderror
                                    </td>
                                    <td>
                                        <input type="text" name="semester[]" value="{{ $surat->semester }}" class="form-control @error('semester') is-invalid @enderror">
                                        @error('semester')
                                            <div class="text-danger">{{ $message }}</div>
                                        @enderror
                                    </td>
                                    <td>
                                        <input type="text" name="no_surat[]" value="{{ $surat->no_surat }}" class="form-control @error('no_surat') is-invalid @enderror">
                                        @error('no_surat')
                                            <div class="text-danger">{{ $message }}</div>
                                        @enderror
                                    </td>
                                    <td>
                                        <input type="text" name="unit_kerja[]" value="{{ $surat->unit_kerja }}" class="form-control @error('unit_kerja') is-invalid @enderror">
                                        @error('unit_kerja')
                                            <div class="text-danger">{{ $message }}</div>
                                        @enderror
                                    </td>
                                    <td>
                                        <select name="persediaan[]" class="form-control @error('persediaan') is-invalid @enderror">
                                            <option value="">- Pilih -</option>
                                            @foreach ($jenisbarang as $barang)
                                                <option value="{{ $barang->jenis_barang }}" {{ $surat->persediaan == $barang->jenis_barang ? 'selected' : '' }}>
                                                    {{ $barang->jenis_barang }}
                                                </option>
                                            @endforeach
                                        </select>
                                        @error('persediaan')
                                            <div class="text-danger">{{ $message }}</div>
                                        @enderror
                                    </td>
                                    <td>
                                        <input type="number" name="nilai[]" value="{{ $surat->nilai }}" class="form-control @error('nilai') is-invalid @enderror">
                                        @error('nilai')
                                            <div class="text-danger">{{ $message }}</div>
                                        @enderror
                                    </td>
                                    
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <a href="{{ url('surat') }}" class="btn btn-primary">Kembali</a>
                            <button type="submit" class="btn btn-primary">Simpan</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
@endsection
