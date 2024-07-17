@extends('layout.app')
@section('title', 'Detail Barang')
@section('content')
<div class="my-3 p-3 bg-body rounded shadow-sm">
    
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <a href='{{ url('kartubarang') }}' class="btn btn-primary btn-sm"> Kembali </a>
        @if(Auth::user()->role =='kelurahan')
        <a href="" onclick="event.preventDefault();
            if (confirm('Yakin akan mengunduh data?')) {
            window.location.href = '/unduh-kartubarang-kel/' +
            encodeURIComponent('{{ $tglawal }}') + '/' +
            encodeURIComponent('{{ $tglakhir }}') + '/'+ encodeURIComponent('{{ $id_barang }}') }"
             class="btn btn-primary btn-sm">Unduh PDF</a>
        @endif
        @if(Auth::user()->role =='pengelola_barang')
        <a href="" onclick="event.preventDefault();
            if (confirm('Yakin akan mengunduh data?')) {
            window.location.href = '/unduh-kartubarang/' +
            encodeURIComponent('{{ $tglawal }}') + '/' +
            encodeURIComponent('{{ $tglakhir }}') + '/' +
            encodeURIComponent('{{ $id_barang }}') +'/'+({{ $perangkat_daerah ? "encodeURIComponent('$perangkat_daerah')" : "''" }});
            }" class="btn btn-primary btn-sm">Unduh PDF</a>
        @endif
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
                <td>{{ $item->jml_barang }}</td>
                <td>{{ isset($barangkeluar[$index]) ? (int) $barangkeluar[$index]->jml_barang : 0 }}</td>
                <td>{{ $Sisa }}</td>
                <td>{{ $item->ket }}</td>
            </tr>
            <tr>
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
    <table  align="center" width=100%>
        @foreach($ttd_surat as $item1)
            @php
                $nama1= $item1->nama1;
                $nip1=$item1->nip1;
                $jabatan1=$item1->jabatan1;
                $nama2= $item1->nama2;
                $nip2=$item1->nip2;
                $jabatan2=$item1->jabatan2;
                $nama3= $item1->nama3;
                $nip3=$item1->nip3;
                $jabatan3=$item1->jabatan3;
            @endphp
        @endforeach
        <tr align="center">
            <td>Mengetahui,</td>
            <td></td>
            <td>Bandung,{{ $tanggal }} {{ $bulanAkhir }} {{ $tahunAkhir }}</td>
        </tr>
        <tr align="center">
            <th width="45%"></th>
            <th width="10%"></th>
            <th width="45%"></th>
        </tr>
            <tr align="center">
                <td >{{ $jabatan1 }}</td>
                <td ></td>
                <td >{{ $jabatan2 }}</td>
            </tr>
            
            <tr>
                <td>
                </td>
                <td>
                    <br><br><br><br> 
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td align="center"> <u>{{ $nama1 }} </u> </td>
                <td> </td>
                <td align="center">  <u>{{ $nama2 }} </u>
                </td>
            </tr>
            <tr>
                <td align="center">{{ $nip1 }}</td>
                <td></td>
                <td align="center">
                   {{ $nip2 }}
                </td>
            </tr>
    </table>

</div>
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
