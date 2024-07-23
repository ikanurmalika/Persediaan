<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
        table.static {
            position: relative;
            border: 1px solid #543535;
        }
        body {
            font-size: 11px;
        }
    </style>
    <title>Unduh Data Barang Masuk</title>
</head>

<body>
    <div class="form-group">
        <div class="row p-2">
            <div class="col-md-6">Provinsi: <span>Jawa Barat</span></div>
        </div>
        <div class="row p-2">
            <div class="col-md-6">Kota: <span>Bandung</span></div>
        </div>
        <div class="row p-2">
            <div class="col-md-6">Unit Kerja: <span>Kecamatan Astanaanyar</span></div>
        </div>
        <div class="row p-2">
            @if($perangkat_daerah=='semua')
            <div class="col-md-6">Perangkat Daerah: <span>Se- Kecamatan</span></div>
            @else
            <div class="col-md-6">Perangkat Daerah: <span>{{ $perangkat_daerah }}</span></div>
            @endif
        </div>
        
        <p align="center"><b>BUKU PENERIMAAN</b></p>
        <p align="center"><b>Bulan {{ $bulanAwal }} - {{ $bulanAkhir }} {{ $tahunAwal }}</b></p>

        <table class="static text-center" align="center" rules="all" border="1px" style="width: 100%;">
            
            <thead>
                <tr>
                    <th rowspan="3">No</th>
                    <th rowspan="3">Tanggal</th>
                    <th rowspan="3">Dari, LS/GU</th>
                    <th rowspan="2" colspan="2">Dokumen Faktur</th>
                    <th rowspan="3">Nama Barang</th>
                    <th rowspan="3" colspan="2">Jumlah Barang/ Satuan</th>
                    
                    <th rowspan="3">Harga Satuan(Rp)</th>
                    <th rowspan="3">Jumlah Harga</th>
                    <th colspan="2">Bukti Penerimaan</th>
                    <th rowspan="3">Ket./PPTK</th>
                </tr>
                <tr>
                    <th colspan="2">B.A. Penerimaan</th>
                </tr>
                <tr>
                    <th> Nomor</th>
                    <th> Tanggal</th>
                    <th> Nomor</th>
                    <th> Tanggal</th>
                </tr>
            </thead>
            <tbody>
                @if ($perangkat_daerah == 'SE-KECAMATAN')
                        @php
                            $grandTotal = 0;
                            $sisa = 0;
                        @endphp
                        @foreach ($unduh->groupBy('jenis_barang') as $jenis_barang => $items)
                            @php
                                $totalJenisBarang = 0;
                            @endphp
                            <tr>
                                <td colspan="13" style="text-align: left; background-color: rgb(243, 227, 9);"><b>{{ $jenis_barang }}</b></td>
                            </tr>
                            @foreach($items->groupBy('perangkat_daerah') as $itemGroup)
                                <tr>
                                    <td colspan="13" style="text-align: left; background-color:lightblue"><b>{{ $itemGroup->first()->perangkat_daerah }}</b></td>
                                </tr>
                                @php
                                    $subtotal = 0;
                                @endphp
                                @foreach ($itemGroup as $item)
                                    @php
                                        $totalbarang = $item->jml_barang + $item->jml_barang_awal;
                                        $totalharga = $item->jml_harga + $item->jml_harga_awal;
                                        $sisa += $item->jml_harga_awal;
                                    @endphp
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ $item->Tanggal }}</td>
                                        <td>{{ $item->dari }}</td>
                                        <td></td>
                                        <td></td>
                                        <td>{{ $item->nama_barang }}</td>
                                        <td align="center">{{ $totalbarang }}</td>
                                        <td>{{ $item->satuan }}</td>
                                        <td align="right">{{ number_format($item->harga_barang) }}</td>
                                        <td align="right">{{ number_format($totalharga) }}</td>
                                        <td></td>
                                        <td></td>
                                        <td align="center">{{ $item->ket }}</td>
                                    </tr>
                                    @php
                                        $subtotal += $totalharga;
                                    @endphp
                                @endforeach
                                <tr>
                                    <td colspan="9" align="right">Jumlah</td>
                                    <td colspan="4">{{ number_format($subtotal) }}</td>
                                </tr>
                                @php
                                    $totalJenisBarang += $subtotal;
                                @endphp
                            @endforeach
                            <tr>
                                <td colspan="9" align="right"><b>Jumlah Total {{ $jenis_barang }}</b></td>
                                <td colspan="4"><b>{{ number_format($totalJenisBarang) }}</b></td>
                            </tr>
                            @php
                                $grandTotal += $totalJenisBarang;
                            @endphp
                        @endforeach
                        <tr align="center">
                            <td colspan="9" align="center"><b>Grand Total</b></td>
                            <td colspan="4"><b>{{ number_format($grandTotal) }}</b></td>
                        </tr>
                @endif

                @if ($kode == 'semua')
                    @php
                    $grandTotal = 0;
                    $sisa=0;
                    @endphp
                    @foreach ($unduh->groupBy('jenis_barang') as $jenis_barang => $items)
                    <tr>
                        <td colspan="13" style="text-align: left;"><b>{{ $jenis_barang }}</b></td>
                    </tr>
                    @php
                    $subtotal = 0;
                    $totalharga=0;
                    $totalbarang=0;
                    
                    $totalbelanja=0;
                    @endphp
                    @foreach ($items as $item)
                    @php
                    
                    $totalbarang=$item->jml_barang+ $item->jml_barang_awal;
                    $totalharga=$item->jml_harga+$item->jml_harga_awal;
                    $sisa += $item->jml_harga_awal;
                    @endphp
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>{{ $item->Tanggal }}</td>
                        <td>{{ $item->dari }}</td>
                        <td ></td>
                        <td></td>
                        <td>{{ $item->nama_barang }}</td>
                        <td align="center">{{ $totalbarang }}</td>
                        <td >{{ $item->satuan }}</td>
                        <td align="right">{{ number_format($item->harga_barang) }}</td>
                        <td align="right">{{ number_format($totalharga) }}</td>
                        <td></td>
                        <td></td>
                        <td align="center">{{ $item->ket }}</td>
                    </tr>
                    @php
                    $subtotal += $totalharga;
                    
                    @endphp
                    @endforeach
                    <tr>
                        <td colspan="9" align="right">Jumlah </td>
                        <td colspan="4">{{ number_format($subtotal) }}</td>
                    </tr>
                    @php
                    $grandTotal += $subtotal;
                    @endphp
                    @endforeach
                    <tr align="center">
                        <td colspan="9" align="center"><b>Jumlah Total</b></td>
                        <td colspan="4"><b>{{ number_format($grandTotal) }}</b></td>
                    </tr>
                    <tr align="center">
                        <td colspan="9" align="center"><b>Sisa Saldo</b></td>
                        <td colspan="4" >{{ number_format($sisa) }}</td>
                    </tr>
                    @php
                    $totalbelanja = $grandTotal - $sisa;
                    @endphp
                    <tr align="center">
                        <td colspan="9" align="center"><b>Total pembelanjaan Bulan {{ $bulanAwal }} - {{ $bulanAkhir }} {{ $tahunAwal }}</b></td>
                        <td colspan="4" >{{ number_format($totalbelanja) }}</td>
                    </tr>

                @else
                    @php
                    $total = 0;
                    $totalharga=0;
                    $totalbarang=0;
                    $sisasaldo=0;
                    $totalbelanja=0;
                    @endphp
                    @foreach ($unduh as $item)
                    @php
                    $totalbarang=$item->jml_barang+ $item->jml_barang_awal;
                    $totalharga=$item->jml_harga+$item->jml_harga_awal;
                    @endphp
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>{{ $item->Tanggal }}</td>
                        <td>{{ $item->dari }}</td>
                        <td ></td>
                        <td></td>
                        <td>{{ $item->nama_barang }}</td>
                        <td>{{ $totalbarang }}</td>
                        <td>{{ $item->satuan }}</td>
                        <td>{{ number_format($item->harga_barang) }}</td>
                        <td >{{number_format($totalharga)}}</td>
                        <td ></td>
                        <td></td>
                        <td>{{ $item->ket }}</td>
                    </tr>
                    @php
                    $total += $totalharga;
                    $sisasaldo +=$item->jml_harga_awal;
                    @endphp
                    @endforeach
                    <tr>
                        <td colspan="9" align="center"><b>Jumlah Total</b></td>
                        <td colspan="4" >{{ number_format($total) }}</td>
                    </tr>
                    <tr>
                        <td colspan="9" align="center"><b>Sisa Saldo</b></td>
                        <td colspan="4" >{{ number_format($sisasaldo) }}</td>
                    </tr>
                    @php
                    $totalbelanja = $total - $sisasaldo;
                    @endphp
                    <tr>
                        <td colspan="9" align="center"><b>Total pembelanjaan Bulan {{ $bulanAwal }} - {{ $bulanAkhir }} {{ $tahunAwal }}</b></td>
                        <td colspan="4" >{{ number_format($totalbelanja) }}</td>
                    </tr>
                @endif
                
            </tbody>
            
        </table>

        <table align="center" width="100%">
            <tr>
                <td align="center"><p>Mengetahui,</p></td>
                <td></td>
                <td align="center"><p>Bandung,{{ $tanggal }} {{ $bulanAkhir }} {{ $tahunAkhir }}</p></td>
            </tr>
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
            <tr>
                <th width="45%">{{ $jabatan1 }}</th>
                <th width="10%"></th>
                <th width="45%">{{ $jabatan2 }}</th>
            </tr>
            <tbody>
                <tr>
                    <td></td>
                    <td><br><br><br><br></td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center"><u>{{ $nama1 }}</u></td>
                    <td></td>
                    <td align="center"><u>{{ $nama2 }}</u></td>
                </tr>
                <tr>
                    <td align="center">NIP. {{ $nip1 }}</td>
                    <td></td>
                    <td align="center">NIP. {{ $nip2 }}</td>
                </tr>
            </tbody>
        </table>


    </div>

    <script type="text/javascript">
        window.print();
    </script>
</body>

</html>
