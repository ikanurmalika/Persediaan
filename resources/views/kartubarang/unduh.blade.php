<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width ,initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
        table.static{
            position:relative;
            border: 1px solid #543535;
        }
    </style>
    <title>Unduh Kartu Barang</title>
    
</head>
<body>
    <div class="form-group">
        <div class="row p-2">
            <div class="col-md-6">
                Provinsi: <span>Jawa Barat</span>
            </div>
        </div>
        <div class="row p-2">
            <div class="col-md-6">
                Kota: <span>Bandung</span>
            </div>
        </div>
        <div class="row p-2">
            <div class="col-md-6">
                Perangkat Daerah: <span>{{ $perangkat_daerah }}</span>
            </div>
        </div>
        <div class="row p-2">
            <div class="col-md-6">
                Sumber Penerimaan: <span>-</span> <!-- Placeholder atau teks default -->
            </div>
        </div>
    <p class="font-weight-bold" align="center"><strong>KARTU BARANG</strong></p>
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
    <table class="static text-center" align="center" rules="all" border="1px" style="width: 100%;">
        <thead>
            <tr align="center">
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
<p></p>
<p></p>
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
</table>

</div>

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
        <script type="text/javascript">
             window.print();
        </script>


    </div>
</body>