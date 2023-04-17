package com.dbug.livetv.activity;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.DataBindingUtil;
import androidx.recyclerview.widget.LinearLayoutManager;

import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import com.dbug.livetv.R;
import com.dbug.livetv.adapter.ItemAdapter;
import com.dbug.livetv.api.ApiInter;

import com.dbug.livetv.databinding.ActivityCategoryItemListBinding;
import com.dbug.livetv.model.AllPost;
import com.dbug.livetv.retofit.RetrofitClient;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;



public class CategoryItemList extends AppCompatActivity {


    ItemAdapter itemAdapter;

    LinearLayoutManager linearLayoutManager;

    ActivityCategoryItemListBinding activityCategoryItemListBinding;

    String cid;
    String categoryName;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        activityCategoryItemListBinding = DataBindingUtil.setContentView(this,R.layout.activity_category_item_list);

        if (getSupportActionBar() != null) {
            getSupportActionBar().hide();
        }
        Intent callingIntent = getIntent();

        cid = callingIntent.getStringExtra("cid");
        categoryName = callingIntent.getStringExtra("category_name");

        activityCategoryItemListBinding.categoryListName.setText(categoryName);



        activityCategoryItemListBinding.swiperefresh.setRefreshing(true);

        if(isConnectingToInternet(CategoryItemList.this))
        {
            loadData();
        }
        else {
            new AlertDialog.Builder(CategoryItemList.this)
                    .setMessage("No internet Connection ")
                    .setCancelable(false)
                    .setPositiveButton("Yes", (dialog, id) -> loadData())
                    .show();

        }
        activityCategoryItemListBinding.swiperefresh.setOnRefreshListener(() -> {
            activityCategoryItemListBinding.swiperefresh.setRefreshing(true);
            loadData();

        });

        activityCategoryItemListBinding.backButton.setOnClickListener(v -> onBackPressed());

    }

    public void itemRecyclerview(List<AllPost.Post> itamlist){
        itemAdapter = new ItemAdapter(this,itamlist);
        linearLayoutManager = new LinearLayoutManager(CategoryItemList.this,LinearLayoutManager.VERTICAL,false);
        activityCategoryItemListBinding.allItemViewCategory.setLayoutManager(linearLayoutManager);
        activityCategoryItemListBinding.allItemViewCategory.setAdapter(itemAdapter);

        activityCategoryItemListBinding.swiperefresh.setRefreshing(false);

    }

    public void loadData(){
        ApiInter category = RetrofitClient.getRetrofit()
                .create(ApiInter.class);
        category.getCategoryPostBody(cid)
                .enqueue(new Callback<AllPost>() {
                    @Override
                    public void onResponse(Call<AllPost> call, Response<AllPost> response) {
                        Log.d("ssfs", "onResponse: "+response.body());
                        if (response.isSuccessful()){
                            AllPost allPost = response.body();
                            List<AllPost.Post> post =allPost.getPosts();
                            itemRecyclerview(post);
                        }
                    }
                    @Override
                    public void onFailure(Call<AllPost> call, Throwable t) {
                        Log.d("sgfgsdgs", "onFailure: "+t.getMessage());

                    }
                });
    }


    public static boolean isConnectingToInternet(Context context) {
        ConnectivityManager connectivity = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        return connectivity != null;
    }

}