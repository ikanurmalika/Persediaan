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
        
        <a href='{{ url('cetak-laporan') }}' class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
            class="fas fa-download fa-sm text-white-50"></i> Unduh</a>
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
                                <td>{{ $loop->iteration }}</td>
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
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $jenis->kode }}</td>
                                    <td>{{ $jenis->jenis_barang }}</td>
                                    <td align="center">@if($subtotalJumlahHargaAwal > 0) {{ $subtotalJumlahHargaAwal }} @else  @endif</td>
                                    <td align="center">@if($subtotalJumlahHargaMasuk > 0) {{ $subtotalJumlahHargaMasuk }} @else  @endif</td>
                                    <td align="center">@if($subtotalJumlahHargaKeluar > 0) {{ $subtotalJumlahHargaKeluar }} @else  @endif</td>
                                    <td align="center">@if($subtotalJumlahHargaAkhir > 0) {{ $subtotalJumlahHargaAkhir }} @else - @endif</td>
                                </tr>
                            @endforeach
                        @endforeach

                        <!-- Total Keseluruhan -->
                        <tr align="center">
                            <td></td>
                            <td colspan="2" align="center"><strong>Total Keseluruhan</strong></td>
                            <td>{{ $totalAwal > 0 ? $totalAwal : '-' }}</td>
                            <td>{{ $totalMasuk > 0 ? $totalMasuk : '-' }}</td>
                            <td>{{ $totalKeluar > 0 ? $totalKeluar : '-' }}</td>
                            <td>{{ $totalAkhir > 0 ? $totalAkhir : '-' }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- AKHIR DATA -->
@endsection
