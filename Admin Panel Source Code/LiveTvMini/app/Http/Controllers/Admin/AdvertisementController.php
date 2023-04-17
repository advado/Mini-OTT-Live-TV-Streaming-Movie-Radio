<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Advertisement;
use Session;

class AdvertisementController extends Controller
{
    public function index(){
        session::put('page','ads');
        return view('admin.advertisement')->with('ads',Advertisement::first());
    }

    //Update advertise Details
    public function update(Request $request){
        $ads = Advertisement::first();

        $ads->admob_inter = $request->input('admob_inter');
        $ads->admob_native = $request->input('admob_native');
        $ads->admob_banner = $request->input('admob_banner');
        $ads->admob_reward = $request->input('admob_reward');
        $ads->fb_inter = $request->input('fb_inter');
        $ads->fb_native = $request->input('fb_native');
        $ads->fb_banner = $request->input('fb_banner');
        $ads->fb_reward = $request->input('fb_reward');
        $ads->startapp_appId = $request->input('startapp_appId');   
        $ads->industrial_interval = $request->input('industrial_interval');
        $ads->native_ads = $request->input('native_ads');
        $ads->ad_types = $request->input('ads_type');


        $ads->unity_appId_gameId = $request->input('unity_appId_gameId');
        $ads->iron_appKey = $request->input('iron_appKey');
        $ads->appnext_placementId = $request->input('appnext_placementId');
        
        

        // dd($ads);
        $ads->save();
        return redirect()->back()->with('message', 'Details Updated!');
    }
}
