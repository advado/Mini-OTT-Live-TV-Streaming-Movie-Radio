<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Advertisement;

class AdvertisementController extends Controller
{
    public function index(){
        return response()->json([
            'success' => true,
            'data' => Advertisement::first(),
        ]);
    }

    public function update(Request $request)
    {
        $ads = Advertisement::first();

        
        $ads->update($request->all());
        return response()->json([
            'message'=>'Ads updated successfully!',
            'Status'=>200 
        ]);
    }
}
