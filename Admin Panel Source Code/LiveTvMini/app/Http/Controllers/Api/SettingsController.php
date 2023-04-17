<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Settings;

class SettingsController extends Controller
{
    public function privacy_policy(){
       $privacy_policy = Settings::select('id','app_fcm_key','privacy_policy')->first();

       return response()->json($privacy_policy);
    }

    public function update(Request $request)
    {
        $setting = Settings::first();

        
        $setting->update($request->all());
        return response()->json([
            'message'=>'Ads updated successfully!',
            'Status'=>200 
        ]);
    }
}
