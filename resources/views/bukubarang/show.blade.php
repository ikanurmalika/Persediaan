@extends('layout.app')
@section('title','dashboard')

@section('content')
<div class="form-group">
    <div class="my-3 p-3 bg-body rounded shadow-sm">
        <a href='{{ url('Bukubarang') }}' class="btn btn-primary btn-sm"> Kembali </a>
        @if(Auth::user()->role =='kelurahan')
        <a href="" onclick="event.preventDefault();
            if (confirm('Yakin akan mengunduh data?')) {
            window.location.href = '/Bukubarang-unduh/' +
            encodeURIComponent('{{ $tglawal }}') + '/' +
            encodeURIComponent('{{ $tglakhir }}') + '/'}" class="btn btn-primary btn-sm">Unduh PDF</a>
        @endif
        @if(Auth::user()->role =='pengelola_barang')
        <a href="" onclick="event.preventDefault();
            if (confirm('Yakin akan mengunduh data?')) {
            window.location.href = '/unduh-Bukubarang/' +
            encodeURIComponent('{{ $tglawal }}') + '/' +
            encodeURIComponent('{{ $tglakhir }}') +'/'+({{ $perangkat_daerah ? "encodeURIComponent('$perangkat_daerah')" : "''" }});
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
            <div class="col-md-6" >Unit Kerja:  <span >Kecamatan Astanaanyar</span></div>
        </div>
        <div><p></p></div>
        <div><p></p></div>
        <div><p align="center"><strong> BARANG PERSEDIAAN</strong></p></div>

    </div>
    <div class="form-group">
        <table class="static text-center" align="center" rules="all" border="1px" style="width: 100%;">
            <thead>
                <tr>
                    <th class="text-center" align="center" rowspan="3">No</th>
                    <th rowspan="3"  align="center">Jenis Barang</th>
                    <th colspan="4"  align="center">Saldo awal</th>
                    <th colspan="4"  align="center">Penerimaan</th>
                    <th rowspan="3" align="center">Jenis Barang</th>
                    <th colspan="4"  align="center">Pengeluaran</th>
                    <th colspan="4" align="center">Saldo Akhir </th>
                </tr>
                <tr>
                    <th colspan="2">Jumlah Barang</th>
                    <th >Harga Satuan</th>
                    <th >Jml harga</th>
                    <th colspan="2">Jml Barang</th>
                    <th >Harga Satuan</th>
                    <th >Jumlah harga</th>
                    <th colspan="2">Jml Barang</th>
                    <th >Harga Satuan</th>
                    <th >Jml harga</th>
                    <th colspan="2">Jml Barang</th>
                    <th >Harga Satuan</th>
                    <th >Jml harga</th>
                </tr>
                <tr>
                    <th colspan="2" ></th>
                    <th >Rp</th>
                    <th >Rp</th>
                    <th colspan="2"></th>
                    <th >Rp</th>
                    <th >Rp</th>
                    <th colspan="2"></th>
                    <th >Rp</th>
                    <th >Rp</th>
                    <th colspan="2"></th>
                    <th >Rp</th>
                    <th >Rp</th>
                </tr>
            </thead>
            
            <tbody>
                @php
                    // Mengelompokkan data berdasarkan jenis_barang
                    $groupedData = $data->groupBy('jenis_barang');
                    $groupedData2 = $data2->groupBy('jenis_barang'); // Kelompokkan data2 juga jika diperlukan
                    
                    // Variabel untuk menghitung total keseluruhan
                    $totalAwal = 0;
                    $total = 0;
                    $totalKeluar = 0;
                    $totalAkhir = 0;
                @endphp
                
                @foreach($jenisbarang as $jenis)
                    <tr align="left">
                        <td style="background-color: lightgreen;" align="center"><strong>{{ $loop->iteration }}</strong></td>
                        <td colspan="19" style="background-color: lightgreen;"><strong>{{ $jenis->jenis_barang }}</strong></td>
                    </tr>
                    
                    @php
                        // Dapatkan item untuk jenis barang ini dari groupedData
                        $groupItems = $groupedData->get($jenis->jenis_barang, collect());
                        $groupItems2 = $groupedData2->get($jenis->jenis_barang, collect());
                        
                        // Variabel untuk menghitung subtotal untuk setiap jenis_barang
                        $subtotalJumlahHargaAwal = 0;
                        $subtotalJumlahHarga = 0;
                        $subtotalJumlahHargaKeluar = 0;
                        $subtotalJumlahHargaAkhir = 0;
                        $rowNumber = 1; // Reset row number untuk setiap grup
                    @endphp
                    
                    @if ($groupItems->isEmpty())
                        <tr>
                            <td colspan="20" align="center"></td> <!-- Tampilkan baris kosong jika tidak ada data -->
                        </tr>
                    @elseif($perangkat_daerah=='SE-KECAMATAN')
                        @php
                        //kelompokkan berdasarkan perangkat_daerah
                        $kelompok1 = $groupItems->groupBy('perangkat_daerah');
                        $kelompok2 = $groupItems2->groupBy('perangkat_daerah');
                        @endphp
                        @foreach ($kelompok1 as $perangkat_daerah => $items)
                        <tr align="left">
                            <td style="background-color: lightblue;" align="center"><strong>{{ $loop->iteration }}</strong></td>
                            <td colspan="19" style="background-color: lightblue;"><strong>{{ $perangkat_daerah }}</strong></td>
                        </tr>

                        @php
                            $subtotalPerangkatAwal = 0;
                            $subtotalPerangkat = 0;
                            $subtotalPerangkatKeluar = 0;
                            $subtotalPerangkatAkhir = 0;
                        @endphp

                        @foreach ($items as $index => $item)
                            @php
                                $subtotalJumlahHargaAwal += $item->jml_harga_awal;
                                $subtotalJumlahHarga += $item->jml_harga;
                                $dataKeluar = $kelompok2->get($perangkat_daerah)->firstWhere('nama_barang', $item->nama_barang);
                                if ($dataKeluar) {
                                    $subtotalJumlahHargaKeluar += $dataKeluar->total_harga_keluar;
                                    $JumlahBarangAkhir = $item->jml_barang_awal + $item->jml_barang - $dataKeluar->jml_barang;
                                    $JumlahHargaAkhir = $JumlahBarangAkhir * $item->harga_barang;
                                    $subtotalJumlahHargaAkhir += $JumlahHargaAkhir;
                                }
                            @endphp

                            <tr>
                                <td align="center">{{ $rowNumber }}</td>
                                <td>{{ $item->nama_barang }}</td>
                                <td>{{ $item->jml_barang_awal }}</td>
                                <td>{{ $item->satuan }}</td>
                                <td>{{ $item->harga_barang }}</td>
                                <td>{{ $item->jml_harga_awal }}</td>
                                <td>{{ $item->jml_barang }}</td>
                                <td>{{ $item->satuan }}</td>
                                <td>{{ $item->harga_barang }}</td>
                                <td align="center">{{ $item->jml_harga }}</td>
                                @if ($dataKeluar)
                                    <td>{{$dataKeluar->nama_barang }}</td>
                                    <td>{{ $dataKeluar->jml_barang }}</td>
                                    <td>{{ $dataKeluar->satuan}}</td>
                                    <td>{{ number_format($dataKeluar->harga_barang) }}</td>
                                    <td>{{ number_format($dataKeluar->total_harga_keluar) }}</td>
                                    <td>{{ $JumlahBarangAkhir }}</td>
                                    <td>{{ $dataKeluar->satuan }}</td>
                                    <td>{{ number_format($dataKeluar->harga_barang) }}</td>
                                    <td>{{ number_format($JumlahHargaAkhir) }}</td>
                                @endif
                                @php
                                    $subtotalPerangkatAwal += $item->jml_harga_awal;
                                    $subtotalPerangkat += $item->jml_harga;
                                    if ($dataKeluar) {
                                        $subtotalPerangkatKeluar += $dataKeluar->total_harga_keluar;
                                        $subtotalPerangkatAkhir += $JumlahHargaAkhir;
                                    }
                                    $rowNumber++;
                                @endphp
                            </tr>
                        @endforeach

                        <tr style="background-color: yellow;">
                            <td></td>
                            <td colspan="4" align="right">Sub Jumlah {{ $perangkat_daerah }}</td>
                            <td>{{number_format($subtotalPerangkatAwal) }}</td>
                            <td colspan="3"></td>
                            <td>{{ number_format($subtotalPerangkat) }}</td>
                            <td colspan="4"></td>
                            <td>{{ number_format($subtotalPerangkatKeluar) }}</td>
                            <td colspan="3"></td>
                            <td>{{ number_format($subtotalPerangkatAkhir) }}</td>
                        </tr>
                    @endforeach
                    @php
                        // Tambahkan subtotal ini ke total keseluruhan
                        $totalAwal += $subtotalJumlahHargaAwal;
                        $total += $subtotalJumlahHarga;
                        $totalKeluar += $subtotalJumlahHargaKeluar;
                        $totalAkhir += $subtotalJumlahHargaAkhir;
                    @endphp

                        <tr style="background-color: lightblue;">
                            <td></td>
                            <td colspan="4" align="right">Total Keseluruhan</td>
                            <td>{{number_format($totalAwal) }}</td>
                            <td colspan="3"></td>
                            <td>{{ number_format($total) }}</td>
                            <td colspan="4"></td>
                            <td>{{number_format( $totalKeluar )}}</td>
                            <td colspan="3"></td>
                            <td>{{ number_format($totalAkhir) }}</td>
                        </tr>
                    @else
                        @foreach ($groupItems as $index => $item) <!-- Loop untuk setiap item di dalam groupItems -->
                        @php
                            // Menghitung subtotal
                            $subtotalJumlahHargaAwal += $item->jml_harga_awal;
                            $subtotalJumlahHarga += $item->jml_harga;
                            
                            $dataKeluar = $groupItems2->get($index); // Mendapatkan data dari groupItems2
                            
                            if ($dataKeluar) {
                                $subtotalJumlahHargaKeluar += $dataKeluar->total_harga_keluar;
                                $JumlahBarangAkhir = $item->jml_barang_awal + $item->jml_barang - $dataKeluar->jml_barang;
                                $JumlahHargaAkhir = $JumlahBarangAkhir * $item->harga_barang;
                                $subtotalJumlahHargaAkhir += $JumlahHargaAkhir;
                            }
                        @endphp
        
                        <tr>
                            <td align="center">{{ $rowNumber }}</td> <!-- Menampilkan row number -->
                            <td>{{ $item->nama_barang }}</td>
                            <td>{{ $item->jml_barang_awal }}</td>
                            <td>{{ $item->satuan }}</td>
                            <td>{{ number_format($item->harga_barang) }}</td>
                            <td>{{ number_format($item->jml_harga_awal) }}</td>
                            <td>{{ $item->jml_barang }}</td>
                            <td>{{ $item->satuan }}</td>
                            <td>{{ number_format($item->harga_barang) }}</td>
                            <td align="center">{{number_format( $item->jml_harga) }}</td>
                            
                            @if ($dataKeluar)
                                <td >{{ $dataKeluar->nama_barang }}</td>
                                <td>{{ $dataKeluar->jml_barang }}</td>
                                <td>{{ $dataKeluar->satuan }}</td>
                                <td>{{ number_format($dataKeluar->harga_barang) }}</td>
                                <td>{{number_format( $dataKeluar->total_harga_keluar) }}</td>
                                <td>{{ $JumlahBarangAkhir }}</td>
                                <td>{{ $dataKeluar->satuan }}</td>
                                <td>{{ number_format($dataKeluar->harga_barang) }}</td>
                                <td>{{ number_format($JumlahHargaAkhir) }}</td>
                            @else
                                <td colspan="4">-</td> <!-- Kolom kosong jika tidak ada data -->
                            @endif
                            
                            @php
                                $rowNumber++; // Increment row number
                            @endphp
                        </tr>
                    @endforeach
                    
                    <!-- Subtotal untuk grup ini -->
                    <tr style="background-color: yellow;">
                        <td></td>
                        <td colspan="4" align="right">Sub Jumlah</td>
                        <td>{{ number_format($subtotalJumlahHargaAwal) }}</td>
                        <td colspan="3"></td>
                        <td>{{ number_format($subtotalJumlahHarga) }}</td>
                        <td colspan="4"></td>
                        <td>{{ number_format($subtotalJumlahHargaKeluar) }}</td>
                        <td colspan="3"></td>
                        <td>{{ number_format($subtotalJumlahHargaAkhir) }}</td>
                    </tr>
                    
                    @php
                        // Tambahkan subtotal ini ke total keseluruhan
                        $totalAwal += $subtotalJumlahHargaAwal;
                        $total += $subtotalJumlahHarga;
                        $totalKeluar += $subtotalJumlahHargaKeluar;
                        $totalAkhir += $subtotalJumlahHargaAkhir;
                    @endphp

                    @endif
                @endforeach
                
                <!-- Total keseluruhan -->
                <tr style="background-color: lightblue;">
                    <td></td>
                    <td colspan="4" align="center"><strong>Total </strong></td>
                    <td>{{ number_format($totalAwal) }}</td> <!-- Tampilkan total awal -->
                    <td colspan="3"></td>
                    <td>{{number_format( $total )}}</td> <!-- Tampilkan total -->
                    <td colspan="4"></td>
                    <td>{{ number_format($totalKeluar) }}</td> <!-- Tampilkan total keluar -->
                    <td colspan="3"></td>
                    <td>{{ number_format($totalAkhir) }}</td> <!-- Tampilkan total akhir -->
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
    </div></div>
    </div>
@endsection
