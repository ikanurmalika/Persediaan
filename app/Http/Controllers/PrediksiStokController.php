<?php

namespace App\Http\Controllers;

use App\Models\barangkeluar;
use App\Models\databarang;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PrediksiStokController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $katakunci= $request->katakunci;
        $jumlahbaris =10;
        if(strlen($katakunci)){
            $data= databarang::where('id_barang','like',"%$katakunci%")
            ->orwhere('nama_barang','like',"%$katakunci%")
            ->paginate($jumlahbaris);
        }else{
            $data = databarang::orderBy('id_barang','desc')->paginate($jumlahbaris);
        }

        $TahunIni = Carbon::now()->year;
        // Mendapatkan tahun sebelumnya
        $TahunLalu = $TahunIni - 1;
        // Mendapatkan data barang keluar untuk dua tahun terakhir
        $barangkeluar = barangkeluar::whereYear('Tanggal', '>=', $TahunLalu)
                                    ->orderBy('id_barang', 'desc')
                                    ->get();
        // Hitung minmax stock
        foreach ($data as $index => $item) {
            // Mendapatkan data barang keluar untuk tahun sekarang
            $barang_keluar_tahun_ini = $barangkeluar->filter(function ($value) use ($item, $TahunIni) {
                $tanggalKeluar = Carbon::parse($value->Tanggal);
                return $value->id_barang == $item->id_barang && $tanggalKeluar->year == $TahunIni;
            });

            // Mendapatkan data barang keluar untuk tahun lalu
            $barang_keluar_tahun_lalu = $barangkeluar->filter(function ($value) use ($item, $TahunLalu) {
                $tanggalKeluar = Carbon::parse($value->Tanggal);
                return $value->id_barang == $item->id_barang && $tanggalKeluar->year == $TahunLalu;
            });

            if ($barang_keluar_tahun_ini->count() > 0) {
                $A_maks= $barang_keluar_tahun_ini->max('jml_barang');
                $LT=1;
                $jumlah_barang_tahun_ini = $barang_keluar_tahun_ini->sum('jml_barang');
                $banyak_data_tahun_ini=$barang_keluar_tahun_ini->count('id_barang');
                $ratarata_tahun_ini=round($jumlah_barang_tahun_ini/12);
                $SS_tahun_ini=round(($A_maks-$ratarata_tahun_ini)*$LT);
                $manimal_tahun_ini=($ratarata_tahun_ini*$LT)+$SS_tahun_ini;
                $maksimal_tahun_ini=2*($ratarata_tahun_ini*$LT)+$SS_tahun_ini;
            }

            if ($barang_keluar_tahun_lalu->count() > 0) {
                $A_maks2=$barang_keluar_tahun_lalu->max('jml_barang');
                $LT2=1; //leadtime
                $jumlah_barang_tahun_lalu=$barang_keluar_tahun_lalu->sum('jml_barang');
                $banyak_data_tahun_lalu=$barang_keluar_tahun_lalu->count('id_barang');
                $ratarata_tahun_lalu= round($jumlah_barang_tahun_lalu/12);
                $SS_tahun_lalu=round(($A_maks2-$ratarata_tahun_lalu)*$LT2); //safety stok
                $min_tahun_lalu=($ratarata_tahun_lalu*$LT2)+$SS_tahun_lalu;
                $mak_tahun_lalu=2*($ratarata_tahun_lalu*$LT2)+$SS_tahun_lalu;
                $LTD_tahun_lalu=$LT2*$ratarata_tahun_lalu; //lead time demand
                //$Rop_tahun_lalu=$LTD_tahun_lalu+ $SS_tahun_lalu;

                $item->jumlah_barang_tahun_lalu= $jumlah_barang_tahun_lalu;
                $item->ratarata_tahun_lalu=$ratarata_tahun_lalu;
                $item->SS_tahun_lalu=$SS_tahun_lalu;
                $item->min_tahun_lalu=$min_tahun_lalu;
                $item->mak_tahun_lalu=$mak_tahun_lalu;
                $item->A_maks2=$A_maks2;
            }
        }
            // Kirim data ke view 
            return view('PrediksiStok.new', compact('data', 'TahunIni', 'TahunLalu'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}

