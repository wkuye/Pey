<?php


use App\Http\Controllers\Beneficiary\BeneficiaryController;
use App\Http\Controllers\Shop\CategoryController;
use App\Http\Controllers\Shop\SubCategoryController;
use App\Http\Controllers\Transaction\TransactionController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\AuthsController;
use App\Http\Controllers\Shop\PopularController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::group(['namespace'=> 'Auth'], function () {
    Route::group(['prefix'=> 'auth'], function () {
        Route::post('/register', [AuthsController::class, 'register']);
        Route::post('/login', [AuthsController::class,'login']);
        Route::post('/forgot', [AuthsController::class,'forgottenPassword']);
        Route::post('/reset', [AuthsController::class,'resetPassword']);
        Route::post('/currentUser',[AuthsController::class,'getUsers']);
    });
 Route::group(['prefix'=>'beneficiary'],function (){
    Route::post('/{user}/ben',[BeneficiaryController::class, 'getBeneficiary']);
    Route::post('{userID}/search',[BeneficiaryController::class, 'search']);
    Route::post('/{user}/add_ben',[BeneficiaryController::class, 'addBeneficiary']);
    Route::post('/delete_ben',[BeneficiaryController::class, 'delete']);
    Route::post('/{userID}/getBen',[ BeneficiaryController::class,'getallBeneficiaries']);
 });
   Route::group(['prefix'=>'transaction'], function(){
  Route::post('/{userid}/transfer',[TransactionController::class,'transfer']);
  Route::post('/{userId}',[TransactionController::class, 'getTransaction']);

Route::get('{userId}/{dateRange}', [TransactionController::class, 'getTransactionByDate']);
   });
   Route::group(['prefix'=>'category'], function(){
  Route::get('/get', [CategoryController::class, 'getCategory']);
  Route::get('/delete', [CategoryController::class, 'delete']);
  
     });
     Route::group(['prefix'=>'subcategory'], function(){
        Route::get('/getsub', [SubCategoryController::class, 'getSubCategory']);
        Route::get('/get1st', [SubCategoryController::class, 'FirstSubCategory']);
        Route::get('/get2nd', [SubCategoryController::class, 'SecondSubCategory']);
        Route::get('/get3rd', [SubCategoryController::class, 'ThirdSubCategory']);
     });
     Route::group(['prefix'=>'popular'], function(){
      Route::get('/getpopular', [PopularController::class, 'getALLPopular']);
      Route::get('/getelectronics', [PopularController::class, 'getElelctronicsPopular']);
      Route::get('/getfurniture', [PopularController::class, 'getFurniturePopular']);
      Route::get('/getoutfit', [PopularController::class, 'getOutfitPopular']);
   });
});

  


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
