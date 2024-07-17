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
        Schema::table('barangmasuk', function (Blueprint $table) {
        $table->string('nomor_ba_penerimaan')->nullable();
        $table->date('tanggal_ba_penerimaan')->nullable();
        $table->string('nomor_dokumen_faktur')->nullable();
        $table->date('tanggal_dokumen_faktur')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('barangmasuk', function (Blueprint $table) {
            //
        });
    }
};
