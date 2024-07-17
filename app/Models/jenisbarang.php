<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class jenisbarang extends Model
{
    use HasFactory;
    protected $fillable =['kode','jenis_barang','tipe','id_tipe'];
    protected $table ='jenisbarang';
}
