<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Foundation\Auth\user as Authenticatable;

class user extends Authenticatable
{
    use HasFactory, HasApiTokens, Notifiable;
    protected $fillable=['email','password','role','nip','jabatan','name'];
    public $timestamps = false;
    protected $table ='user';

    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    public function isPengelola()
    {
        return $this->role === 'pengelola_barang';
    }

    public function isKetua()
    {
        return $this->role === 'ketua';
    }

}
