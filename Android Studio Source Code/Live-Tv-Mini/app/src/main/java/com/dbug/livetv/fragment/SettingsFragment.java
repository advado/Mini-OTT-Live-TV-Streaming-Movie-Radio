package com.dbug.livetv.fragment;

import static android.content.Context.MODE_PRIVATE;

import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;

import androidx.activity.OnBackPressedCallback;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.databinding.DataBindingUtil;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;
import androidx.preference.PreferenceFragment;
import androidx.preference.PreferenceFragmentCompat;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.dbug.livetv.R;
import com.dbug.livetv.activity.MainActivity;
import com.dbug.livetv.config.Constant;
import com.dbug.livetv.databinding.FragmentSettingsBinding;

public class SettingsFragment extends Fragment {

    FragmentSettingsBinding fragmentSettingsBinding;
    SharedPreferences sharedPreferences ;
    SharedPreferences.Editor editor;
    public static final String MYPREFERENCE = "mypref";

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        sharedPreferences = getContext().getSharedPreferences(MYPREFERENCE, MODE_PRIVATE);
        editor = sharedPreferences.edit();

        fragmentSettingsBinding.switchNotification.setOnClickListener(view1 -> {
            if (fragmentSettingsBinding.switchNotification.isChecked()) {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                    fragmentSettingsBinding.switchNotification.setThumbTintList(ColorStateList.valueOf(Color.parseColor("#191B23")));
                    fragmentSettingsBinding.switchNotification.setTrackTintList(ColorStateList.valueOf(Color.parseColor("#C5C6C8")));
                }
                fragmentSettingsBinding.switchNotification.setChecked(true);
                editor.putBoolean("notification", true);
                editor.apply();
                // The toggle is enabled
            } else {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                    fragmentSettingsBinding.switchNotification.setThumbTintList(ColorStateList.valueOf(Color.parseColor("#C5C6C8")));
                    fragmentSettingsBinding.switchNotification.setTrackTintList(ColorStateList.valueOf(Color.parseColor("#E3E4E5")));
                }
                fragmentSettingsBinding.switchNotification.setChecked(false);
                editor.putBoolean("notification", false);
                editor.apply();
                // The toggle is disabled
            }
        });
        fragmentSettingsBinding.switchVibrate.setOnClickListener(view1 -> {
            if (fragmentSettingsBinding.switchVibrate.isChecked()) {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                    fragmentSettingsBinding.switchVibrate.setThumbTintList(ColorStateList.valueOf(Color.parseColor("#191B23")));
                    fragmentSettingsBinding.switchVibrate.setTrackTintList(ColorStateList.valueOf(Color.parseColor("#C5C6C8")));
                }
                fragmentSettingsBinding.switchVibrate.setChecked(true);
                editor.putBoolean("vibrate", true);
                editor.apply();
                // The toggle is enabled
            } else {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                    fragmentSettingsBinding.switchVibrate.setThumbTintList(ColorStateList.valueOf(Color.parseColor("#C5C6C8")));
                    fragmentSettingsBinding.switchVibrate.setTrackTintList(ColorStateList.valueOf(Color.parseColor("#E3E4E5")));
                }
                fragmentSettingsBinding.switchVibrate.setChecked(false);
                editor.putBoolean("vibrate", false);
                editor.apply();
                // The toggle is disabled
            }
        });

        fragmentSettingsBinding.feedbackButton.setOnClickListener(view1 -> openWebPage(Constant.FEEDBACK_URL));
        fragmentSettingsBinding.faqButton.setOnClickListener(view1 -> openWebPage(Constant.FAQ_URL));
        fragmentSettingsBinding.privacy.setOnClickListener(view1 -> openWebPage(Constant.PRIVACY_URL));
        fragmentSettingsBinding.terms.setOnClickListener(view1 -> openWebPage(Constant.Terms_URL));
        boolean vibrator= sharedPreferences.getBoolean("vibrate", false);
        boolean notifi= sharedPreferences.getBoolean("notification", false);

        if(notifi || vibrator){
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                fragmentSettingsBinding.switchNotification.setThumbTintList(ColorStateList.valueOf(Color.parseColor("#191B23")));
                fragmentSettingsBinding.switchNotification.setTrackTintList(ColorStateList.valueOf(Color.parseColor("#C5C6C8")));
                fragmentSettingsBinding.switchVibrate.setThumbTintList(ColorStateList.valueOf(Color.parseColor("#191B23")));
                fragmentSettingsBinding.switchVibrate.setTrackTintList(ColorStateList.valueOf(Color.parseColor("#C5C6C8")));
            }
        }else {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                fragmentSettingsBinding.switchVibrate.setThumbTintList(ColorStateList.valueOf(Color.parseColor("#C5C6C8")));
                fragmentSettingsBinding.switchVibrate.setTrackTintList(ColorStateList.valueOf(Color.parseColor("#E3E4E5")));
                fragmentSettingsBinding.switchNotification.setThumbTintList(ColorStateList.valueOf(Color.parseColor("#C5C6C8")));
                fragmentSettingsBinding.switchNotification.setTrackTintList(ColorStateList.valueOf(Color.parseColor("#E3E4E5")));
            }
        }
        fragmentSettingsBinding.switchVibrate.setChecked(vibrator);
        fragmentSettingsBinding.switchNotification.setChecked(notifi);

        OnBackPressedCallback callback = new OnBackPressedCallback(true /* enabled by default */) {
            @Override
            public void handleOnBackPressed() {
                // Handle the back button event
                Fragment homeFragment = new HomeFragment();
                FragmentTransaction transaction = getParentFragmentManager().beginTransaction();
                transaction.replace(R.id.navigation_frame_layout, homeFragment); // give your fragment container id in first parameter
                transaction.addToBackStack(null);  // if written, this transaction will be added to backstack
                transaction.commit();

                MainActivity.getInstance().navIconColorChanged("home");
            }
        };

        requireActivity().getOnBackPressedDispatcher().addCallback(callback);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        fragmentSettingsBinding = DataBindingUtil.inflate(inflater, R.layout.fragment_settings, container, false);
        View view = fragmentSettingsBinding.getRoot();
        return view;
    }

    public void openWebPage(String url) {

        Uri webpage = Uri.parse(url);

        if (!url.startsWith("http://") && !url.startsWith("https://")) {
            webpage = Uri.parse("http://" + url);
        }

        Intent intent = new Intent(Intent.ACTION_VIEW, webpage);
        if (intent.resolveActivity(getActivity().getPackageManager()) != null) {
            startActivity(intent);
        }
    }
}