@extends('layout.app')
@section('title','Laporan Data Barang')
@section('content')
<div class="my-3 p-3 bg-body rounded shadow-sm">
    <!-- FORM PENCARIAN -->
    <div class="pb-3">
        <form class="d-flex" action="{{ url('laporan') }}" method="get">
            <input 
              class="form-control me-1" 
              type="search" 
              name="katakunci" 
              value="{{ Request::get('katakunci') }}" 
              placeholder="Masukkan kata kunci" 
              aria-label="Search">
            <button class="btn btn-primary" type="submit">
                <i class="fas fa-search fa-sm"></i> Cari
            </button>
        </form>
    </div>
    
    <!-- TOMBOL UNDUH DATA -->
    <div class="pb-3">
        <a href="" class="btn btn-primary">Unduh</a>
    </div>
    
    <!-- HEADER -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">
            Laporan Rekapitulasi Barang Persediaan
        </h6>
    </div>

    <!-- TABEL DATA -->
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table 
                  class="table table-bordered text-left" 
                  id="dataTable" 
                  width="100%" 
                  cellspacing="0">
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
                        // Mengelompokkan data berdasarkan jenis_barang
                        $groupedData = $data->groupBy('jenis_barang');
                        $groupedData2 = $data2->groupBy('jenis_barang'); // Kelompokkan data2 juga jika diperlukan
                        $groupedJenis =$jenisbarang->groupBy('tipe');
                        // Variabel untuk menghitung total keseluruhan
                        $totalAwal = 0;
                        $total = 0;
                        $totalKeluar = 0;
                        $totalAkhir = 0;
                        @endphp

                        @foreach ($jenisbarang as $jenis)
                        <tr>
                            <td style="background-color: lightgreen;" align="center"><strong>{{ $loop->iteration }}</strong></td>
                            <td colspan="19" style="background-color: lightgreen;"><strong>{{ $jenis->id_tipe }}</strong></td>
                            <td colspan="19" style="background-color: lightgreen;"><strong>{{ $jenis->tipe }}</strong></td>
                        </tr>
                            @php
                            // Dapatkan item untuk jenis barang ini dari groupedData
                            $groupItems = $groupedData->get($jenis->jenis_barang, collect());
                            $groupItems2 = $groupedData2->get($jenis->jenis_barang, collect());
                            $groupItemsJenis = $groupedJenis->get($jenis->item, collect());
                            
                            // Variabel untuk menghitung subtotal untuk setiap jenis_barang
                            $subtotalJumlahHargaAwal = 0;
                            $subtotalJumlahHargaMasuk = 0;
                            $subtotalJumlahHargaKeluar = 0;
                            $subtotalJumlahHargaAkhir = 0;
                            @endphp
                            @if ($groupItems->isEmpty())
                                @php
                                    $subtotalJumlahHargaAwal = 0;
                                    $subtotalJumlahHargaMasuk = 0;
                                    $subtotalJumlahHargaKeluar = 0;
                                    $subtotalJumlahHargaAkhir = 0;
                                @endphp
                            @else
                                @foreach ($groupItems as $index => $item) <!-- Loop untuk setiap item di dalam groupItems -->
                                    @php
                                        // Menghitung subtotal
                                        $subtotalJumlahHargaAwal += $item->jml_harga_awal;
                                        $subtotalJumlahHargaMasuk += $item->jml_harga;
                                        
                                        $dataKeluar = $groupItems2->get($index); // Mendapatkan data dari groupItems2
                                        
                                        if ($dataKeluar) {
                                            $subtotalJumlahHargaKeluar += $dataKeluar->total_harga_keluar;
                                            $JumlahBarangAkhir = $item->jml_barang_awal + $item->jml_barang - $dataKeluar->jml_barang;
                                            $JumlahHargaAkhir = $JumlahBarangAkhir * $item->harga_barang;
                                            $subtotalJumlahHargaAkhir += $JumlahHargaAkhir;
                                        }
                                        $totalAwal += $subtotalJumlahHargaAwal;
                                    $total += $subtotalJumlahHargaMasuk;
                                    $totalKeluar += $subtotalJumlahHargaKeluar;
                                    $totalAkhir += $subtotalJumlahHargaAkhir;
                                    @endphp
                                    
                                @endforeach
                            @endif
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $jenis->kode }}</td>
                                    <td>{{ $jenis->jenis_barang }}</td>
                                    <td>{{ $subtotalJumlahHargaAwal }}</td>
                                    <td>{{ $subtotalJumlahHargaMasuk }}</td>
                                    <td>{{ $subtotalJumlahHargaKeluar }}</td>
                                    <td>{{ $subtotalJumlahHargaAkhir }}</td>
                                </tr>
                                
                        @endforeach
                        
                        <tr style="background-color: lightblue;">
                            <td></td>
                            <td colspan="2" align="center"><strong>Total </strong></td>
                            <td>{{ $totalAwal }}</td> <!-- Tampilkan total awal -->
                            
                            <td>{{ $total }}</td> <!-- Tampilkan total -->
                            
                            <td>{{ $totalKeluar }}</td> <!-- Tampilkan total keluar -->
                            
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
