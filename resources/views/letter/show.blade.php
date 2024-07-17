@extends('layout.app')
@section('title', 'Detail Barang')
@section('content')

<p class="font-weight-bold" align="center">Surat Inventaris</p>
    <div class="pb-3 d-flex justify-content-between">
        <div>
            <a href="{{ url('surat') }}" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">Kembali</a>
            <a href="{{ route('surat.cetak', ['id' => $id]) }}" class="btn btn-primary btn-sm">
                <i class="fas fa-download fa-sm text-white-50"></i> Unduh 
            </a>
        </div>
    </div>
<div class="my-3 p-3 bg-body rounded shadow-sm">
    
    <div class="surat-header">
        <table align="center" width="100%" style="border-collapse: collapse;">
            <tr>
                <td width="20%" style="text-align: center;" align="right">
                    <img src="{{ asset('template/img/KotaBandung.png') }}"  alt="Logo Kota Bandung" width="100" height="100">
                </td>
                <td width="80%" style="text-align: left;">
                    <h1 style="margin: 0; font-size: 20px;"><b>PEMERINTAH KOTA BANDUNG</b></h1>
                    <h2 style="margin: 0; font-size: 18px; padding-top: 5px;"><b>KECAMATAN ASTANAANYAR</b></h2>
                    <p style="margin: 0; padding-top: 5px;">
                        Jalan Bojongloa No. 69 Telp. 022-5200419 Bandung 40242
                    </p>
                </td>
            </tr>
        </table>
    </div>
    
    <hr style="border: 1px solid #000;"> 
    
    <div class="form-group">
        @foreach($surat as $item)
       @php
           $no_surat = $item->no_surat;
           $semester =$item->semester;
           $unit_kerja=$item->unit_kerja
        @endphp
    @endforeach
        <p align="center" ><b>BERITA ACARA INVENTARISASI FISIK BARANG PERSEDIAAN</b></p>
        <p align="center" ><b>SEMESTER {{ $semester }} Tahun {{ $tahun }}</b></p>
        <p><b></b>Pada hari ini {{ $tanggal }}, kami yang bertanda tangan di bawah ini:</p>
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
        <table  width=100%>
            <tr>
                <th width=2%></th>
                <th width=15%></th>
                <th width=80%></th>
            </tr>
        <tbody>
            @if (strpos($unit_kerja, 'Astana Anyar') !== false)
            <tr>
                <td>1.</td>   <td>Nama Lengkap</td>   <td>: {{ $nama3 }}</td>
            </tr>
            <tr>
                <td ></td>    <td>NIP</td>           <td>: {{ $nip3 }}</td>
            </tr>
            <tr>
                <td></td>    <td>Jabatan</td>        <td>: {{ $jabatan3 }}</td>
            </tr>
            <tr>
                <td>2.</td>   <td>Nama Lengkap</td>   <td>: {{ $nama1 }}</td>
            </tr>
            <tr>
                <td ></td>    <td>NIP</td>           <td>: {{ $nip1 }}</td>
            </tr>
            <tr>
                <td></td>    <td>Jabatan</td>        <td>: {{ $jabatan1 }}</td>
            </tr>

            <tr>
                <td>3.</td>   <td>Nama Lengkap</td>   <td>: {{ $nama2 }}</td>
            </tr>
            <tr>
                <td ></td>    <td>NIP</td>           <td>: {{ $nip2 }}</td>
            </tr>
            <tr>
                <td></td>    <td>Jabatan</td>        <td>: {{ $jabatan2 }}</td>
            </tr>
            <tr></tr>
            @else
            <tr>
                <td>1.</td>   <td>Nama Lengkap</td>   <td>: {{ $nama1 }}</td>
            </tr>
            <tr>
                <td ></td>    <td>NIP</td>           <td>: {{ $nip1 }}</td>
            </tr>
            <tr>
                <td></td>    <td>Jabatan</td>        <td>: {{ $jabatan1 }}</td>
            </tr>

            <tr>
                <td>2.</td>   <td>Nama Lengkap</td>   <td>: {{ $nama2 }}</td>
            </tr>
            <tr>
                <td ></td>    <td>NIP</td>           <td>: {{ $nip2 }}</td>
            </tr>
            <tr>
                <td></td>    <td>Jabatan</td>        <td>: {{ $jabatan2 }}</td>
            </tr>
            <tr></tr>
            @endif
        </tbody>
    </table>
    
        <p>Berdasarkan Surat Undangan BKAD Nomor: {{ $no_surat }} 
            untuk Melaksanakan Rekonsiliasi Barang Persediaan Semester {{ $semester }} T.A {{ $tahun }} yang berada pada Kecamatan Astanaanyar</p>
        <p>Bahwa menurut Buku/Kartu Barang Persediaan diperoleh Persediaan sebagai berikut:</p>
        
        <table class="static text-center" align="center" rules="all"  border="1px" style="width: 100%;">
            <thead>
            <tr>
                <th class="text-center">No</th>
                <th>Persediaan</th>
                <th>Nilai</th>
            </tr>
            </thead>
            <tbody>
            @foreach ($surat as $item)
            <tr>
                <td align="center">{{ $loop->iteration }}</td>
                <td>{{ $item->persediaan}}</td>
                <td>{{ number_format($item->nilai) }}</td>
            </tr>
            @endforeach
            </tbody>
            <tfoot>
                @php
                        $total = 0;
                    @endphp

                    @foreach($surat as $item)
                        @php
                            $total += $item->nilai; // Menghitung total
                        @endphp
                    @endforeach
                    <tr>
                        <td colspan="2" align="right">Jumlah</td>
                        <td colspan="2">{{ number_format($total)}}</td>
                    </tr>
                    <?php  ?>
            </tfoot>

        </table>
        <p>Berdasarkan inventarisasi fisik tersebut, diperoleh hasil sebagai berikut :</p>
        <table class="static text-center" align="center" rules="all" border="1px" style="width: 100%;">
            <thead>
            <tr>
                <th class="text-center">No</th>
                <th>Persediaan</th>
                <th>Nilai</th>
            </tr>
            </thead>
            <tbody>
            @foreach ($surat as $item)
            <tr>
                <td align="center">{{ $loop->iteration }}</td>
                <td>{{ $item->persediaan}}</td>
                <td>{{ number_format($item->nilai) }}</td>
            </tr>
            @endforeach
            </tbody>
            <tfoot>
                @php
                        $total = 0;
                    @endphp

                    @foreach($surat as $item)
                        @php
                            $total += $item->nilai;
                            //$tgl = $item->tanggal // Menghitung total
                        @endphp
                    @endforeach
                    <tr>
                        <td colspan="2" align="right">Jumlah</td>
                        <td colspan="2">{{ number_format($total)}}</td>
                    </tr>
                    <?php  ?>
            </tfoot>

        </table>
        <p>Barang-barang   persediaan  tersebut  di atas masih dalam pengelolaan kami, rincian lebih lanjut							
            mengenai  barang-barang  persediaan  dapat  dilihat  pada  lampiran yang  tidak terpisahkan dari							
            Berita Acara ini.							
        </p>
        <p>Demikian Berita Acara ini dibuat untuk digunakan sebagaimana mestinya</p>
        @if(strpos($unit_kerja, 'KECAMATAN ASTANAANYAR') !== false)
        <table  align="center" width=100%>
                <tr>
                    <th width="45%" class="text-center">{{ $jabatan1 }}</th>
                    <th width="10%" class="text-center" align="center"></th>
                    <th width="45%" class="text-center" align ="center">{{ $jabatan2 }}</th>
                </tr>
            <tbody>
                <tr>
                    <td></td>
                    <td>
                        <br><br><br><br> 
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td align="center"> <u>{{ $nama1 }}</u> </td>
                    <td> </td>
                    <td align="center">  <u>{{ $nama2 }}  </u>
                    </td>
                </tr>
                <tr>
                    <td align="center">NIP.{{ $nip1 }}</td>
                    <td></td>
                    <td align="center">NIP.{{ $nip2 }}</td>
                </tr>
            </tbody>
        </table>
        <table  align="center" width=100%>
                <tr>
                    <th width="25%"></th>
                    <th width="50%"></th>
                    <th width="25%"></th>
                </tr>
                <tr>
                    <td></td>
                    <td align="center" >Mengetahui,</td>
                    <td ></td>
                </tr>
                <tr>
                    <td></td>
                    <td align="center" >CAMAT ASTANA ANYAR</td>
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
                        NIP.{{ $nip3 }}
                    </td>
                    <td></td>
                </tr>
                </tr>
            </tbody>
        </table>
        @else
        <table  align="center" width=100%>
            <tr>
                <th width="45%"></th>
                <th width="10%"></th>
                <th width="45%"></th>
            </tr>
            <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td align="center">Bandung, {{ $tgl }}</td>
                </tr>
            <tr>
                <td align="center" >Mengetahui,</td>
                <td ></td>
                <td></td>
            </tr>
            <tr>
                <td align="center" >Lurah {{ $unit_kerja }}</td>
                <td ></td>
                <td></td>
            </tr>
            <tr>
                <td align="center">Selaku</td>
                <td ></td>
                <td></td>
            </tr>
            <tr>
                <td align="center">{{ $jabatan1 }}</td>
                <td></td>
                <td align="center">{{ $jabatan2 }}</td>
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
                <td >  </td>
                <td align="center"> <u>{{ $nama2 }}</u> </td>
            </tr>
            <tr>
                <td align="center"> NIP.{{ $nip1 }}</td>
                <td></td>
                <td align="center">NIP.{{ $nip2}}</td>
            </tr>
            </tr>
            @endif
            </tbody>
        </table>
    
</div>

    @endsection

