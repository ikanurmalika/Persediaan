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
    <title>Unduh Surat </title>
    
</head>
<body>
    <div class="surat-header">
        <table align="center" width="100%" style="border-collapse: collapse;">
            <tr>
                <td width="20%" style="text-align: center;" align="right">
                    <img src="{{ asset('template/img/KotaBandung.png') }}"  alt="Logo Kota Bandung" width="100" height="100">
                </td>
                <td width="80%" style="text-align: center;">
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
        
        <p align="center" ><b>BERITA ACARA INVENTARISASI FISIK BARANG PERSEDIAAN</b></p>
        <p><b></b>Pada hari ini <span id="hari-tanggal"></span>, kami yang bertanda tangan di bawah ini:</p>
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
                <td>{{ $item->nilai }}</td>
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
                <td>{{ $item->nilai }}</td>
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
        <p>Barang-barang   persediaan  tersebut  di atas masih dalam pengelolaan kami, rincian lebih lanjut							
            mengenai  barang-barang  persediaan  dapat  dilihat  pada  lampiran yang  tidak terpisahkan dari							
            Berita Acara ini.							
        </p>
        <table  align="center" width=100%>
                <tr>
                    <th width="45%">Pejabat Penatausahaan Pengguna Barang</th>
                    <th width="10%"></th>
                    <th width="45%">Pengurus Barang Pengguna</th>
                </tr>
            <tbody>
                
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
                    <td align="center"> <u>THOMAS BAYU AJI,S.IP </u> </td>
                    <td> </td>
                    <td align="center">  <u> DIFA NOVIANTI,S.IP  </u>
                    </td>
                </tr>
                <tr>
                    <td align="center">NIP.197306292008011002</td>
                    <td></td>
                    <td align="center">
                        NIP.199311022019032014
                    </td>
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
                    <td align="center">Pengguna Barang</td>
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
                    <td align="center"><u> Drs. H. AMIN JARKASIH, M.M</u></td>
                    <td >   </td>
                </tr>
                <tr>
                    <td></td>
                    <td align="center">
                        NIP. 196902021990071001
                    </td>
                    <td></td>
                </tr>
                </tr>
            </tbody>
        </table>
        <script type="text/javascript">
             window.print();
        </script>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var totalHarga = 0;
        var hargaElements = document.querySelectorAll('.harga-total');

        hargaElements.forEach(function(element) {
            var harga = parseInt(element.textContent);
            if (!isNaN(harga)) {
                totalHarga += harga;
            }
        });

        document.getElementById('total-harga').innerText = totalHarga.toLocaleString();
    });
</script>

<script type="text/javascript">
    // Function untuk mendapatkan nama hari dari indeks hari
    function getHari(indeks) {
        var hari = ["Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu"];
        return hari[indeks];
    }

    // Function untuk mendapatkan nama bulan dari indeks bulan
    function getBulan(indeks) {
        var bulan = ["Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember"];
        return bulan[indeks];
    }

    document.addEventListener("DOMContentLoaded", function() {
        var tanggalSekarang = new Date();
        var namaHari = getHari(tanggalSekarang.getDay());
        var tanggal = tanggalSekarang.getDate();
        var namaBulan = getBulan(tanggalSekarang.getMonth());
        var tahun = tanggalSekarang.getFullYear();

        var tanggalFormatted = namaHari + ", " + tanggal + " " + namaBulan + " " + tahun;

        document.getElementById('hari-tanggal').innerText = tanggalFormatted;
    });
</script>

    </div>
</body>