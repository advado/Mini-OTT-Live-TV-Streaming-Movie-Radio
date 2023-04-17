<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Settings;
use Session;

class SettingsController extends Controller
{
    // //settings view page
    public function index(){
        session::put('page','settings');
        return view('admin.admin_settings')->with('settings',Settings::first());
    }

    //Update Settings Details
    public function update(Request $request){
        $settings = Settings::first();

        $settings->app_fcm_key = $request->input('app_fcm_key');
        $settings->app_version = $request->input('app_version');
        $settings->ggl_ply_lcns_key = $request->input('ggl_ply_lcns_key');
        $settings->app_subscription_key = $request->input('app_subscription_key');
        $settings->privacy_policy = $request->input('privacy_policy');
        $settings->one_signal = $request->input('one_signal');
        $settings->save();
        return redirect()->back()->with('message', 'Settings Updated!');
    }

    
    
}
