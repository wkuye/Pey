<?php
namespace app\Http\Controllers\Shop;
use App\Http\Controllers\Controller;
use App\Models\Item;
use App\Models\SubCategory;

class SubCategoryController extends Controller{
    protected function getSubCategory(){
        $subCategory= SubCategory::take(3)->get();
        return response()->json(['subCategory'=>$subCategory],200);
    }
    protected function FirstSubCategory(){
        $item= Item::where(['category_id'=> 2, 'discounted_price'=>70])->take(10)->get();
        return response()->json(['item'=>$item],200);
    }
}