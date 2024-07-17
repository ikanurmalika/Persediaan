<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PengajuanBarang extends Model
{
    use HasFactory;
    protected $fillable=['id_pengajuan','nama','jabatan','nama_barang','jml_barang','status','created_by'];
    protected $table='pengajuan_barang';
    protected $append='status_style';

    public function getStatusStyleAttribute(){
        if($this->status =='Diterima'){
            return 'primary';
        }
        elseif($this->status =='Ditolak'){
            return 'danger';
        }
        elseif($this->status=='Diproses'){
            return 'primary';
        }
        else {
            return 'success'; 
        }
    }
}
