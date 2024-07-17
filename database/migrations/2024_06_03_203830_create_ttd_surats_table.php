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
        Schema::create('ttd_surat', function (Blueprint $table) {
            $table->timestamps();
            $table->string('unit_kerja');
            $table->unique('unit_kerja');
            $table->bigInteger('nip1');
            $table->string('nama1');
            $table->string('jabatan1');
            $table->bigInteger('nip2');
            $table->string('nama2');
            $table->string('jabatan2');
            $table->bigInteger('nip3')->nullable();
            $table->string('nama3')->nullable();
            $table->string('jabatan3')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ttd_surat');
    }
};
