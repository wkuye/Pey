<?php
namespace App\Http\Controllers\Shop;
use App\Http\Controllers\Controller;
use App\Models\Category;

class CategoryController extends Controller{
    protected function getCategory(){
        $category= Category::all();
    return response()->json(['category'=>$category] ,200);
    }

    protected function delete(){
        $category= Category::query()->delete();
        return response()->json(['category'=>$category] ,200);
    }
}