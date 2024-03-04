<?php
namespace App\Http\Controllers\Shop;
use App\Http\Controllers\Controller;
use App\Models\Popular;

class PopularController extends Controller{
    protected function getALLPopular(){
 $popular= Popular::  take(10)->get();
 return response()->json(['popular'=>$popular]);
    }

    protected function getElelctronicsPopular(){
        $popular = Popular::where('category_id', 5)->take(10)->get();
        return response()->json(['popular'=>$popular]);
    }

    protected function getFurniturePopular(){
        $popular = Popular::where('category_id', 1)->orwhere('category_id', 2)->orwhere('category_id', 3)->take(10)->get();
        return response()->json(['popular'=>$popular]);
    }

    protected function getOutfitPopular(){
        $popular = Popular::where('category_id', 4)->take(10)->get();
        return response()->json(['popular'=>$popular]);
    }
}