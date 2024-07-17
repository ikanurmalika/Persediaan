<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class surat_ttd extends Model
{
    use HasFactory;
    protected $fillable =['unit_kerja','nama1','nip1','jabatan1','nama2','nip2','jabatan2','nama3','nip3','jabatan3'];
    protected $table ='surat_ttd';
}
