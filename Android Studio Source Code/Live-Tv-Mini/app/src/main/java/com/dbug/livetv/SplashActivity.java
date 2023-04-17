package com.dbug.livetv;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.widget.Toast;


import com.dbug.livetv.api.ApiInter;
import com.dbug.livetv.config.Constant;
import com.dbug.livetv.model.Ads;
import com.dbug.livetv.model.FCMItem;
import com.dbug.livetv.retofit.RetrofitClient;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.messaging.FirebaseMessaging;

import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class SplashActivity extends AppCompatActivity {


    SharedPreferences sharedpreferences;
    public static final String GOPENAPP = "gopeenApp";
    public static final String MYPREFERENCE = "mypref";
    public static final String ADSKEY = "adsKey";

    public static final String ADMOB_APP_ID = "admob_app_id";
    public static final String BANNER_ADS = "banner_ads";
    public static final String INTER_ADS = "inter_ads";
    public static final String NATIVE_ADS = "admob_native";
    public static final String REWARD_ADS = "admob_reward";
    public static final String APPNEX_INTER = "appnex_inter";
    public static final String APPNEX_BANNER = "appnex_banner";
    public static final String UNITY_APP_APP_ID = "unity_app_id";
    public static final String STARTAPP_APP_ID = "startapp_app_id";
    public static final String IRON_APP_ID = "iron_appKey";
    public static final String GBANNER_ID = "gbanner_id";
    public static final String GINTERS_ID = "ginters_id";
    public static final String GNATIVE_ID = "gnative_id";
    public static final String FBBANNER_ID = "fbbanner_id";
    public static final String FBINTERS_ID = "fbinters_id";
    public static final String FBNATIVE_ADS = "fb_native";
    public static final String FBREWARD_ADS = "fb_reward";


    public static final String ITEM_CLICK = "item_click";
    public static Boolean checkFirstTime;
    private int _adsType = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        supportRequestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.activity_splash);

        if (getSupportActionBar() != null) {
            getSupportActionBar().hide();
        }

        sharedpreferences = getSharedPreferences(MYPREFERENCE, Context.MODE_PRIVATE);


        if (Constant.ADS_TYPE.equals("server")) {
            adsFromServer();

        } else {
            adsfromLocal();

        }
        SharedPreferences sharedPreference = getSharedPreferences("FCM_TOKEN", MODE_PRIVATE);
        checkFirstTime = Boolean.valueOf(sharedPreference.getBoolean("FCM_TOKEN", true));
        if (checkFirstTime.booleanValue()) {
            FirebaseMessaging.getInstance().getToken().addOnCompleteListener(new OnCompleteListener<String>() {
                @Override
                public void onComplete(@NonNull Task<String> task) {
                    if (!task.isSuccessful()) {
                        return;
                    }
                    String token = task.getResult();
                    saveData(token, sharedPreference);
                    Log.d("FCMTOKEN", token);
                }
            });
        }else {
            Log.d("FCMTOKEN", "previously saved");
            Log.d("FCMTOKEN", ""+sharedPreference.getString("FCM_TOKEN_KEY", ""));
        }
    }
    public  void saveData(String token, SharedPreferences sharedPreferences){
        String phoneModel = android.os.Build.MODEL;
        SharedPreferences.Editor editor = sharedPreferences.edit();
        editor.putBoolean("FCM_TOKEN", false);
        editor.putString("FCM_TOKEN_KEY", token);
        editor.apply();
        ApiInter apiInter = RetrofitClient.getRetrofit().create(ApiInter.class);
        Call<FCMItem> call = apiInter.postFCMToken(token,phoneModel);
        call.enqueue(new Callback<FCMItem>() {
            @Override
            public void onResponse(Call<FCMItem> call, Response<FCMItem> response) {
                Log.d("FCMTOKEN", "onResponse"+response.code());
                Log.d("FCMTOKEN", "onResponse: name"+response.body().getFcm_token());
                Log.d("FCMTOKEN", "onResponse: id"+response.body().getId());
            }

            @Override
            public void onFailure(Call<FCMItem> call, Throwable t) {
                Log.d("FCMTOKEN", "onFailure"+t.getMessage());
            }
        });
    }
    private void adsfromLocal() {
        SharedPreferences.Editor editor = sharedpreferences.edit();
        editor.putString(ADMOB_APP_ID, getResources().getString(R.string.admob_app_id));
        editor.putString(ADSKEY, getResources().getString(R.string.inter_ads));
        editor.putString(BANNER_ADS, getResources().getString(R.string.banner_ads));
        editor.putString(GBANNER_ID, getResources().getString(R.string.gbanner_id));
        editor.putString(GINTERS_ID, getResources().getString(R.string.ginters_id));
        editor.putString(GNATIVE_ID, getResources().getString(R.string.gnative_id));
        editor.putString(FBBANNER_ID, getResources().getString(R.string.fbbanner_id));
        editor.putString(FBINTERS_ID, getResources().getString(R.string.fbinters_id));
        editor.commit();

        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            // Your Code
            Intent intent = new Intent(SplashActivity.this, MainIntroActivity.class);
            startActivity(intent);
            finish();

        }, 3000);
    }

    private void adsFromServer() {

        SharedPreferences.Editor editor = sharedpreferences.edit();
        ApiInter ads = RetrofitClient.getRetrofit().create(ApiInter.class);
        ads.getAds()
                .enqueue(new Callback<Ads>() {
                    @Override
                    public void onResponse(Call<Ads> call, Response<Ads> response) {
                        if (response.isSuccessful()) {
                            Ads ads1 = response.body();
                            editor.putString(ADSKEY, ads1.getData().getAdTypes());
                            editor.putString(BANNER_ADS, ads1.getData().getAdmobBanner());
                            editor.putString(INTER_ADS, ads1.getData().getAdmobInter());
                            editor.putString(NATIVE_ADS, ads1.getData().getAdmobNative());
                            editor.putString(REWARD_ADS, ads1.getData().getAdmobReward());

                            editor.putString(UNITY_APP_APP_ID, ads1.getData().getUnityAppIdGameId());
                            editor.putString(STARTAPP_APP_ID, ads1.getData().getStartappAppId());

                            editor.putString(APPNEX_INTER, ads1.getData().getAppnextPlacementId());

                            editor.putString(IRON_APP_ID, ads1.getData().getIronAppKey());

                            editor.putString(GNATIVE_ID, ads1.getData().getAdmobNative());
                            editor.putString(GINTERS_ID, ads1.getData().getAdmobInter());
                            editor.putString(GBANNER_ID, ads1.getData().getAdmobBanner());

                            editor.putString(FBBANNER_ID, ads1.getData().getFbBanner());
                            editor.putString(FBINTERS_ID, ads1.getData().getFbInter());
                            editor.putString(FBNATIVE_ADS, ads1.getData().getFbNative());
                            editor.putString(FBREWARD_ADS, ads1.getData().getFbReward());
                            editor.commit();

                            new Handler(Looper.getMainLooper()).postDelayed(() -> {
                                // Your Code
                                Intent intent = new Intent(SplashActivity.this, MainIntroActivity.class);
                                startActivity(intent);
                                finish();

                            }, 3000);

                        }
                    }

                    @Override
                    public void onFailure(Call<Ads> call, Throwable t) {

                        SharedPreferences.Editor editor = sharedpreferences.edit();
                        editor.putString(ADMOB_APP_ID, getResources().getString(R.string.admob_app_id));
                        editor.putString(ADSKEY, getResources().getString(R.string.inter_ads));
                        editor.putString(BANNER_ADS, getResources().getString(R.string.banner_ads));
                        editor.putString(GBANNER_ID, getResources().getString(R.string.gbanner_id));
                        editor.putString(GINTERS_ID, getResources().getString(R.string.ginters_id));
                        editor.putString(GNATIVE_ID, getResources().getString(R.string.gnative_id));
                        editor.putString(FBBANNER_ID, getResources().getString(R.string.fbbanner_id));
                        editor.putString(FBINTERS_ID, getResources().getString(R.string.fbinters_id));
                        editor.commit();
                        new Handler(Looper.getMainLooper()).postDelayed(() -> {
                            // Your Code
                            Intent intent = new Intent(SplashActivity.this, MainIntroActivity.class);
                            startActivity(intent);
                            finish();

                        }, 3000);


                    }
                });
    }

    @Override
    protected void onResume() {
        super.onResume();
        getWindow().getDecorView().setSystemUiVisibility(
                View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                        | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                        | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                        | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                        | View.SYSTEM_UI_FLAG_FULLSCREEN
                        | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY);
    }
}