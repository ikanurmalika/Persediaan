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
        Schema::create('jenisbarang', function (Blueprint $table) {
            $table->timestamps();
            $table->string('kode');
            $table->unique('kode');
            $table->string('jenis_barang');
            $table->string('tipe');
            $table->string('id_tipe');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('jenisbarang');
    }
};
