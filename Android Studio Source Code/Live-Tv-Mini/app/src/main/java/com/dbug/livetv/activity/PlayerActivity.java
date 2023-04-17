package com.dbug.livetv.activity;

import androidx.appcompat.app.AppCompatActivity;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.os.Bundle;
import android.util.Log;
import android.view.View;

import com.dbug.livetv.config.Constant;
import com.dbug.livetv.R;
import com.pierfrancescosoffritti.androidyoutubeplayer.core.player.YouTubePlayer;
import com.pierfrancescosoffritti.androidyoutubeplayer.core.player.listeners.AbstractYouTubePlayerListener;
import com.pierfrancescosoffritti.androidyoutubeplayer.core.player.listeners.YouTubePlayerFullScreenListener;
import com.pierfrancescosoffritti.androidyoutubeplayer.core.player.views.YouTubePlayerView;

import xyz.doikki.videocontroller.StandardVideoController;
import xyz.doikki.videoplayer.ijk.IjkPlayerFactory;
import xyz.doikki.videoplayer.player.VideoView;
import xyz.doikki.videoplayer.player.VideoViewConfig;
import xyz.doikki.videoplayer.player.VideoViewManager;

public class PlayerActivity extends AppCompatActivity {


    YouTubePlayerView youTubePlayerView;
    String url;
    String videoType;
    String videoId;

    VideoView videoView;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_player);

        if (getSupportActionBar() != null) {
            getSupportActionBar().hide();
        }
        Intent callingIntent = getIntent();

        videoType = callingIntent.getStringExtra("video_type");
        url = callingIntent.getStringExtra("url");
        videoId = callingIntent.getStringExtra("video_id");

        youTubePlayerView = findViewById(R.id.youtube_player_view);
      //  exoPlayerView = findViewById(R.id.newExo);
        getLifecycle().addObserver(youTubePlayerView);
//new Player Update
        videoView = findViewById(R.id.player);
        videoView.setScreenScaleType(VideoView.SCREEN_SCALE_DEFAULT);

        videoView.addOnLayoutChangeListener((v, left, top, right, bottom, oldLeft, oldTop, oldRight, oldBottom) -> {
            int orientation = getResources().getConfiguration().orientation;
            if (orientation == Configuration.ORIENTATION_LANDSCAPE) {
                videoView.setScreenScaleType(VideoView.SCREEN_SCALE_MATCH_PARENT);
            } else {
                // In portrait
                videoView.setScreenScaleType(VideoView.SCREEN_SCALE_DEFAULT);
            }

        });

        VideoViewManager.setConfig(VideoViewConfig.newBuilder()
                .setPlayerFactory(IjkPlayerFactory.create())
                .build());

        Log.d("checkUrls", "onCreate: "+videoType+"\n"+url);
          if (videoType.equals("Url")){
              setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
              videoView.setVisibility(View.VISIBLE);
              videoView.setUrl(url); //设置视频地址
              StandardVideoController controller = new StandardVideoController(this);
              controller.addDefaultControlComponent("", false);
              videoView.setVideoController(controller);
              videoView.setKeepScreenOn(true);//设置控制器
              videoView.startFullScreen();
              videoView.start();
              youTubePlayerView.setVisibility(View.GONE);

        }else if (videoType.equals("Upload")){
              String url1 = Constant.ADMIN_PANEL_URL+Constant.ADMIN_PANEL_PATH+
              "/public/upload/"+getIntent().getStringExtra("from")+"/"+url;
            setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
            videoView.setVisibility(View.VISIBLE);
            videoView.setUrl(url1); //设置视频地址
            StandardVideoController controller = new StandardVideoController(this);
            controller.addDefaultControlComponent("", false);
            videoView.setVideoController(controller);
            videoView.setKeepScreenOn(true);//设置控制器
            videoView.startFullScreen();
            videoView.start();
            youTubePlayerView.setVisibility(View.GONE);
          } else if(videoType.equals("Youtube")){
           setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
            youTubePlayerView.setVisibility(View.VISIBLE);
            youTubePlayerView.addYouTubePlayerListener(new AbstractYouTubePlayerListener() {
                @Override
                public void onReady(YouTubePlayer youTubePlayer) {
                    String id = videoId;
                    youTubePlayer.loadVideo(id,0);
                    youTubePlayer.play();
                }
            });
            youTubePlayerView.addFullScreenListener(new YouTubePlayerFullScreenListener() {
                @Override
                public void onYouTubePlayerEnterFullScreen() {
                    youTubePlayerView.enterFullScreen();
                    setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
                }

                @Override
                public void onYouTubePlayerExitFullScreen() {

                    youTubePlayerView.exitFullScreen();
                    setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
                }
            });
        }else {
              setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
              videoView.setVisibility(View.VISIBLE);
              videoView.setUrl(url); //设置视频地址
              StandardVideoController controller = new StandardVideoController(this);
              controller.addDefaultControlComponent("", false);
              videoView.setVideoController(controller);
              videoView.setKeepScreenOn(true);//设置控制器
              videoView.startFullScreen();
              videoView.start();
              youTubePlayerView.setVisibility(View.GONE);
          }

    }



    @Override
    protected void onPause() {
        super.onPause();
        videoView.pause();
    }

    @Override
    protected void onResume() {
        videoView.resume();
        getWindow().getDecorView().setSystemUiVisibility(
                View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                        | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                        | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                        | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                        | View.SYSTEM_UI_FLAG_FULLSCREEN
                        | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY);
        super.onResume();
    }
    @Override
    protected void onDestroy() {
        super.onDestroy();
        videoView.release();
    }


    @Override
    public void onBackPressed() {
        if (!videoView.onBackPressed()) {
            super.onBackPressed();
        }
    }

}