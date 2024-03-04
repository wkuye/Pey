<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens; 
use Encore\Admin\Auth\Database\Administrator as Model;
class User extends Authenticatable 
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'last_name',
        'email',
        'password',
        'image',
        'balance',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
      
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
     /**
     * Default values for attributes.
     *
     * @var array<string, mixed>
     */
    protected $attributes = [
        'balance' => 100.0,
        'image'=>null,
        'expenses'=>0.0 // Set the default value for 'balance'
    ];

    public function beneficiaries()
    {
        return $this->hasMany(Beneficiary::class);
    }

    public function sentTransfers()
{
    return $this->hasMany(Transaction::class, 'user_id');
}

public function receivedTransfers()
{
    return $this->hasMany(Transaction::class, 'recipient_id');
}
}
