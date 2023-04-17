package com.dbug.livetv.ads;

import static android.content.Context.MODE_PRIVATE;
import static com.dbug.livetv.SplashActivity.APPNEX_INTER;
import static com.dbug.livetv.SplashActivity.GINTERS_ID;
import static com.dbug.livetv.SplashActivity.INTER_ADS;
import static com.dbug.livetv.SplashActivity.IRON_APP_ID;
import static com.dbug.livetv.SplashActivity.MYPREFERENCE;
import static com.dbug.livetv.SplashActivity.STARTAPP_APP_ID;
import static com.dbug.livetv.SplashActivity.UNITY_APP_APP_ID;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.preference.PreferenceManager;

import com.appnext.ads.interstitial.Interstitial;
import com.appnext.base.Appnext;
import com.appnext.core.AppnextAdCreativeType;
import com.appnext.core.callbacks.OnAdClicked;
import com.appnext.core.callbacks.OnAdClosed;
import com.appnext.core.callbacks.OnAdError;
import com.appnext.core.callbacks.OnAdLoaded;
import com.appnext.core.callbacks.OnAdOpened;
import com.dbug.livetv.SplashActivity;
import com.facebook.ads.Ad;
import com.facebook.ads.AdError;
import com.facebook.ads.InterstitialAdListener;
import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.LoadAdError;
import com.google.android.gms.ads.interstitial.InterstitialAd;
import com.google.android.gms.ads.interstitial.InterstitialAdLoadCallback;
import com.ironsource.mediationsdk.IronSource;
import com.ironsource.mediationsdk.logger.IronSourceError;
import com.ironsource.mediationsdk.sdk.InterstitialListener;
import com.startapp.sdk.adsbase.StartAppAd;
import com.startapp.sdk.adsbase.StartAppSDK;
import com.startapp.sdk.adsbase.adlisteners.AdDisplayListener;
import com.startapp.sdk.adsbase.adlisteners.AdEventListener;
import com.unity3d.ads.IUnityAdsListener;
import com.unity3d.ads.UnityAds;
import com.unity3d.services.banners.BannerErrorInfo;

public class SessionAds {

    Context context;
    InterstitialAd interstitialAd;
    com.facebook.ads.InterstitialAd interstitialAdFB;
    SharedPreferences sharedpreferences;

    InterAdClickInterFace interAdClickInterFace;
    SharedPreferences.Editor editor;
    Interstitial interstitialAd1;
    String interstitialAndroid = "Interstitial_Android";
    String adCode = "ca-app-pub-3940256099942544/1033173712";
    StartAppAd startAppAd;

    public SessionAds(Context context) {
        this.context = context;
        sharedpreferences = PreferenceManager.getDefaultSharedPreferences(context);
        this.sharedpreferences = context.getSharedPreferences(MYPREFERENCE, MODE_PRIVATE);
        editor = sharedpreferences.edit();

        load();
    }

    public SessionAds(Context context, InterAdClickInterFace interAdClickInterFace) {
        this.context = context;
        this.interAdClickInterFace = interAdClickInterFace;
        this.sharedpreferences = PreferenceManager.getDefaultSharedPreferences(context);
        this.sharedpreferences = context.getSharedPreferences(MYPREFERENCE, MODE_PRIVATE);
        editor = sharedpreferences.edit();

        load();
    }

    public void load() {
        String adsCodeFromServer = sharedpreferences.getString(SplashActivity.ADSKEY, "");
        if (adsCodeFromServer.equals("0")) {
            AdRequest adRequest = new AdRequest.Builder().build();
            Log.d("dskfjs", "ads : " + sharedpreferences.getString(INTER_ADS, adCode));
            InterstitialAd.load(context, sharedpreferences.getString(INTER_ADS, adCode), adRequest,
                    new InterstitialAdLoadCallback() {
                        @Override
                        public void onAdLoaded(@NonNull InterstitialAd interstitialAd1) {
                            interstitialAd = interstitialAd1;
                            Log.d("dskfjs", "load: 1 onAdLoaded");
                        }

                        @Override
                        public void onAdFailedToLoad(@NonNull LoadAdError loadAdError) {
                            interstitialAd = null;
                            Log.d("dskfjs", "load: 1 onfailed");
                        }
                    });


        } else if (adsCodeFromServer.equals("1")) {
            interstitialAdFB = new com.facebook.ads.InterstitialAd(context, sharedpreferences.getString(SplashActivity.FBINTERS_ID, ""));

            interstitialAdFB.loadAd(interstitialAdFB.buildLoadAdConfig().withAdListener(new InterstitialAdListener() {
                @Override
                public void onInterstitialDisplayed(Ad ad) {
                    Log.d("dgf", "ADS DISPLAYED");

                }

                @Override
                public void onInterstitialDismissed(Ad ad) {
                    Log.d("dfg", "ADS CLOSED");

                }

                @Override
                public void onError(Ad ad, AdError adError) {
                    Log.d("sdf", adError.getErrorMessage());


                }

                @Override
                public void onAdLoaded(Ad ad) {
                    Log.d("sdf", "ADS LOADED");

                }

                @Override
                public void onAdClicked(Ad ad) {
                    Log.d("fgfd", "ADS CLICKED");

                }

                @Override
                public void onLoggingImpression(Ad ad) {
                    Log.d("TAG", "onLoggingImpression: ");
                }
            }).build());

            interstitialAdFB.loadAd();

        } else if (adsCodeFromServer.equals("6")) {
            UnityAds.initialize(context, sharedpreferences.getString(UNITY_APP_APP_ID, ""), false);
            UnityAdsListener myAdsListener = new UnityAdsListener();
            UnityAds.addListener(myAdsListener);
        } else if (adsCodeFromServer.equals("2")){
            StartAppSDK.init(context, sharedpreferences.getString(STARTAPP_APP_ID, ""), false);
        } else if (adsCodeFromServer.equals("5")) {
            Appnext.init(context);
            interstitialAd1 = new Interstitial(context, sharedpreferences.getString(APPNEX_INTER, ""));
            interstitialAd1.loadAd();
        } else if (adsCodeFromServer.equals("4")) {
            IronSource.init((Activity) context, sharedpreferences.getString(IRON_APP_ID, ""), IronSource.AD_UNIT.INTERSTITIAL);
            IronSource.setInterstitialListener(new InterstitialListener() {
                @Override
                public void onInterstitialAdReady() {
                    Log.d("ironAds", "ready");
                    IronSource.showInterstitial();
                }

                @Override
                public void onInterstitialAdLoadFailed(IronSourceError ironSourceError) {
                    Log.d("ironAds", "failed"+ironSourceError);
                }

                @Override
                public void onInterstitialAdOpened() {
                }

                @Override
                public void onInterstitialAdClosed() {
                }

                @Override
                public void onInterstitialAdShowSucceeded() {
                }

                @Override
                public void onInterstitialAdShowFailed(IronSourceError ironSourceError) {
                }

                @Override
                public void onInterstitialAdClicked() {

                }
            });
            IronSource.loadInterstitial();
        }else if (adsCodeFromServer.equals("3")){
            int adsNum = sharedpreferences.getInt("random_ads", 0);
            loadRandomAds(adsNum);
        }
    }


    public void  mixAdsShow(){
        int loadAds=sharedpreferences.getInt("random_ads", 0);
        Log.d("checknumber", "show: "+loadAds);
        if (loadAds==0){
            if (interstitialAd != null) {
                interstitialAd.show((Activity) context);
            }
            editor.putInt("random_ads", 1);
            editor.apply();

            //load();
            loadRandomAds(1);
        }else if (loadAds==1){
            if (interstitialAdFB.isAdLoaded()){
                interstitialAdFB.show();
            }
            editor.putInt("random_ads", 2);
            editor.apply();
//            load();
            loadRandomAds(2);
        }else if(loadAds== 2){
            startappMix();

        }else if(loadAds==4){
            loadRandomAds(4);
            editor.putInt("random_ads", 5);
            editor.apply();

        }else if (loadAds==5){
            appnext();
            editor.putInt("random_ads", 6);
            editor.apply();
            loadRandomAds(6);
        }else if(loadAds==6){
            showUnityAds();
            editor.putInt("random_ads", 0);
            editor.apply();
            loadRandomAds(0);
        }
    }

    public void show() {

        String adsCodeFromServer = sharedpreferences.getString(SplashActivity.ADSKEY, "");
        if (adsCodeFromServer.equals("0")) {
            if (interstitialAd != null) {
                interstitialAd.show((Activity) context);
            }
            load();
        } else if (adsCodeFromServer.equals("1")) {
            if(interstitialAdFB.isAdLoaded()){
                interstitialAdFB.show();

            }

            load();
        }
        else if (adsCodeFromServer.equals("5")) {
            appnext();
        }
        else if (adsCodeFromServer.equals("2")) {
            startapp();
        } else if (adsCodeFromServer.equals("6")) {
            showUnityAds();
        }else if(adsCodeFromServer.equals("4")){
            load();
        }else if (adsCodeFromServer.equals("3")){
            mixAdsShow();
        }
    }

    private void loadRandomAds(int adsNum) {
        if (adsNum==0) {
            AdRequest adRequest = new AdRequest.Builder().build();
            Log.d("dskfjs", "ads : " + sharedpreferences.getString(INTER_ADS, adCode));
            InterstitialAd.load(context, sharedpreferences.getString(INTER_ADS, adCode), adRequest,
                    new InterstitialAdLoadCallback() {
                        @Override
                        public void onAdLoaded(@NonNull InterstitialAd interstitialAd1) {
                            interstitialAd = interstitialAd1;
                            Log.d("dskfjs", "load: 1 onAdLoaded");
                        }

                        @Override
                        public void onAdFailedToLoad(@NonNull LoadAdError loadAdError) {
                            interstitialAd = null;
                            Log.d("dskfjs", "load: 1 onfailed");
                        }
                    });


        } else if (adsNum==1) {
            interstitialAdFB = new com.facebook.ads.InterstitialAd(context, sharedpreferences.getString(SplashActivity.FBINTERS_ID, ""));
            interstitialAdFB.loadAd();

        } else if (adsNum==6) {
            UnityAds.initialize(context, sharedpreferences.getString(UNITY_APP_APP_ID, ""), false);
            UnityAdsListener myAdsListener = new UnityAdsListener();
            UnityAds.addListener(myAdsListener);
        } else if (adsNum == 2){
            StartAppSDK.init(context, sharedpreferences.getString(STARTAPP_APP_ID, ""), false);
        } else if (adsNum==5) {
            Appnext.init(context);
            interstitialAd1 = new Interstitial(context, sharedpreferences.getString(APPNEX_INTER, ""));
            interstitialAd1.loadAd();
        } else if (adsNum==4) {
            IronSource.init((Activity) context, sharedpreferences.getString(IRON_APP_ID, ""), IronSource.AD_UNIT.INTERSTITIAL);
            IronSource.setInterstitialListener(new InterstitialListener() {
                @Override
                public void onInterstitialAdReady() {
                    Log.d("ironAds", "ready");
                    IronSource.showInterstitial();
                    loadRandomAds(5);
                }

                @Override
                public void onInterstitialAdLoadFailed(IronSourceError ironSourceError) {
                    Log.d("ironAds", "failed"+ironSourceError);
                    loadRandomAds(5);
                }

                @Override
                public void onInterstitialAdOpened() {
                }

                @Override
                public void onInterstitialAdClosed() {
                }

                @Override
                public void onInterstitialAdShowSucceeded() {

                    editor.putInt("random_ads", 5);
                    editor.apply();

                }
                @Override
                public void onInterstitialAdShowFailed(IronSourceError ironSourceError) {

                    editor.putInt("random_ads", 5);
                    editor.apply();
                }

                @Override
                public void onInterstitialAdClicked() {

                }
            });
            IronSource.loadInterstitial();
        }
    }


    public void showUnityAds() {
        if (UnityAds.isReady(interstitialAndroid)) {
            UnityAds.show((Activity) context, interstitialAndroid);
        }
    }

    public void appnext() {

        if (interstitialAd1.isAdLoaded()){
            interstitialAd1.showAd();
        }

    }

    private class UnityAdsListener implements IUnityAdsListener {

        @Override
        public void onUnityAdsReady(String adUnitId) {
            // Implement functionality for an ad being ready to show.
        }

        @Override
        public void onUnityAdsStart(String adUnitId) {
            // Implement functionality for a user starting to watch an ad.

        }

        @Override
        public void onUnityAdsFinish(String adUnitId, UnityAds.FinishState finishState) {
            // Implement functionality for a user finishing an ad.

        }

        @Override
        public void onUnityAdsError(UnityAds.UnityAdsError error, String message) {
            // Implement functionality for a Unity Ads service error occurring.
            Log.d("sdkfjs", "onUnityAdsError: " + message);

        }
    }


    public static class UnityBannerListener implements com.unity3d.services.banners.BannerView.IListener {
        @Override
        public void onBannerLoaded(com.unity3d.services.banners.BannerView bannerAdView) {
            //Empty
        }

        @Override
        public void onBannerClick(com.unity3d.services.banners.BannerView bannerAdView) {
            //Empty
        }

        @Override
        public void onBannerFailedToLoad(com.unity3d.services.banners.BannerView bannerAdView, BannerErrorInfo errorInfo) {
            //Empty
        }

        @Override
        public void onBannerLeftApplication(com.unity3d.services.banners.BannerView bannerView) {
            //Empty
        }
    }

    public void startapp() {
        startAppAd = new StartAppAd(context);
        startAppAd.loadAd(new AdEventListener() {
            @Override
            public void onReceiveAd(@NonNull com.startapp.sdk.adsbase.Ad ad) {
                startAppAd.showAd(new AdDisplayListener() {
                    @Override
                    public void adHidden(com.startapp.sdk.adsbase.Ad ad) {

                    }

                    @Override
                    public void adDisplayed(com.startapp.sdk.adsbase.Ad ad) {

                    }

                    @Override
                    public void adClicked(com.startapp.sdk.adsbase.Ad ad) {

                    }

                    @Override
                    public void adNotDisplayed(com.startapp.sdk.adsbase.Ad ad) {

                    }
                });
            }

            @Override
            public void onFailedToReceiveAd(@Nullable com.startapp.sdk.adsbase.Ad ad) {

            }
        });



    }
    public void startappMix() {
        startAppAd = new StartAppAd(context);
        startAppAd.loadAd(new AdEventListener() {
            @Override
            public void onReceiveAd(@NonNull com.startapp.sdk.adsbase.Ad ad) {
                startAppAd.showAd(new AdDisplayListener() {
                    @Override
                    public void adHidden(com.startapp.sdk.adsbase.Ad ad) {

                    }

                    @Override
                    public void adDisplayed(com.startapp.sdk.adsbase.Ad ad) {

                        editor.putInt("random_ads", 4);
                        editor.apply();
                    }

                    @Override
                    public void adClicked(com.startapp.sdk.adsbase.Ad ad) {

                    }

                    @Override
                    public void adNotDisplayed(com.startapp.sdk.adsbase.Ad ad) {
                        editor.putInt("random_ads", 4);
                        editor.apply();
                    }
                });
            }

            @Override
            public void onFailedToReceiveAd(@Nullable com.startapp.sdk.adsbase.Ad ad) {

            }
        });



    }
}
