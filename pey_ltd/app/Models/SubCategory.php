<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model
{
    use HasFactory;
    protected $fillable = ['name', 'description_one', 'description_two', 'image'];

public function items(){
    return $this->hasMany(Item::class);
}

}
