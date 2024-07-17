@extends('layout.app')
@section('title','barangkeluar')
@section('content')
 <!-- START DATA -->
 <div class="my-3 p-3 bg-body rounded shadow-sm">
    <!-- FORM PENCARIAN -->
    <div class="pb-3">
      <form class="d-flex" action="{{ url('bukubarang') }}" method="get">
          <input class="form-control me-1" type="search" name="katakunci" value="" 
          placeholder="Masukkan kata kunci" aria-label="Search">
          <button class="btn btn-primary" type="submit">
            <i class="fas fa-search fa-sm"></i>
        </button>
      </form>
    </div>
    
    <!-- TOMBOL TAMBAH DATA -->
    <div class="pb-3">
      <a href='{{ url('cetak-bukubarang') }}' class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
        class="fas fa-download fa-sm text-white-50"></i> Unduh</a>
    </div>
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Buku Barang</h6>
    </div>
<div class="card shadow mb-4">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered text-left" id="dataTable" width="100%" cellspacing="0">
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
                        <th colspan="2">Jml Barang</th>
                        <th >Harga Satuan</th>
                        <th >Jml harga</th>
                        <th colspan="2">Jml Barang</th>
                        <th >Harga Satuan</th>
                        <th >Jml harga</th>
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
                        $groupedData2 = $data2->groupBy('jenis_barang'); 
                        // Kelompokkan data2 juga jika diperlukan
                        
                        // Variabel untuk menghitung total keseluruhan
                        $totalAwal = 0;
                        $total = 0;
                        $totalKeluar = 0;
                        $totalAkhir = 0;
                    @endphp
                    
                    @foreach($jenisbarang as $jenis)
                        <tr>
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
                                <td colspan="20" align="center">Tidak ada data</td> <!-- Tampilkan baris kosong jika tidak ada data -->
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
                                    <td>{{ $item->harga_barang }}</td>
                                    <td>{{ $item->jml_harga_awal }}</td>
                                    <td>{{ $item->jml_barang }}</td>
                                    <td>{{ $item->satuan }}</td>
                                    <td>{{ $item->harga_barang }}</td>
                                    <td align="center">{{ $item->jml_harga }}</td>
                                    
                                    @if ($dataKeluar)
                                        <td >{{ $dataKeluar->nama_barang }}</td>
                                        <td>{{ $dataKeluar->jml_barang }}</td>
                                        <td>{{ $dataKeluar->satuan }}</td>
                                        <td>{{ $dataKeluar->harga_barang }}</td>
                                        <td>{{ $dataKeluar->total_harga_keluar }}</td>
                                        <td>{{ $JumlahBarangAkhir }}</td>
                                        <td>{{ $dataKeluar->satuan }}</td>
                                        <td>{{ $dataKeluar->harga_barang }}</td>
                                        <td>{{ $JumlahHargaAkhir }}</td>
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
                                <td>{{ $subtotalJumlahHargaAwal }}</td>
                                <td colspan="3"></td>
                                <td>{{ $subtotalJumlahHarga }}</td>
                                <td colspan="4"></td>
                                <td>{{ $subtotalJumlahHargaKeluar }}</td>
                                <td colspan="3"></td>
                                <td>{{ $subtotalJumlahHargaAkhir }}</td>
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
                        <td>{{ $totalAwal }}</td> <!-- Tampilkan total awal -->
                        <td colspan="3"></td>
                        <td>{{ $total }}</td> <!-- Tampilkan total -->
                        <td colspan="4"></td>
                        <td>{{ $totalKeluar }}</td> <!-- Tampilkan total keluar -->
                        <td colspan="3"></td>
                        <td>{{ $totalAkhir }}</td> <!-- Tampilkan total akhir -->
                    </tr>
                </tbody>
                
            </table>
        </div>

    </div>
</div>

   
</div>
<!-- AKHIR DATA -->

@endsection
<!-- Mengikat JavaScript ke event -->
<!-- Membuat fungsi JavaScript untuk menghitung total 
<script>
    // Fungsi untuk menghitung total pada setiap baris
    function calculateTotal() {
        // Dapatkan semua baris tabel dalam tbody
        var rows = document.querySelectorAll("tbody tr");

        rows.forEach((row) => {
            // Mengambil nilai dari elemen yang relevan
            var jmlBarangAwal = parseInt(row.querySelector(".jml_barang_awal").innerText) || 0;
            var jmlBarangMasuk = parseInt(row.querySelector(".jml_barang").innerText) || 0;
            var jmlBarangKeluar = parseInt(row.querySelector(".jml_barangkeluar").innerText) || 0;

            // Menghitung total
            var total = jmlBarangAwal + jmlBarangMasuk - jmlBarangKeluar;

            // Mengisi kolom "total" dengan hasil perhitungan
            row.querySelector(".total").innerText = total;
        });
    }
    function calculateHarga() {
        // Dapatkan semua baris tabel dalam tbody
        var rows = document.querySelectorAll("tbody tr");

        rows.forEach((row) => {
            // Mengambil nilai dari elemen yang relevan
            var jml_barang = parseInt(row.querySelector(".total").innerText) || 0;
            var jml_harga = parseInt(row.querySelector(".harga_akhir").innerText) || 0;

            // Menghitung total
            var harga = jml_barang * jml_harga ;

            // Mengisi kolom "total" dengan hasil perhitungan
            row.querySelector(".jml_harga_keluar").innerText = harga;
        });
    }
    window.onload = function () {
        calculateTotal();
        calculateHarga();
    };
</script> -->



      

