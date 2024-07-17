<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class surat extends Model
{
    use HasFactory;
    protected $fillable =['persediaan','nilai','tanggal','semester','unit_kerja','no_surat'];
    protected $table ='surat';
}
