@extends('layout.app')
@section('title', 'Dashboard')
<!-- START FORM -->
@section('content')

<div class="form-group">
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <a href='{{ url('barangkeluar') }}' class="btn btn-primary btn-sm">Kembali</a>
        @if(Auth::user()->role == 'pengelola_barang')
            <a href="" onclick="event.preventDefault();
                if (confirm('Yakin akan mengunduh data?')) {
                window.location.href = '/unduhPertanggal/' +
                encodeURIComponent('{{ $tglawal }}') + '/' +
                encodeURIComponent('{{ $tglakhir }}') + '/' +
                encodeURIComponent('{{ $kode }}') + '/' +
                encodeURIComponent('{{ $perangkat_daerah ?? '' }}');
              }" class="btn btn-primary btn-sm">Unduh PDF</a>
        @endif
        @if(Auth::user()->role == 'kelurahan')
            <a href="" onclick="event.preventDefault();
            if (confirm('Yakin akan mengunduh data?')) {
                window.location.href = '/unduhbarang/' +
                encodeURIComponent('{{ $tglawal }}') + '/' +
                encodeURIComponent('{{ $tglakhir }}') + '/' +
                encodeURIComponent('{{ $kode }}');
                }" class="btn btn-primary btn-sm">Unduh PDF</a>
        @endif
    </div>

    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="my-3 p-3 bg-body rounded shadow-sm">
                <div class="row p-2">
                    <div class="col-md-6">Provinsi: <span>Jawa Barat</span></div>
                </div>
                <div class="row p-2">
                    <div class="col-md-6">Kota: <span>Bandung</span></div>
                </div>
                <div class="row p-2">
                    <div class="col-md-6">Perangkat Daerah: <span>{{ $perangkat_daerah == 'semua' ? 'Kecamatan Astana Anyar' : $perangkat_daerah }}</span></div>
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

                <table align="center" width="100%">
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
                            <td>Bandung, {{ $tanggal }} {{ $bulanAkhir }} {{ $tahunAkhir }}</td>
                        </tr>
                        @foreach($ttd_surat as $item1)
                            @php
                                $nama1= $item1->nama1;
                                $nip1 = $item1->nip1;
                                $jabatan1 = $item1->jabatan1;
                                $nama2= $item1->nama2;
                                $nip2 = $item1->nip2;
                                $jabatan2 = $item1->jabatan2;
                            @endphp
                        @endforeach
                        <tr align="center">
                            <td>{{ $jabatan1 }}</td>
                            <td></td>
                            <td>{{ $jabatan2 }}</td>
                        </tr>
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
        </div>
    </div>
</div>

@endsection
