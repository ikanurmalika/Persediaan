<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('barangkeluar', function (Blueprint $table) {
            $table->string('perangkat_daerah');
            $table->integer('id_transaksi_keluar');
            $table->unique('id_transaksi_keluar');
            $table->integer('id_barang');
            $table->string('jenis_barang');
            $table->string('nama_barang');
            $table->integer('jml_barang');
            $table->integer('harga_barang');
            $table->string('untuk');
            $table->string('ket');
            $table->date('Tanggal');
            $table->integer('total_harga_keluar');
            $table->string('satuan');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('barangkeluar');
    }
};
