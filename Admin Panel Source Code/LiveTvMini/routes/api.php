<?php

use App\Http\Controllers\Api\AdvertisementController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\DeviceController;
use App\Http\Controllers\Api\HomeController;
use App\Http\Controllers\Api\ItemController;
use App\Http\Controllers\Api\SettingsController;
use App\Http\Controllers\Api\SliderController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/



Route::group([
    // 'prefix' => 'v1',
    'namespace' => 'api'
], function(){

    Route::resource('/admin', 'AdminController');
    
    //Categories
    Route::get('/get_category_index', [CategoryController::class,'get_category']);
    Route::get('/get_category_posts', [CategoryController::class,'get_post_by_category']);


    //slider route 'SliderController@get_slide'
        Route::get('/get_slide', [SliderController::class,'get_slide']);
        Route::post('/slider_view_count/{id}', [SliderController::class,'slider_view_count']);
        
    //Ads Route AdvertisementController@index', 'AdvertisementController@update'
        Route::get('/advertisement',[AdvertisementController::class,'index']);
        Route::put('/advertisement/update',[AdvertisementController::class,'update']);

    //Settings Route 'SettingsController@privacy_policy'
        Route::get('/get_privacy_policy',[SettingsController::class,'privacy_policy']);

    //notification ,'DeviceController@StoreToken'
        Route::post('/store-token',[DeviceController::class,'StoreToken']); // device controller


    //Items Search Route 'ItemController@get_posts', 'ItemController@search'
        Route::get('/get_posts', [ItemController::class,'get_posts']);
    	Route::get('/get_search_results', [ItemController::class,'search']);
    	Route::post('/item_view_count/{id}', [ItemController::class,'item_view_count']);

   

	//home route 'HomeController@index'
        // Route::get('/home',[HomeController::class,'index'] );
});