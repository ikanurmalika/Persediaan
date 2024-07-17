<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class databarang extends Model
{
    use HasFactory;
    protected $fillable =['id_barang','kode','jenis_barang','nama_barang','harga'];
    protected $table ='databarang';
    //public $timestamps = false;
}
