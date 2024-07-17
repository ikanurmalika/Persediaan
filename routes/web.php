<?php


use App\Http\Controllers\barangkeluarController;
use App\Models\barangkeluar;
use App\Http\Controllers\databarangController;
use App\Http\Controllers\LoginController;
use App\Models\databarang;
use App\Models\user;
use App\Models\Pengajuan;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\barangmasukController;
use App\Http\Controllers\bukubarangController;
use App\Http\Controllers\dashboardController;
use App\Http\Controllers\kartubarangContoller;
use App\Http\Controllers\LaporanController;
use App\Http\Controllers\PengajuanBarangcontroller;
use App\Http\Controllers\PengajuanController;
use App\Http\Controllers\penggunaController;
use App\Http\Controllers\PrediksiStokController;
use App\Http\Controllers\SesiController;
use App\Http\Controllers\StatusPengajuan;
use App\Http\Controllers\SuratController;
use App\Http\Controllers\TTDController;
use App\Http\Controllers\TtdSuratController;
use App\Models\barangmasuk;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/



//Route::get('/', function () { return view('pengguna.login');});
Route::middleware(['guest'])->group(function(){
    Route::get('/',[SesiController::class,'index'])->name('login');
    Route::post('/',[SesiController::class,'login']);
});
Route::get('/home',function(){
    return redirect('/dashboard');
});
//Route::get('/register',[SesiController::class,'register'])->name('register');
//Route::post('/create',[SesiController::class,'create']);
//Route::get('/logout',[SesiController::class,'logout']);
Route::middleware(['auth'])->group(function(){
    //Route::get('dashboard', function () {return view('dashboard');})->name('dashboard');
    Route::get('/register',[SesiController::class,'register']);
    Route::post('/create',[SesiController::class,'create']);
    Route::get('/logout',[SesiController::class,'logout']);
    Route::post('/store', [SesiController::class, 'store'])->name('data.store');
    //Route::get('pengguna/{id}/edit', [SesiController::class, 'edit'])->name('pengguna/{id}/edit');
    //Route::delete('pengguna/{id}', [SesiController::class, 'destroy'])->name('pengguna/{id}');
    //Route::put('pengguna/{id}', [SesiController::class, 'update'])->name('users.update');

    Route::get('/pengguna', [penggunaController::class,'index']);
    Route::get('pengguna/{id}/edit', [penggunaController::class, 'edit'])->name('pengguna/{id}/edit');
    Route::delete('pengguna/{id}', [penggunaController::class, 'destroy'])->name('pengguna/{id}');
    Route::put('pengguna/{id}', [penggunaController::class, 'update'])->name('users.update');

    Route::get('/dashboard',[dashboardController::class,'index']);
    Route::get('/dashboard/pengelola',[dashboardController::class,'pengelola'])->middleware('userAkses:pengelola_barang');
    Route::get('/dashboard/ketua',[dashboardController::class,'ketua'])->middleware('userAkses:ketua');
    Route::get('/dashboard/kelurahan',[dashboardController::class,'kelurahan'])->middleware('userAkses:kelurahan');
    Route::get('/dashboard/pengguna',[dashboardController::class,'pengguna'])->middleware('userAkses:pengguna');

    Route::resource('databarang', databarangController::class);

    Route::resource('barangkeluar',barangkeluarController::class);
    Route::get('unduh',[barangkeluarController::class,'unduhForm'])->name('unduh');
    Route::get('preview/{tglawal}/{tglakhir}/{kode}/{perangkat_daerah}',[barangkeluarController::class,'PreviewUnduh'])->name('unduh-preview');
    Route::get('preview-kelurahan/{tglawal}/{tglakhir}/{kode}',[barangkeluarController::class,'unduh'])->name('preview-kelurahan');
    Route::get('/unduhPertanggal/{tglawal}/{tglakhir}/{kode}/{perangkat_daerah}', [\App\Http\Controllers\barangkeluarController::class, 'unduhPertanggal'])
    ->name('unduhPertanggal');
    Route::get('/unduhbarang/{tglawal}/{tglakhir}/{kode}', [\App\Http\Controllers\barangkeluarController::class, 'download'])
    ->name('unduhbarang');
    Route::post('/autofill', [barangkeluarController::class,'autofill'])->name('autofill');
    Route::get('/get-id-barang', [barangkeluarController::class, 'getIdBarangByNamaBarang']);

    Route::resource('barangmasuk',barangmasukController::class);
    Route::get('unduh2',[barangmasukController::class,'unduhForm2'])->name('unduh2');
    Route::get('unduh-preview/{tglawal}/{tglakhir}/{kode}/{perangkat_daerah}',[barangmasukController::class,'PreviewUnduh'])->name('unduh-preview');
    Route::get('view-unduh/{tglawal}/{tglakhir}/{kode}',[barangmasukController::class,'unduh'])->name('view-unduh');
    Route::get('/unduhPertanggal2/{tglawal}/{tglakhir}/{kode}/{perangkat_daerah}', [\App\Http\Controllers\barangmasukController::class, 'unduhPertanggal2'])
        ->name('unduhPertanggal2');
    Route::get('/unduh-kelurahan/{tglawal}/{tglakhir}/{kode}', [\App\Http\Controllers\barangmasukController::class, 'unduhKelurahan'])
        ->name('unduh-Kelurahan');

    Route::resource('pengajuan',PengajuanBarangcontroller::class)->middleware('userAkses:pengguna');
    Route::resource('statuspengajuan',StatusPengajuan::class)->middleware('userAkses:pengelola_barang');
    
    Route::resource('surat',SuratController::class);
    Route::get('surat/{id}/cetak',[SuratController::class,'cetakSurat'])->name('surat.cetak');
    Route::get('index1',[SuratController::class,'index1'])->name('index1');
    Route::get('surat/{id}/show', [SuratController::class, 'show']);
    Route::get('surat/{id}/edit', [SuratController::class, 'edit'])->name('show/{id}/edit');
    Route::put('surat/update', [SuratController::class, 'update'])->name('surat.update');
    // routes/web.php
    Route::delete('surat/{id}/delete', [SuratController::class, 'destroy'])->name('surat.destroy');


    
    Route::resource('bukubarang',bukubarangController::class);
    Route::get('Bukubarang',[bukubarangController::class,'cetakBukubarang'])->name('cetak-bukubarang');
    Route::get('/LihatBukubarang/{tglawal}/{tglakhir}/{perangkat_daerah}',[bukubarangController::class,'lihat'])->name('Lihat-Bukubarang');
    Route::get('/BukuBarang-show/{tglawal}/{tglakhir}',[bukubarangController::class,'unduh'])->name('BukuBarang-show');
    Route::get('/Bukubarang-unduh/{tglawal}/{tglakhir}', [\App\Http\Controllers\bukubarangController::class, 'download'])
        ->name('Bukubarang-unduh');
    Route::get('/unduh-Bukubarang/{tglawal}/{tglakhir}/{perangkat_daerah}', [\App\Http\Controllers\bukubarangController::class, 'unduhForm'])
        ->name('unduhPertanggal2');

    Route::resource('laporan',LaporanController::class);
    Route::get('cetak-laporan',[LaporanController::class,'cetakLaporan'])->name('cetak-laporan');
    Route::get('/laporan-show/{tglawal}/{tglakhir}', [\App\Http\Controllers\LaporanController::class, 'unduhPertanggal2'])
        ->name('unduhPertanggal2');
    Route::get('/show-laporan/{tglawal}/{tglakhir}/{perangkat_daerah}', [\App\Http\Controllers\LaporanController::class, 'show'])
        ->name('show-laporan');//kecamatan
    Route::get('/unduh-laporan/{tglawal}/{tglakhir}/{perangkat_daerah}', [\App\Http\Controllers\LaporanController::class, 'unduhForm'])
        ->name('unduh-laporan');//kecamatan
    Route::get('/show-laporan-kel/{tglawal}/{tglakhir}', [\App\Http\Controllers\LaporanController::class, 'unduhPertanggal2'])
        ->name('show-laporan-kel');//kelurahan
    Route::get('/unduh-laporan-kel/{tglawal}/{tglakhir}', [\App\Http\Controllers\LaporanController::class, 'unduh'])
        ->name('unduh-laporan-kel');//kelurahan

    Route::resource('kartubarang',kartubarangContoller::class);
    Route::get('kartubarang/{id}', [kartubarangContoller::class, 'show']);
    Route::get('unduh-kartubarang',[kartubarangContoller::class,'unduhForm2']);
    Route::get('CetakKartubarang/{id}',[kartubarangContoller::class,'CetakKartubarang'])->name('CetakKartubarang');
    Route::get('/preview-kartubarang/{tglawal}/{tglakhir}/{id_barang}/{perangkat_daerah}', [kartubarangContoller::class, 'lihat'])
        ->name('preview-kartubarang');
    Route::get('/unduh-kartubarang/{tglawal}/{tglakhir}/{id_barang}/{perangkat_daerah}', [kartubarangContoller::class, 'unduhForm'])
        ->name('unduh-kartubarang');
        Route::get('/preview-kartubarang-kel/{tglawal}/{tglakhir}/{id_barang}', [kartubarangContoller::class, 'preview'])
        ->name('preview-kartubarang-kel');
    Route::get('/unduh-kartubarang-kel/{tglawal}/{tglakhir}/{id_barang}', [kartubarangContoller::class, 'unduhKartu'])
        ->name('unduh-kartubarang-kel');

    Route::resource('Prediksi-Stok',PrediksiStokController::class);
    Route::get('grafik',[dashboardController::class, 'grafik']);
    Route::get('pesan', [dashboardController::class, 'Pesan']);
    Route::get('pesan2', [dashboardController::class, 'Pesan2']);

    
    Route::resource('TTD-Surat',TTDController::class);
});








