<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pengajuan extends Model
{
    use HasFactory;
    protected $fillable=['id_pengajuan','nama','jabatan','nama_barang','jml_barang'];
    protected $table='pengajuan';
}
