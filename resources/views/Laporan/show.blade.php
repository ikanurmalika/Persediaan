<!--laporan show-->
@extends('layout.app')
@section('title','Laporan Data Barang')
@section('content')


<div class="my-3 p-3 bg-body rounded shadow-sm">
    <a href='{{ url('cetak-laporan') }}' class="btn btn-primary btn-sm"> Kembali </a>
    @if(Auth::user()->role == 'kelurahan')
    <a href="" onclick="event.preventDefault();
        if (confirm('Yakin akan mengunduh data?')) {
            window.location.href = '/unduh-laporan-kel/' +
            encodeURIComponent('{{ $tglawal }}') + '/' +
            encodeURIComponent('{{ $tglakhir }}') + '/';
        }" class="btn btn-primary btn-sm">Unduh PDF</a>
    @endif
    @if(Auth::user()->role == 'pengelola_barang')
    <a href="" onclick="event.preventDefault();
        if (confirm('Yakin akan mengunduh data?')) {
            window.location.href = '/unduh-laporan/' +
            encodeURIComponent('{{ $tglawal }}') + '/' +
            encodeURIComponent('{{ $tglakhir }}') + '/' + 
            encodeURIComponent('{{ $perangkat_daerah }}');
        }" class="btn btn-primary btn-sm">Unduh PDF</a>
    @endif
</div>

<div class="card shadow mb-4">
    <div class="card-body">
<div class="surat-header">
        
    <div class="row p-2">
        <div class="col-md-6" >Provinsi       : <span>    Jawa Barat</span></div>
    </div>
    <div class="row p-2">
        <div class="col-md-6" >Kota            : <span >   Bandung</span></div>
    </div>
    <div class="row p-2">
        <div class="col-md-6" >Perangkat Daerah:  <span >{{ $perangkat_daerah }}</span></div>
       
    </div>
    <div class="row p-2">
        <div class="col-md-6" >Sumber Penerimaan:  <span >APBD</span></div>
       
    </div>

</div>
<p align="center"><strong>LAPORAN REKAPITULASI BARANG PERSEDIAAN</strong></p>
<P align="center"><strong>TAHUN {{ $tahunAwal }}</strong></P>
<div class="form-group">
<table class="static text-center" align="center" rules="all" border="1px" style="width: 100%;">
            <thead>
                <tr>
                    <th rowspan="2">NO</th>
                    <th rowspan="2" colspan="2">URAIAN JENIS BARANG</th>
                    <th colspan="4">NILAI (RP)</th>
                </tr>
                <tr>
                    <th>SALDO AWAL (Audited)</th>
                    <th>MASUK</th>
                    <th>KELUAR</th>
                    <th>SALDO AKHIR</th>
                </tr>
            </thead>
            <tbody>
                @php
                    // Mengelompokkan data berdasarkan tipe barang
                    $groupedByType = $jenisbarang->groupBy('tipe');
                    $groupedData = $data->groupBy('jenis_barang');
                    $groupedData2 = $data2->groupBy('jenis_barang');

                    // Variabel untuk menghitung total keseluruhan
                    $totalAwal = 0;
                    $totalMasuk = 0;
                    $totalKeluar = 0;
                    $totalAkhir = 0;
                @endphp

                @foreach ($groupedByType as $tipe => $jenisGroup)
                    <!-- Menampilkan header untuk tipe barang -->
                    <tr >
                        <td align="center">{{ $loop->iteration }}</td>
                        <td colspan="6" align="left"><strong>{{ $tipe }}</strong></td>
                    </tr>

                    @foreach ($jenisGroup as $jenis)
                        @php
                            // Dapatkan item terkait jenis barang dari data dan data2
                            $groupItems = $groupedData->get($jenis->jenis_barang, collect());
                            $groupItems2 = $groupedData2->get($jenis->jenis_barang, collect());
                            //$groupItems = $data->where('jenis_barang', $jenis->jenis_barang);
                            //$groupItems2 = $data2->where('jenis_barang', $jenis->jenis_barang);

                            // Variabel untuk menghitung subtotal
                            $subtotalJumlahHargaAwal = 0;
                            $subtotalJumlahHargaMasuk = 0;
                            $subtotalJumlahHargaKeluar = 0;
                            $subtotalJumlahHargaAkhir = 0;

                            // Menghitung subtotal berdasarkan item terkait
                            foreach ($groupItems as $index => $item) {
                                $subtotalJumlahHargaAwal += $item->jml_harga_awal;
                                $subtotalJumlahHargaMasuk += $item->jml_harga;
                                $dataKeluar = $groupItems2->get($index); // Mendapatkan data terkait
                                if ($dataKeluar) {
                                    $subtotalJumlahHargaKeluar += $dataKeluar->total_harga_keluar;
                                    $JumlahBarangAkhir = $item->jml_barang_awal + $item->jml_barang - $dataKeluar->jml_barang;
                                    $JumlahHargaAkhir = $JumlahBarangAkhir * $item->harga_barang;
                                    $subtotalJumlahHargaAkhir += $JumlahHargaAkhir;
                                }
                            }
                            
                            // Tambahkan ke total keseluruhan
                            $totalAwal += $subtotalJumlahHargaAwal;
                            $totalMasuk += $subtotalJumlahHargaMasuk;
                            $totalKeluar += $subtotalJumlahHargaKeluar;
                            $totalAkhir += $subtotalJumlahHargaAkhir;
                        @endphp

                        <tr>
                            <td align="center">{{ $loop->iteration }}</td>
                            <td>{{ $jenis->kode }}</td>
                            <td>{{ $jenis->jenis_barang }}</td>
                            <td align="center">@if($subtotalJumlahHargaAwal > 0) {{ number_format($subtotalJumlahHargaAwal )}} @else  @endif</td>
                            <td align="center">@if($subtotalJumlahHargaMasuk > 0) {{ number_format($subtotalJumlahHargaMasuk) }} @else  @endif</td>
                            <td align="center">@if($subtotalJumlahHargaKeluar > 0) {{ number_format($subtotalJumlahHargaKeluar) }} @else  @endif</td>
                            <td align="center">@if($subtotalJumlahHargaAkhir > 0) {{ number_format($subtotalJumlahHargaAkhir) }} @else - @endif</td>
                        </tr>
                    @endforeach
                @endforeach
                

                <!-- Total Keseluruhan -->
                <tr align="center">
                    <td></td>
                    <td colspan="2" align="center"><strong>Total </strong></td>
                    <td colspan="2" align="center"><strong>Total </strong></td>
                    <td>{{ $totalAwal > 0 ? number_format($totalAwal) : '-' }}</td>
                    <td>{{ $totalMasuk > 0 ? number_format($totalMasuk) : '-' }}</td>
                    <td>{{ $totalKeluar > 0 ? number_format($totalKeluar) : '-' }}</td>
                    <td>{{ $totalAkhir > 0 ? number_format($totalAkhir) : '-' }}</td>
                </tr>
            </tbody>
        </table>

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
        @if ($perangkat_daerah== 'KECAMATAN ASTANAANYAR' ||$perangkat_daerah=="SE-KECAMATAN")
        
        <table  align="center" width=100%>
                <tr>
                    <th width="25%"></th>
                    <th width="50%"></th>
                    <th width="25%"></th>
                </tr>
                <tr>
                    <td></td>
                    <td align="center" >CAMAT ASTANAANYAR</td>
                    <td ></td>
                </tr>
                <tr>
                    <td></td>
                    <td align="center">Selaku</td>
                    <td ></td>
                </tr>
                <tr>
                    <td></td>
                    <td align="center">{{ $jabatan3 }}</td>
                    <td ></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <br><br><br><br> 
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td >  </td>
                    <td align="center"><u>{{ $nama3 }}</u></td>
                    <td >   </td>
                </tr>
                <tr>
                    <td></td>
                    <td align="center">
                        {{ $nip3 }}
                    </td>
                    <td></td>
                </tr>
                </tr>
        </table>
        @endif
</div>
    </div>
</div>
@endsection