@extends('layouts.admin_layout.admin_layout')
@section('content')
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Advertisement</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{url('admin/dashboard')}}">Home</a></li>
              <li class="breadcrumb-item active">Advertisement</li>
            </ol>
          </div>
        </div>
      </div>
    </section>

    
    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <x-alert/>
            <!-- SELECT2 EXAMPLE -->
            <div class="card card-default">
                <div class="card-header">
                    <h3 class="card-title">Advertisement</h3>

                <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
                    <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-remove"></i></button>
                </div>
            </div>
            <!-- /.card-header -->
            <form name="storyForm" id="storyForm" action="{{ url('admin/advertisement/update') }}" method="post" enctype="multipart/form-data">@csrf 
                <div class="card-body">
                    <!-- 1st row -->
                    <div class="row">
                      <!-- Admob Ads -->                     
                      <div class="col-md-12">
                          <!-- <br> -->
                        <label class="card-title">Admob Ads:</label>
                      </div>
                          <!-- <br> -->
                          <br>
                      <div class="col-md-6">
                        <div class="form-group">
                            <h6>Inter Ad Unit</h6>
                            <input type="text" class="form-control" name="admob_inter" id="admob_inter" value="{{$ads->admob_inter}}" placeholder="Inter Ad Unit" >
                        </div>
                        <div class="form-group">
                            <h6>Banner Ad Unit</h6>
                            <input type="text" class="form-control" name="admob_banner" id="admob_banner" value="{{$ads->admob_banner}}" placeholder="Banner Ad Unit" >
                        </div>
                      </div>
                      
                      <div class="col-md-6">
                        <div class="form-group">
                            <h6>Native Ad Unit</h6>
                            <input type="text" class="form-control" name="admob_native" id="admob_native" value="{{$ads->admob_native}}" placeholder="Native Ad Unit" >
                        </div>
                        <div class="form-group">
                            <h6>Reward Ad Unit</h6>
                            <input type="text" class="form-control" name="admob_reward" id="admob_reward" value="{{$ads->admob_reward}}" placeholder="Reward Ad Unit" >
                        </div>
                      </div>

                      <!-- Admob Ads end -->
                      <!-- facebook Ads -->
                      <div class="col-md-12">
                          <br>
                        <label class="card-title">Facebook Ads:</label>
                      </div>
                          <br>
                          <br>
                      <div class="col-md-6">
                        <div class="form-group">
                            <h6>Inter Ad Unit</h6>
                            <input type="text" class="form-control" name="fb_inter" id="fb_inter" value="{{$ads->fb_inter}}" placeholder="Inter Ad Unit" >
                        </div>
                        <div class="form-group">
                            <h6>Banner Ad Unit</h6>
                            <input type="text" class="form-control" name="fb_banner" id="fb_banner" value="{{$ads->fb_banner}}" placeholder="Banner Ad Unit" >
                        </div>
                      </div>
                      
                      <div class="col-md-6">
                        <div class="form-group">
                            <h6>Native Ad Unit</h6>
                            <input type="text" class="form-control" name="fb_native" id="fb_native" value="{{$ads->fb_native}}" placeholder="Native Ad Unit" >
                        </div>
                        <div class="form-group">
                            <h6>Reward Ad Unit</h6>
                            <input type="text" class="form-control" name="fb_reward" id="fb_reward" value="{{$ads->fb_reward}}" placeholder="Reward Ad Unit" >
                        </div>
                      </div>
                      <!-- facebook Ads end -->
                      <!-- unity Ads start -->
                      <div class="col-md-12">
                          <br>
                        <label class="card-title">Unity Ads:</label>
                      </div>
   
                      <div class="col-md-12">
                        <div class="form-group">
                            <h6 style="color=red;">Enter your AppId/GameId</h6>
                            <input type="text" class="form-control" name="unity_appId_gameId" id="unity_appId_gameId" value="{{$ads->unity_appId_gameId}}" placeholder="Inter Ad Unit" >
                        </div>
                      </div>
                      <!-- unity Ads end -->
                      <!-- ironsource Ads start -->
                      <div class="col-md-12">
                          <br>
                        <label class="card-title">Iron Source Ads:</label>
                      </div>
                      <div class="col-md-12">
                        <div class="form-group">
                            <h6>Enter Your AppKey</h6>
                            <input type="text" class="form-control" name="iron_appKey" id="iron_appKey" value="{{$ads->iron_appKey}}" placeholder="Inter Ad Unit" >
                        </div>
                      </div>
                      <!-- ironsource Ads end -->
                      <!-- AppNext Ads start -->
                      <div class="col-md-12">
                          <br>
                        <label class="card-title">App Next Ads:</label>
                      </div>
                          <br>
                          <br>
                      <div class="col-md-12">
                        
                        <div class="form-group">
                            <h6>Enter Your PlacementID</h6>
                            <input type="text" class="form-control" name="appnext_placementId" id="appnext_placementId" value="{{$ads->appnext_placementId}}" placeholder="placementId" >
                        </div>
                      </div>
                      <!-- AppNext Ads end -->
                      <!-- Startup Ads  -->
                      <div class="col-md-12">
                          <br>
                        <label class="card-title">Startapp Ads:</label>
                      </div>
                          <br>
                          <br>
                      <div class="col-md-12">
                        <div class="form-group">
                            <h6>Enter Your AppId</h6>
                            <input type="text" class="form-control" name="startapp_appId" id="startapp_appId" value="{{$ads->startapp_appId}}" placeholder="AppId" >
                        </div>
                      </div>
                      <!-- Startup Ads end -->

                      <div class="col-md-12">
                        <br>
                        <label class="card-title">Interstitial Interval:</label>
                        <div class="form-group">
                            <!-- <h6></h6> -->
                            <input type="text" class="form-control" name="industrial_interval" id="industrial_interval" value="{{$ads->industrial_interval}}" placeholder="Industrial_Interval" >
                        </div>
                      </div>
                      <div class="col-md-12">
                        <br>
                        <label class="card-title">Native Ads:</label>
                        <div class="form-group">
                            <!-- <h6></h6> -->
                            <input type="text" class="form-control" name="native_ads" id="native_ads" value="{{$ads->native_ads}}" placeholder="Native_Ads" >
                        </div>
                      </div>
                      
                      <div class="col-md-12">
                          <br>
                        <div class="form-group">
                            <label for="ads_type">Ads Type</label>
                            
                            <select name="ads_type" id="ads_type" class="form-control select2" style="width:100%;">
                              <option disabled selected value>Select an --option</option>
                              <option  value="0" @if ($ads['ad_types'] == "0") {{ 'selected' }} @endif>Admob</option>  
                              <option  value="1" @if ($ads['ad_types'] == "1") {{ 'selected' }} @endif>Facebook</option>  
                              <option  value="2" @if ($ads['ad_types'] == "2") {{ 'selected' }} @endif>Startapp</option>
                              <option  value="4" @if ($ads['ad_types'] == "4") {{ 'selected' }} @endif>IronSource</option>
                              <option  value="5" @if ($ads['ad_types'] == "5") {{ 'selected' }} @endif>AppNext</option>  
                              <option  value="6" @if ($ads['ad_types'] == "6") {{ 'selected' }} @endif>Unity</option>
                              <option  value="3" @if ($ads['ad_types'] == "3") {{ 'selected' }} @endif>Show Ads on Mix</option>  
                            </select>
                        </div>
                      </div>
                  
                    </div>
                  </div>
                       
                  <div class="card-footer">
                    <button type="submit"  class="btn btn-primary">update</button>
                  </div>
                    
            </form>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  @endsection
