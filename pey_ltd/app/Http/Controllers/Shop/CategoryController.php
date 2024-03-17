<?php
namespace App\Http\Controllers\Shop;
use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Item;

class CategoryController extends Controller{
    protected function getCategory(){
        $category= Category::all();
    return response()->json(['category'=>$category] ,200);
    }

    protected function getFirstCategory(){
        $category = Item::where('category_id',1)->get();
        return response()->json(['category'=>$category],200);
    }
    protected function getSecondCategory(){
        $category = Item::where('category_id',2)->get();
        return response()->json(['category'=>$category],200);
    }
    protected function getThirdCategory(){
        $category = Item::where('category_id',3)->get();
        return response()->json(['category'=>$category],200);
    }
    protected function getFourthCategory(){
        $category = Item::where('category_id',4)->get();
        return response()->json(['category'=>$category],200);
    }
    protected function getFifthCategory(){
        $category = Item::where('category_id',5)->get();
        return response()->json(['category'=>$category],200);
    }

protected function getSimilarProduct($id){
    $category = Item::where('category_id',$id)->get();
    return response()->json(['category'=>$category],200);
}

    protected function delete(){
        $category= Category::query()->delete();
        return response()->json(['category'=>$category] ,200);
    }
}