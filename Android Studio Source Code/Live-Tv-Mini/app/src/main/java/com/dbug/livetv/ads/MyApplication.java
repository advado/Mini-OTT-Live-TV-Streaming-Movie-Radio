package com.dbug.livetv.ads;

import android.app.Application;
import android.content.SharedPreferences;
import android.util.Log;

import com.dbug.livetv.SplashActivity;
import com.google.android.gms.ads.MobileAds;

import xyz.doikki.videoplayer.ijk.IjkPlayerFactory;
import xyz.doikki.videoplayer.player.VideoViewConfig;
import xyz.doikki.videoplayer.player.VideoViewManager;


public class MyApplication extends Application {

    SharedPreferences sharedPreferences ;
    String openAppCode;

    @Override
    public void onCreate() {
        super.onCreate();

        sharedPreferences = getSharedPreferences(SplashActivity.MYPREFERENCE, MODE_PRIVATE);
        openAppCode = sharedPreferences.getString(SplashActivity.GOPENAPP, "");

        Log.d("sdljfhsd", "onCreate: "+openAppCode);
        MobileAds.initialize(this, initializationStatus -> new AppOpenManager(MyApplication.this,openAppCode));


        VideoViewManager.setConfig(VideoViewConfig.newBuilder()
                .setPlayerFactory(IjkPlayerFactory.create())
                .build());

    }
}
