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
        Schema::create('barangmasuk', function (Blueprint $table) {
            $table->string('perangkat_daerah');
            $table->integer('id_transaksi_masuk');
            $table->unique('id_transaksi_masuk');
            $table->integer('id_barang');
            $table->string('jenis_barang');
            $table->string('nama_barang');
            $table->integer('jml_barang');
            $table->integer('jml_harga');
            $table->integer('harga_barang');
            $table->integer('jml_barang_awal');
            $table->integer('jml_harga_awal');
            $table->string('ket');
            $table->date('Tanggal');
            $table->string('dari');
            $table->string('satuan');
            $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('barangmasuk');
    }
};
