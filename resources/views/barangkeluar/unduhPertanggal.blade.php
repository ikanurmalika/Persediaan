<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width ,initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
        table.static {
            position: relative;
            border: 1px solid #543535;
        }
    </style>
    <title>Unduh Data Barang Keluar</title>
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
            @if($perangkat_daerah=='semua')
            <div class="col-md-6">Perangkat Daerah: <span>Kecamatan Astana Anyar</span></div>
            @else
            <div class="col-md-6">Perangkat Daerah: <span>{{ $perangkat_daerah }}</span></div>
            @endif
        </div>
        <p align="center"><b>BUKU PENGELUARAN</b></p>
        <p align="center"><b>BULAN {{ $bulanAwal }} s/d {{ $bulanAkhir }} TAHUN {{ $tahunAwal }}</b></p>

        <table class="static text-center" align="center" rules="all" border="1px" style="width: 100%;">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Tanggal</th>
                    <th>Merk/Nama Barang</th>
                    <th colspan="2">Jumlah Barang</th>
                    <th>Harga Satuan</th>
                    <th>Harga</th>
                    <th>Untuk</th>
                    <th>Keterangan</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $grandTotal = 0;
                @endphp
                @if ($perangkat_daerah == 'SE-KECAMATAN')
                    @foreach ($unduh->groupBy('jenis_barang') as $jenis_barang => $items)
                        @php
                            $totalJenisBarang = 0;
                        @endphp
                        <tr>
                            <td colspan="9" align="left" style="background-color:rgb(235, 231, 5)"><b>{{ $jenis_barang }}</b></td>
                        </tr>
                        @foreach($items->groupBy('perangkat_daerah') as $itemGroup)
                            <tr>
                                <td colspan="9" style="text-align: left; background-color:lightblue"><b>{{ $itemGroup->first()->perangkat_daerah }}</b></td>
                            </tr>
                            @foreach ($itemGroup as $item)
                                <tr>
                                    <td align="center">{{ $loop->iteration }}</td>
                                    <td>{{ $item->Tanggal }}</td>
                                    <td>{{ $item->nama_barang }}</td>
                                    <td>{{ $item->jml_barang }}</td>
                                    <td>{{ $item->satuan }}</td>
                                    <td>{{ number_format($item->harga_barang) }}</td>
                                    <td>{{ number_format($item->total_harga_keluar) }}</td>
                                    <td align="center">{{ $item->untuk }}</td>
                                    <td align="center">{{ $item->ket }}</td>
                                </tr>
                                @php
                                    $totalJenisBarang += $item->total_harga_keluar;
                                @endphp
                            @endforeach
                            <tr>
                                <td colspan="6" align="right">Jumlah {{ $jenis_barang }}</td>
                                <td>{{ number_format($totalJenisBarang) }}</td>
                                <td colspan="2"></td>
                            </tr>
                        @endforeach
                        @php
                            $grandTotal += $totalJenisBarang;
                        @endphp
                        <tr>
                            <td colspan="6" align="right"><b>Jumlah Total {{ $jenis_barang }}</b></td>
                            <td colspan="2"><b>{{ number_format($totalJenisBarang) }}</b></td>
                        </tr>
                    @endforeach
                @elseif ($kode == 'semua')
                    @foreach ($unduh->groupBy('jenis_barang') as $jenis_barang => $items)
                        @php
                            $subtotal = 0;
                        @endphp
                        <tr>
                            <td colspan="9" align="left" style="background-color:rgb(235, 231, 5)"><b>{{ $jenis_barang }}</b></td>
                        </tr>
                        @foreach ($items as $item)
                            <tr>
                                <td align="center">{{ $loop->iteration }}</td>
                                <td>{{ $item->Tanggal }}</td>
                                <td>{{ $item->nama_barang }}</td>
                                <td>{{ $item->jml_barang }}</td>
                                <td>{{ $item->satuan }}</td>
                                <td>{{ number_format($item->harga_barang) }}</td>
                                <td>{{ number_format($item->total_harga_keluar) }}</td>
                                <td align="center">{{ $item->untuk }}</td>
                                <td align="center">{{ $item->ket }}</td>
                            </tr>
                            @php
                                $subtotal += $item->total_harga_keluar;
                            @endphp
                        @endforeach
                        <tr>
                            <td colspan="6" align="right">Jumlah {{ $jenis_barang }}</td>
                            <td>{{ number_format($subtotal) }}</td>
                            <td colspan="2"></td>
                        </tr>
                        @php
                            $grandTotal += $subtotal;
                        @endphp
                    @endforeach
                    <tr>
                        <td colspan="6" align="right"><b>Jumlah Total</b></td>
                        <td><b>{{ number_format($grandTotal) }}</b></td>
                        <td colspan="2"></td>
                    </tr>
                @else
                    @php
                        $jml_total = 0;
                    @endphp
                    @foreach ($unduh as $item)
                        <tr>
                            <td align="center">{{ $loop->iteration }}</td>
                            <td>{{ $item->Tanggal }}</td>
                            <td>{{ $item->nama_barang }}</td>
                            <td>{{ $item->jml_barang }}</td>
                            <td>{{ $item->satuan }}</td>
                            <td>{{ number_format($item->harga_barang) }}</td>
                            <td>{{ number_format($item->total_harga_keluar) }}</td>
                            <td align="center">{{ $item->untuk }}</td>
                            <td align="center">{{ $item->ket }}</td>
                        </tr>
                        @php
                            $jml_total += $item->total_harga_keluar;
                        @endphp
                    @endforeach
                    <tr>
                        <td colspan="6" align="right"><b>Jumlah Total</b></td>
                        <td colspan="4" align="left">{{ number_format($jml_total) }}</td>
                    </tr>
                @endif
            </tbody>
        </table>

        <table align="center" width=100%>
            <tr></tr>
            <tr>
                <th width="45%"></th>
                <th width="10%"></th>
                <th width="45%"></th>
            </tr>
            <tbody>
                <tr align="center">
                    <td>Mengetahui,</td>
                    <td></td>
                    <td>Bandung,{{ $tanggal }} {{ $bulanAkhir }} {{ $tahunAkhir }}</td>
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
                <tr align="center">
                    <td>{{ $jabatan1 }}</td>
                    <td></td>
                    <td>{{ $jabatan2 }}</td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <br><br><br><br>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td align="center"><u>{{ $nama1 }}</u></td>
                    <td></td>
                    <td align="center"><u>{{ $nama2 }}</u></td>
                </tr>
                <tr>
                    <td align="center">NIP.{{ $nip1 }}</td>
                    <td></td>
                    <td align="center">NIP.{{ $nip2 }}</td>
                </tr>
            </tbody>
        </table>


        <script>
            document.addEventListener("DOMContentLoaded", function() {
                var totalHarga = 0;
                var hargaElements = document.querySelectorAll('.harga-total');

                hargaElements.forEach(function(element) {
                    var harga = parseInt(element.textContent.replace(/,/g, ''));
                    if (!isNaN(harga)) {
                        totalHarga += harga;
                    }
                });

                document.getElementById('total-harga').innerText = totalHarga.toLocaleString();
            });
        </script>
    </div>
</body>

</html>
