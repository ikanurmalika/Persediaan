@extends('layout.app')
@section('title','prediksistok')
@section('content')
 <!-- START DATA -->
 <div class="my-3 p-3 bg-body rounded shadow-sm">
    <!-- FORM PENCARIAN -->
    <div class="pb-3">
      <form class="d-flex" action="{{ url('Prediksi-Stok') }}" method="get">
          <input class="form-control me-1" type="search" name="katakunci" value="{{ Request::get('katakunci') }}" 
          placeholder="Masukkan kata kunci" aria-label="Search">
          <button class="btn btn-primary" type="submit">
            <i class="fas fa-search fa-sm"></i>
        </button>
      </form>
    </div>
    
    <!-- TOMBOL TAMBAH DATA -->
    <div class="pb-3">
    </div>
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Perencanaan Stok </h6>
    </div>
<div class="card shadow mb-4">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered text-center" id="dataTable" width="100%" cellspacing="0"
                style="overflow-x: auto; white-space: nowrap;">
        <thead>
            <tr>
                <th scope="col">No</th>
                <th scope="col">Nama Barang</th>
                <th scope="col">Hasil EOQ</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($data as $index=>$item)
                @php
                    $HitungEOQ =0;
                    $frekuensibarang=0;
                    $biayapenyimpanan=0;
                    $biayapemesanan =0;

                @endphp
                
                @php
                // Menghitung EOQ
                $frekuensibarang = isset($barangkeluar[$index]) ? $barangkeluar[$index]->jml_barang : 0;
                $biayapemesanan = 500;
                $biayapenyimpanan = isset($barangkeluar[$index]) ? $barangkeluar[$index]->harga_barang * 0.001 : 0;

                $HitungEOQ = 0;

                if ($biayapenyimpanan > 0) {
                    $HitungEOQ = sqrt((2 * $frekuensibarang * $biayapemesanan) / $biayapenyimpanan);
                    $HitungEOQ = round($HitungEOQ); // Membulatkan ke bilangan bulat
                }
            @endphp
            <tr>
                <td>{{ $loop->iteration }}</td>
                <td align="left">{{ $item->nama_barang }}</td>
                <td>{{ $HitungEOQ }}</td>
            </tr>
            
            @endforeach
            
        </tbody>
    </table>
</div>

</div>
</div>
 
</div>
<!-- AKHIR DATA -->

@endsection

