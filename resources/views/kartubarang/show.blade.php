@extends('layout.app')
@section('title', 'Detail Barang')
@section('content')
<div class="my-3 p-3 bg-body rounded shadow-sm">
    
    <div class="pb-3">
        <a href='{{ url('kartubarang') }}'class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" align="right">Kembali</a>
        
      </div>
    <p class="font-weight-bold" align="center">Kartu Barang</p>

    @if($barangmasuk->isEmpty())
    <p align="center">Belum ada data barang masuk.</p>
    @else
    @foreach ($barangmasuk as $item)
        @php 
            $NamaBarang = null;
            $satuan =null;
        @endphp
        @php
            $NamaBarang = $item->nama_barang;
            $satuan =$item->satuan;
            $totalMasuk = 0;
            $totalKeluar = 0;
            $totalSisa = 0;
        @endphp
    @endforeach
    <p><strong>Nama Barang: {{ $NamaBarang}} </strong></p>
    <p><strong>Satuan: {{ $satuan }}</strong></p>
    <table class="table table-bordered text-center">
        <thead>
            <tr>
                <th scope="col">No</th>
                <th scope="col">Tanggal</th>
                <th scope="col">Masuk</th>
                <th scope="col">Keluar</th>
                <th scope="col">Sisa</th>
                <th scope="col">Keterangan</th> <!-- Contoh informasi tambahan -->
            </tr>
        </thead>
        <tbody>
            @foreach($barangmasuk as $index => $item)
            @php
                $bmasuk= $item->jml_barang+ $barangkeluar[$index]->jml_barang;
                $jmlKeluar = isset($barangkeluar[$index]) ? (int) $barangkeluar[$index]->jml_barang : 0;
                $Sisa = $bmasuk - $jmlKeluar;
                $totalMasuk += $bmasuk;
                $totalKeluar += $jmlKeluar;
                $totalSisa += $Sisa;
            @endphp
            <tr>
                <td>{{ $index + 1 }}</td>
                <td>{{ $item->Tanggal ?? 'Tidak ada data tanggal' }}</td>
                <td id="jml_barang">{{ $bmasuk }}</td>
                <td>{{ isset($barangkeluar[$index]) ? (int) $barangkeluar[$index]->jml_barang : 0 }}</td>
                <td>{{ $Sisa }}</td>
                <td>{{ $item->ket }}</td>
            </tr>

            @endforeach
            <tr>
                <td colspan="2">Jumlah</td>
                <td id="total">{{ $totalMasuk }}</td>
                <td>{{ $totalKeluar }}</td>
                <td>{{ $totalSisa }}</td>
                <td></td>
            </tr>
        </tbody>
    </table>
    @endif
    
</div>
@endsection
<script>
    function sum(){
        var txtFirstNumberValue = document.getElementById('jml_barang').value;
        var txtSecondNumberValue = document.getElementById('harga_barang').value;
        var result += parseInt(txtFirstNumberValue);
        if (!isNaN(result)){
            document.getElementById('total').value=result;
        }
    }
    </script>
