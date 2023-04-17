package com.dbug.livetv.activity;

import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.DataBindingUtil;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import com.dbug.livetv.R;
import com.dbug.livetv.adapter.ItemAdapter;
import com.dbug.livetv.api.ApiInter;
import com.dbug.livetv.databinding.ActivityRecentBinding;
import com.dbug.livetv.model.AllPost;
import com.dbug.livetv.retofit.RetrofitClient;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;



public class RecentActivity extends AppCompatActivity {


    ActivityRecentBinding activityRecentBinding ;

    ItemAdapter itemAdapter;
    List<AllPost.Post> post;

    int count = 20;
    // Linear Layout Manager
    LinearLayoutManager linearLayoutManager;
    int showItem = 35;
    private int previousTotal = 0;
    private boolean loading = true;
    private int visibleThreshold = 5;
    int firstVisibleItem;
    int visibleItemCount;
    int totalItemCount;





    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        activityRecentBinding = DataBindingUtil.setContentView(this,R.layout.activity_recent);
        if (getSupportActionBar() != null) {
            getSupportActionBar().hide();
        }
        getData(count);

        activityRecentBinding.backButton.setOnClickListener(v -> onBackPressed());
    }

    public void itemRecyclerview(List<AllPost.Post> itamlist){
        itemAdapter = new ItemAdapter(this,itamlist);
        linearLayoutManager = new LinearLayoutManager(RecentActivity.this,LinearLayoutManager.VERTICAL,false);
        activityRecentBinding.itemRecyclerview.setLayoutManager(linearLayoutManager);
        activityRecentBinding.itemRecyclerview.setAdapter(itemAdapter);
        activityRecentBinding.itemRecyclerview.addOnScrollListener(new RecyclerView.OnScrollListener() {

            @Override
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                super.onScrolled(recyclerView, dx, dy);

                visibleItemCount = activityRecentBinding.itemRecyclerview.getChildCount();
                totalItemCount = linearLayoutManager.getItemCount();
                firstVisibleItem = linearLayoutManager.findFirstVisibleItemPosition();

                if (loading && totalItemCount > previousTotal) {
                    loading = false;
                    previousTotal = totalItemCount;
                }
                if (!loading && (totalItemCount - visibleItemCount)
                        <= (firstVisibleItem + visibleThreshold)) {
                    // End has been reached
                    // Do something
                    showItem += 35;
                    reLoad(showItem);
                    loading = true;
                }
            }
        });
        itemAdapter.notifyDataSetChanged();



    }

    private void reLoad(int count2 ) {
        //apiInter
        ApiInter apiInter = RetrofitClient.getRetrofit()
                .create(ApiInter.class);

        apiInter.getPostBody(count2)
                .enqueue(new Callback<AllPost>() {
                    @Override
                    public void onResponse(Call<AllPost> call, Response<AllPost> response) {
                        if (response.isSuccessful()){
                            AllPost allPost = response.body();
                            post = allPost.getPosts();
                            itemRecyclerview(post);

                        }
                    }
                    @Override
                    public void onFailure(Call<AllPost> call, Throwable t) {
                        Log.d("sgfgsdgs", "onFailure: "+t.getMessage());
                    }
                });
    }


    private void getData(int count ) {
        //category
        ApiInter category = RetrofitClient.getRetrofit()
                .create(ApiInter.class);

        category.getPostBody(count)
                .enqueue(new Callback<AllPost>() {
                    @Override
                    public void onResponse(Call<AllPost> call, Response<AllPost> response) {
                        if (response.isSuccessful()){
                            AllPost allPost = response.body();
                            post = allPost.getPosts();
                            itemRecyclerview(post);

                        }
                    }
                    @Override
                    public void onFailure(Call<AllPost> call, Throwable t) {
                        Log.d("sgfgsdgs", "onFailure: "+t.getMessage());
                    }
                });
    }
}