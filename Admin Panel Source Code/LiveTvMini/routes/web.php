<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();


Route::prefix('/admin')->namespace('Admin')->group(function(){
    //All the admin route will be define here:-

    Route::match(['get','post'],'/','AdminController@login' );

    Route::group(['middleware'=>['admin']],function(){

        Route::get('dashboard','AdminController@dashboard');
        Route::get('logout','AdminController@logout');

     
        //Ctaegory Route
        Route::get('category_index','CategoryController@index');
        Route::get('category_create', 'CategoryController@create');
        Route::post('category_submit', 'CategoryController@store');
        Route::get('category_edit/{id}', 'CategoryController@edit');
        Route::post('category_update/{id}', 'CategoryController@update');
        Route::get('category_delete/{id}', 'CategoryController@destroy');
    
        //Item Route
        Route::get('item_index', 'ItemController@index');
        Route::get('item_create', 'ItemController@create');
        Route::post('item_submit', 'ItemController@store');
        Route::get('item_edit/{id}', 'ItemController@edit');
        Route::post('item_update/{id}', 'ItemController@update');
        Route::get('item_delete/{id}', 'ItemController@destroy');

      
        //Registered Users Routes
        Route::get('Rindex','RegUserController@index');
        Route::get('Redit/{id}', 'RegUserController@edit');
        Route::post('Rupdate/{id}', 'RegUserController@update');
        
        //Administrator Route
        Route::get('Aindex', 'AdministratorController@index');
        Route::get('Acreate', 'AdministratorController@create');
        Route::post('Asubmit', 'AdministratorController@store');
        Route::get('Aedit/{id}', 'AdministratorController@edit');
        Route::post('Aupdate/{id}', 'AdministratorController@update');
        Route::get('Adelete/{id}', 'AdministratorController@destroy');
        

        //Notification Route
        Route::get('notifications','NotificationController@index');
        Route::post('notifications/send','NotificationController@send');

        //slider route
        Route::get('slider_index','SliderController@index');
        Route::get('slider_create','SliderController@create');
        Route::post('slider_submit', 'SliderController@store');
        Route::get('slider_edit/{id}', 'SliderController@edit');
        Route::post('slider_update/{id}', 'SliderController@update');
        Route::get('slider_delete/{id}', 'SliderController@destroy');

		//Ads Route
        Route::get('advertisement','AdvertisementController@index');
        Route::post('advertisement/update','AdvertisementController@update');

        //Settings Route
        Route::get('settings','SettingsController@index');
        Route::post('settings/update','SettingsController@update');

        
    });
});