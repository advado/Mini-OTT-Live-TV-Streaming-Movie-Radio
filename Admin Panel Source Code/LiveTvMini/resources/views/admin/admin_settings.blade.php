@extends('layouts.admin_layout.admin_layout')
@section('content')
  
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Settings</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{url('admin/dashboard')}}">Home</a></li>
                        <li class="breadcrumb-item active">Settings</li>
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
                    <h3 class="card-title">Settings</h3>
                </div>
                <!-- /.card-header -->
                <form name="storyForm" id="storyForm" action="{{ url('admin/settings/update') }}" method="post" enctype="multipart/form-data">@csrf 
                    <div class="card-body">
                        <!-- 1st row -->
                        <div class="row ">
                            <!---->                     
                            <div class="col-sm-12">
                          	<!--  -->
                                <div class="col-sm-12">
                                    
                                    <div class="col-sm-12">
                                        
                                        <div class="form-group">
                                            <div class="form-line">
                                                <label class="font-12">FCM Server Key</label>
                                                <input type="text" class="form-control" name="app_fcm_key" id="app_fcm_key" value="{{$settings->app_fcm_key}}" required></input>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>
                           
                            <br>
                            <!--  -->
                                <div class="col-sm-12">
                                    
                                    <div class="col-sm-12">
                                        
                                        <div class="form-group">
                                            <div class="form-line">
                                                <label class="font-12">Privacy Policy</label>
                                                <textarea class="textarea" placeholder="Place some text here" name="privacy_policy" id="privacy_policy" required
                                                        style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">
                                                        {{$settings->privacy_policy}}
                                                </textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <!--  -->
                        </div>
                    </div>
                        
                    <div class="card-footer">
                        <button type="submit"  class="btn btn-primary">update</button>
                    </div>
                        
                </form>
                    <!--  -->
                    <div class="modal fade" id="modal-default">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Default Modal</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <input type="text" id="generateBox" class="form-control" placeholder="Enter ..." value="" name="">
                                </div>

                                <div class="modal-footer justify-content-between">
                                    <button type="button" onclick="generateToken()" class="btn btn-info">Generate Token</button>
                                    <button type="button" onclick="copyToken()" class="btn btn-primary">Apply Token</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                                </div>
                            </div>
                                <!-- /.modal-content -->
                        </div>
                            <!-- /.modal-dialog -->
                    </div>
                        <!-- second modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">

                                <div class="modal-body">
                                    are you sure you want to apply token?
                                    <p class="text-warning"> warning: you have to change your token in mobile devices also</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" onclick="applyToken()" class="btn btn-primary">yes</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>

                                </div>
                            </div>
                        </div>
                    </div>
                <!-- </div> -->
                <!--  -->
            </div>        
        </div>     
    </section>   
</div>
<!-- /.content-wrapper -->


<script type="text/javascript">
    function generateToken() {

         var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

         var length = 12
         var result = ' ';
         var charactersLength = characters.length;
         for (let i = 0; i < length; i++) {
             result += characters.charAt(Math.floor(Math.random() * charactersLength));
         }

         document.getElementById("generateBox").value = result;

     }

     function copyToken() {


         $('#modal-default').modal('hide');
         $('#exampleModal').modal('show');
     }

     function applyToken() {
         var generateBox = document.getElementById("generateBox")
         var tokenBox = document.getElementById("tokenBox")
         var result = generateBox.value;

         document.getElementById("tokenBox").value = generateBox.value;
         generateBox.value = ""
         $('#exampleModal').modal('hide');
}
</script>
  @endsection


            