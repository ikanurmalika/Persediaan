<?php

namespace App\Providers;

use App\Models\PengajuanBarang;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class ViewServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
         // Menggunakan view composer untuk mengirimkan data ke semua view yang menggunakan layout.app
         /*View::composer('layout.app', function ($view) {
            $pengajuanDiproses = PengajuanBarang::whereNull('status')->count();
            $view->with('pengajuanDiproses', $pengajuanDiproses);
        });*/
        View::composer('layout.app', function ($view) {
            $user = Auth::user();
            $pengajuanDiproses = 0;
            $pengajuanDiterima = 0;
            $pengajuanDitolak = 0;

            if ($user) {
                if ($user->role == 'pengelola_barang') {
                    $pengajuanDiproses = PengajuanBarang::whereNull('status')->count();
                } elseif ($user->role == 'pengguna') {
                    $pengajuanDiterima = PengajuanBarang::where('created_by', $user->email)->where('status', 'Diterima')->count();
                    $pengajuanDitolak = PengajuanBarang::where('created_by', $user->email)->where('status', 'Ditolak')->count();
                }
            }

            $view->with(compact('pengajuanDiproses', 'pengajuanDiterima', 'pengajuanDitolak'));
        });
        View::composer('layout.template', function ($view) {
            $user = Auth::user();
            $pengajuanDiproses = 0;
            $pengajuanDiterima = 0;
            $pengajuanDitolak = 0;

            if ($user) {
                if ($user->role == 'pengelola_barang') {
                    $pengajuanDiproses = PengajuanBarang::whereNull('status')->count();
                } elseif ($user->role == 'pengguna') {
                    $pengajuanDiterima = PengajuanBarang::where('created_by', $user->email)->where('status', 'Diterima')->count();
                    $pengajuanDitolak = PengajuanBarang::where('created_by', $user->email)->where('status', 'Ditolak')->count();
                }
            }

            $view->with(compact('pengajuanDiproses', 'pengajuanDiterima', 'pengajuanDitolak'));
        });
    }
}
