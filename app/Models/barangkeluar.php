<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class barangkeluar extends Model
{
    use HasFactory;
    protected $fillable =['perangkat_daerah','id_transaksi_keluar','id_barang',
                        'jenis_barang','nama_barang','jml_barang','harga_barang',
                        'untuk','ket','Tanggal','total_harga_keluar','satuan','created_by','kode'];
    protected $table ='barangkeluar';

    
}
