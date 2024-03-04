<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Popular extends Model
{
    use HasFactory;
    protected $fillable = ['name', 'description', 'image','discounted_price', 'price','category_id'];

    public function items(){
        return $this->hasMany(Item::class);
    }
    // public function category()
    // {
    //     return $this->belongsTo(Category::class);
    // }
    }

