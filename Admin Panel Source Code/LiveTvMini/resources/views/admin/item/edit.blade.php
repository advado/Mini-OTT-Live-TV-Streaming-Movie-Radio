@extends('layouts.admin_layout.admin_layout')
@section('content')
<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Edit Items</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{url('admin/dashboard')}}">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{ url('admin/item_index') }}">Edit Items</a></li>
                        <li class="breadcrumb-item active">Edit Item</li>
                    </ol>
                </div>
            </div>
        </div>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <x-alert />
            <div class="card card-default">
                <div class="card-header">
                    <h3 class="card-title">Edit Item</h3>
                    <div class="card-tools">
                        <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                                class="fas fa-minus"></i></button>
                        <button type="button" class="btn btn-tool" data-card-widget="remove"><i
                                class="fas fa-remove"></i></button>
                    </div>
                </div>

                <form name="editVideoForm" id="editVideoForm" action="{{ url('admin/item_update/'.$itemdata->id) }}"
                    method="post" enctype="multipart/form-data">@csrf


                    <div class="card-body">
                        <div class="row">
                            <div class="col-12 col-sm-6">
                                <div class="form-group">
                                    <label for="video_title">Title</label>
                                    <input type="text" class="form-control" name="video_title" id="video_title"
                                        value="{{$itemdata->video_title}}" placeholder="Enter Video Title">
                                </div>
                            </div>
                            <!-- -->
                            <div class="col-12 col-sm-6">
                                <div class="form-group">
                                    <label>Category</label>
                                    <select name="cat_id" id="cat_id" class="form-control select2" style="width: 100%;">
                                        <option disabled selected value>Select an --option</option>
                                        @foreach($categories as $cat)
                                        <option value="{{$cat->id}}" <?php if($cat->id==$itemdata->cat_id){
                                        echo "selected";
                                    } ?>>{{$cat->category_name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <!--  -->
                            <div class="col-12 col-sm-6">
                                <div class="form-group">
                                    <label>Upload Type</label>
                                    <select name="video_type" id="video_type" class="form-control select2"
                                        style="width: 100%;">

                                        <option disabled selected value>Select an --option</option>
                                        <option value='Youtube' <?php if($itemdata->video_type=='Youtube'){
                                        echo "selected";
                                    } ?>>Youtube</option>
                                        <option value='Hls' <?php if($itemdata->video_type=='Hls'){
                                        echo "selected";
                                    } ?>>Hls</option>
                                        <option value='Rtmp' <?php if($itemdata->video_type=='Rtmp'){
                                        echo "selected";
                                    } ?>>Rtmp</option>
                                        <option value='Rtsp' <?php if($itemdata->video_type=='Rtsp'){
                                        echo "selected";
                                    } ?>>Rtsp</option>
                                        <option value='Ts' <?php if($itemdata->video_type=='Ts'){
                                        echo "selected";
                                    } ?>>Ts</option>
                                        <option value='Daily_Motion' <?php if($itemdata->video_type=='Daily_Motion'){
                                        echo "selected";
                                    } ?>>Daily Motion</option>
                                        <option value='Embed' <?php if($itemdata->video_type=='Embed'){
                                        echo "selected";
                                    } ?>>Embed</option>
                                        <option value='Vimeo' <?php if($itemdata->video_type=='Vimeo'){
                                        echo "selected";
                                    } ?>>Vimeo</option>
                                        <option value='Upload' <?php if($itemdata->video_type=='Upload'){
                                        echo "selected";
                                    } ?>>Upload</option>
                                    </select>
                                </div>
                            </div>
                            <!--  -->
                            <div class="col-12 col-sm-6">
                                <div class="form-group" id="video_thumbnail">
                                    <label for="video_thumbnail">Thumbnail</label>
                                    <div class="input-group">
                                        <div class="input-group">
                                            <input type="file" class="form-control" id="video_thumbnail"
                                                name="video_thumbnail">
                                        </div>
                                        <br>
                                        <br>
                                        <div>
                                            <img style="width:350px; height:250px;"
                                                src="{{asset('upload/video/'.$itemdata->video_thumbnail)}}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--  -->
                            <div class="col-12 col-sm-6">
                                <div class="form-group" id="url">
                                    <label for="video_url">Video Url</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="video_url" name="video_url"
                                            value="{{$itemdata->video_url}}"
                                            placeholder=" https://www.youtube.com/watch?v=II2EO3">
                                    </div>

                                </div>
                                <!--  -->


                                <div class="form-group" style="display: none;" id='file'>
                                    <label for="video_file">Video File</label>
                                    <div class="input-group">
                                        <input type="file" class="form-control" id="video_file" name="video_file"
                                            value="{{$itemdata->video_url}}">


                                    </div>
                                    <video width="400" controls class="mt-3">
                                        <source src="{{asset('upload/video/'.$itemdata->video_url)}}" type="video/mp4">
                                        <!-- <source src="mov_bbb.ogg" type="video/ogg">
                                        Your browser does not support HTML video. -->
                                    </video>

                                </div>

                            </div>
                            <!--  -->

                            <div class="col-12 col-sm-6">
                                <div class="form-group">
                                    <label for="video_duration">Video Duration</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="video_duration"
                                            name="video_duration" value="{{$itemdata->video_duration}}"
                                            placeholder="00:00">
                                    </div>
                                </div>
                            </div>
                            <!--  -->

                        </div>
                        <br>

                        <div class="form-group">
                            <label for="video_description">
                                Description
                            </label>
                            <textarea class="textarea" placeholder="Place some text here" name="video_description"
                                required
                                style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">
                                {{Request::old('video_description')}}

                                {{$itemdata->video_description}}
                            </textarea>
                        </div>
                        <!-- /.description -->
                    </div>


                    <div class="card-footer">
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
</div>
@endsection