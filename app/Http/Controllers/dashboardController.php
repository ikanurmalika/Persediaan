<?php

namespace App\Http\Controllers;

use App\Charts\DashboardChart;
use App\Models\barangkeluar;
use App\Models\barangmasuk;
use App\Models\databarang;
use App\Models\PengajuanBarang;
use App\Models\user;
use Carbon\Carbon;
use ConsoleTVs\Charts\Classes\Highcharts\Chart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class dashboardController extends Controller
{
    function index(DashboardChart $chart){
        if (Auth::user()->role == 'pengelola_barang'|| Auth::user()->role =='ketua') {
            // Pengelola barang dapat melihat semua data
            $totalBarang = databarang::count();
            $totalMasuk= barangmasuk::count();
            $totalKeluar = barangkeluar::count();
            $totalUser= user::count();
            $total = barangmasuk::sum('jml_harga');
            $total_harga_awal = barangmasuk::sum('jml_harga_awal');
            $total_harga_keluar = barangkeluar::sum('total_harga_keluar');
            $total_harga =$total +$total_harga_awal;
        } else {
            // Role lain hanya dapat melihat data yang mereka buat
            $userId = Auth::user(); 
            $totalMasuk = barangmasuk::where('created_by', $userId->email)->count();
            $totalKeluar = barangkeluar::where('created_by', $userId->email)->count();
            $totalBarang = databarang::count();
            $totalUser = Auth::user()->name;
            $totalPengajuan= PengajuanBarang::where('created_by', $userId->email)->count();
            $totalDiterima= PengajuanBarang::where('created_by', $userId->email)->where('status', 'Diterima')->count();;
            $totalDitolak= PengajuanBarang::where('created_by', $userId->email)->where('status', 'Ditolak')->count();;
            $totalDiproses=PengajuanBarang::where('created_by', $userId->email)->whereNull('status')->count();
            $total = barangmasuk::sum('jml_harga');
            $total_harga_awal = barangmasuk::sum('jml_harga_awal');
            $total_harga_keluar = barangkeluar::sum('total_harga_keluar');
            $total_harga =$total +$total_harga_awal;
        }

    return view('dashboard', compact('totalBarang','totalMasuk','totalKeluar','totalUser','total_harga','total_harga_keluar'));
    }
    
    function pengelola(){
        $chart = new DashboardChart();
        $totalBarang = databarang::count();
        $totalMasuk= barangmasuk::count();
        $totalKeluar = barangkeluar::count();
        $totalUser= user::count();
        $total = barangmasuk::sum('jml_harga');
        $total_harga_awal = barangmasuk::sum('jml_harga_awal');
        $total_harga_keluar = barangkeluar::sum('total_harga_keluar');
        $total_harga =$total +$total_harga_awal;
        
        $tahun = date('Y');
        $bulan_sekarang = date('m');
        $total_barang = [];
        $bulan = [];
    
        for ($i = 1; $i <= 12; $i++) { // Looping untuk 12 bulan dalam setahun
            $total_barang_bulan = BarangMasuk::whereYear('Tanggal', $tahun)
                ->whereMonth('Tanggal', $i)
                ->sum('jml_barang');
    
            // Menambahkan nama bulan dalam bahasa Inggris ke dalam array $bulan
            $nama_bulan = Carbon::create()->month($i)->format('F');
            $bulan[] = $nama_bulan;
            // Menambahkan total barang masuk ke dalam array $total_barang
            $total_barang[] = $total_barang_bulan;
            
        }
        $total_barang= [12,11,15,16,17,9,6,9,5,2,13,15];
        
        return view('dashboard', compact('totalBarang','totalMasuk','totalKeluar','totalUser',
        'total_barang','bulan','total_harga','total_harga_keluar'));
    }

    function ketua(DashboardChart $chart){
        if (Auth::user()->role == 'pengelola_barang'|| Auth::user()->role =='ketua') {
            // Pengelola barang dapat melihat semua data
            $totalBarang = databarang::count();
            $totalMasuk= barangmasuk::count();
            $totalKeluar = barangkeluar::count();
            $totalUser= user::count();
            $total_harga = barangmasuk::sum('jml_harga');
            $total_harga_keluar = barangkeluar::sum('total_harga_keluar');
        } else {
            // Role lain hanya dapat melihat data yang mereka buat
            $userId = Auth::user(); 
            $totalMasuk = barangmasuk::where('created_by', $userId->email)->count();
            $totalKeluar = barangkeluar::where('created_by', $userId->email)->count();
            $totalBarang = databarang::count();
            $totalUser = Auth::user()->name;
            $total_harga = barangmasuk::sum('jml_harga')->where('created_by', $userId->email);
            $total_harga_keluar = barangkeluar::sum('total_harga_keluar')->where('created_by', $userId->email);
        }
        $barangMasukPerBulan = barangmasuk::selectRaw('DATE_FORMAT(Tanggal, "%Y-%m") as month, COUNT(*) as total')
    ->groupBy('month')
    ->orderBy('month')
    ->get();
    foreach ($barangMasukPerBulan as $barangMasuk) {
        $chart->labels($barangMasuk->month);
        $chart->dataset('Barang Masuk', 'line',$barangMasuk);
    }
    $tahun = date('Y');
    $bulan_sekarang = date('m');
    $total_barang = [];
    $bulan = [];

    for ($i = 1; $i <= 12; $i++) { // Looping untuk 12 bulan dalam setahun
        $total_barang_bulan = BarangMasuk::whereYear('Tanggal', $tahun)
            ->whereMonth('Tanggal', $i)
            ->sum('jml_barang');

        // Menambahkan nama bulan dalam bahasa Inggris ke dalam array $bulan
        $nama_bulan = Carbon::create()->month($i)->format('F');
        $bulan[] = $nama_bulan;

        // Menambahkan total barang masuk ke dalam array $total_barang
        //$total_barang[] = $total_barang_bulan;
    }
    $total_barang= [12,11,15,16,17,9,6,9,5,2,13,15];
    $chart->labels(['Jan', 'Feb', 'Mar']);
    $chart->dataset('Data', 'line', [10, 20, 30]);
    return view('dashboard', compact('totalBarang','totalMasuk',
    'totalKeluar','totalUser','chart','total_barang','bulan','total_harga','total_harga_keluar'));
  
    }
    function kelurahan(){
        if (Auth::user()->role == 'pengelola_barang'|| Auth::user()->role =='ketua') {
            // Pengelola barang dapat melihat semua data
            $totalBarang = databarang::count();
            $totalMasuk= barangmasuk::count();
            $totalKeluar = barangkeluar::count();
            $totalUser= user::count();
            $total = barangmasuk::sum('jml_harga');
            $total_harga_awal = barangmasuk::sum('jml_harga_awal');
            $total_harga_keluar = barangkeluar::sum('total_harga_keluar');
            $total_harga =$total +$total_harga_awal;
        } else {
            // Role lain hanya dapat melihat data yang mereka buat
            $userId = Auth::user(); 
            $totalMasuk = barangmasuk::where('created_by', $userId->email)->count();
            $totalKeluar = barangkeluar::where('created_by', $userId->email)->count();
            $totalBarang = databarang::count();
            $totalUser = Auth::user()->name;
            $total = barangmasuk::where('created_by', $userId->email)->sum('jml_harga');
            $total_harga_awal = barangmasuk::where('created_by', $userId->email)->sum('jml_harga_awal');
            $total_harga_keluar = barangkeluar::where('created_by', $userId->email)->sum('total_harga_keluar');
            $total_harga =$total +$total_harga_awal;
        }

        $tahun = date('Y');
        $bulan_sekarang = date('m');
        $total_barang = [];
        $bulan = [];
        return view('dashboard', compact('totalBarang','totalMasuk','totalKeluar',
        'totalUser','bulan','total_harga_awal','total_harga_keluar','total_harga'));
      }
    function pengguna(){
        if (Auth::user()->role == 'pengelola_barang'|| Auth::user()->role =='ketua') {
            // Pengelola barang dapat melihat semua data
            $totalBarang = databarang::count();
            $totalMasuk= barangmasuk::count();
            $totalKeluar = barangkeluar::count();
            $totalUser= user::count();
        } else {
            // Role lain hanya dapat melihat data yang mereka buat
            $userId = Auth::user(); 
            $totalMasuk = barangmasuk::where('created_by', $userId->email)->count();
            $totalKeluar = barangkeluar::where('created_by', $userId->email)->count();
            $totalBarang = databarang::count();
            $totalUser = Auth::user()->name;
            $totalPengajuan= PengajuanBarang::where('created_by', $userId->email)->count();
            $totalDiterima= PengajuanBarang::where('created_by', $userId->email)->where('status', 'Diterima')->count();;
            $totalDitolak= PengajuanBarang::where('created_by', $userId->email)->where('status', 'Ditolak')->count();;
            $totalDiproses=PengajuanBarang::where('created_by', $userId->email)->whereNull('status')->count();
        }

        $tahun = date('Y');
        $bulan_sekarang = date('m');
        $total_barang = [];
        $bulan = [];
    
        for ($i = 1; $i <= 12; $i++) { // Looping untuk 12 bulan dalam setahun
            $total_barang_bulan = BarangMasuk::whereYear('Tanggal', $tahun)
                ->whereMonth('Tanggal', $i)
                ->sum('jml_barang');
    
            // Menambahkan nama bulan dalam bahasa Inggris ke dalam array $bulan
            $nama_bulan = Carbon::create()->month($i)->format('F');
            $bulan[] = $nama_bulan;
    
            // Menambahkan total barang masuk ke dalam array $total_barang
            //$total_barang[] = $total_barang_bulan;
        }
        $total_barang= [12,11,15,16,17,9,6,9,5,2,13,15];
        return view('dashboard', compact('totalBarang','totalMasuk','totalKeluar','totalUser',
        'total_barang','bulan','totalPengajuan','totalDiterima','totalDitolak','totalDiproses'));
    }

    public function grafik()
    {
        return view('grafik');
    }

    public function Pesan()
    {
        $user = Auth::user();
        $pengajuanDiproses = 0;
        $pengajuanDiterima = 0;
        $pengajuanDitolak = 0;

        if ($user->role == 'pengelola_barang') {
            $pengajuanDiproses = PengajuanBarang::whereNull('status')->count();
        } elseif ($user->role == 'pengguna') {
            $pengajuanDiterima = PengajuanBarang::where('created_by', $user->email)->where('status', 'Diterima')->count();
            $pengajuanDitolak = PengajuanBarang::where('created_by', $user->email)->where('status', 'Ditolak')->count();
        }

        return view('layout.app', compact('pengajuanDiproses', 'pengajuanDiterima', 'pengajuanDitolak'));
     }

    public function Pesan2()
    {
        // Ambil pengajuan barang yang berstatus 'diproses'
        /*$pengajuanDiproses = PengajuanBarang::whereNull('status')->count();
        return view('layout.template', compact('pengajuanDiproses'));*/
        $user = Auth::user();
        $pengajuanDiproses = 0;
        $pengajuanDiterima = 0;
        $pengajuanDitolak = 0;

        if ($user->role == 'pengelola_barang') {
            $pengajuanDiproses = PengajuanBarang::whereNull('status')->count();
        } elseif ($user->role == 'pengguna') {
            $pengajuanDiterima = PengajuanBarang::where('created_by', $user->email)->where('status', 'Diterima')->count();
            $pengajuanDitolak = PengajuanBarang::where('created_by', $user->email)->where('status', 'Ditolak')->count();
        }

        return view('layout.template', compact('pengajuanDiproses', 'pengajuanDiterima', 'pengajuanDitolak'));
    
    }



}
/*    $total_barang = barangmasuk::selectRaw('SUM(jml_barang)  as total_barang')
        ->groupByRaw('MONTH(Tanggal)')
        ->pluck('total_barang');
    
    // Konversi koleksi data ke dalam format string
    $total_barang = $total_barang->map(function ($item) {
        return (string) $item;
    });
    
    $bulan = barangmasuk::selectRaw('MONTHNAME(Tanggal) as bulan')
        ->groupByRaw('MONTHNAME(Tanggal)')
        ->pluck('bulan');
        $tahun = date('Y');
        $Bulan = date('m');
        for($i=1; $i<=$Bulan; $i++){
            $data_Barang =barangmasuk::whereYear('Tanggal',$tahun)
            ->whereMonth('Tanggal',$i)->sum('jml_barang');
            $bulan[] = Carbon::create()->month($i)->format('F');
            $total_barang[]= $data_Barang;
        }
        
    return view('grafik', compact('total_barang', 'bulan'));
    
    
    
     $totals = barangmasuk::select(
            DB::raw('MONTH(Tanggal) as bulan'),
            DB::raw('SUM(jml_barang) as total_jumlah')
        )
        ->groupBy('bulan')
        ->get();*/