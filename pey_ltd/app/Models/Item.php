<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    use HasFactory;
    protected $fillable = ['category_id','popular_id', 'sub_category_id','name', 'description','price','image','discounted_price'];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function SubCategory(){
        return $this->belongsTo(Category::class);
    }

  
    
}
