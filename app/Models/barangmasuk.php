<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class barangmasuk extends Model
{
    use HasFactory;
    protected $fillable =['perangkat_daerah','id_transaksi_masuk','id_barang',
                        'jenis_barang','nama_barang','jml_barang','jml_harga','harga_barang',
                        'jml_barang_awal','jml_harga_awal','ket','Tanggal','dari','satuan','created_by','nomor_ba_penerimaan',
                        'tanggal_ba_penerimaan','nomor_dokumen_faktur','tanggal_dokumen_faktur','kode'];
    protected $table ='barangmasuk';

   
}
