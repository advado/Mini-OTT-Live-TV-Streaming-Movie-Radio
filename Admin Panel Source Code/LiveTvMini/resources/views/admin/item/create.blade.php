@extends('layouts.admin_layout.admin_layout')
@section('content')
<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Items</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{url('admin/dashboard')}}">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{ url('admin/video-index') }}">Manage Item</a></li>
                        <li class="breadcrumb-item active">Add Item</li>
                    </ol>
                </div>
            </div>
        </div>
    </section>


    <section class="content">
        <div class="container-fluid">
            <x-alert />
            <div class="card card-default">
                <div class="card-header">
                    <h3 class="card-title">Add Item</h3>

                    <div class="card-tools">
                        <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                                class="fas fa-minus"></i></button>
                        <button type="button" class="btn btn-tool" data-card-widget="remove"><i
                                class="fas fa-remove"></i></button>
                    </div>
                </div>

                <form name="videoForm" id="videoForm" action="{{ url('admin/item_submit') }}" method="post"
                    enctype="multipart/form-data">@csrf
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12 col-sm-6">
                                <div class="form-group">
                                    <label for="video_title">Title</label>
                                    <input type="text" class="form-control" name="video_title" id="video_title"
                                        value="{{ old('video_title') }}" placeholder="Enter Video Title">
                                </div>
                            </div>
                            <!-- -->
                            <div class="col-12 col-sm-6">
                                <div class="form-group">
                                    <label>Category</label>
                                    <select name="cat_id" id="cat_id" class="form-control select2" style="width: 100%;">
                                        <option disabled selected value>Select an --option</option>
                                        @foreach($categories as $cat)
                                        <option value="{{$cat->id}}">{{$cat->category_name}}</option>
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
                                        <option value='Youtube'>Youtube</option>
                                        <option value='Hls'>Hls</option>
                                        <option value='Rtmp'>Rtmp</option>
                                        <option value='Rtsp'>Rtsp</option>
                                        <option value='Ts'>Ts</option>
                                        <option value='Daily_Motion'>Daily Motion</option>
                                        <option value='Embed'>Embed</option>
                                        <option value='Vimeo'>Vimeo</option>
                                        <option value='Upload'>Upload</option>
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
                                    </div>
                                </div>
                            </div>
                            <!--  -->
                            <div class="col-12 col-sm-6">
                                <div class="form-group" id="url">
                                    <label for="video_url">Video Url</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="video_url" name="video_url"
                                            value="{{ old('video_url') }}"
                                            placeholder=" https://www.youtube.com/watch?v=II2EO3">
                                    </div>
                                </div>
                                <!--  -->


                                <div class="form-group" style="display: none;" id='file'>
                                    <label for="video_file">Video File</label>
                                    <div class="input-group">
                                        <input type="file" class="form-control" id="video_file" name="video_file"
                                            value="{{ old('video_file') }}">
                                    </div>
                                </div>

                            </div>
                            <!--  -->

                            <div class="col-12 col-sm-6">
                                <div class="form-group">
                                    <label for="video_duration">Video Duration</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="video_duration"
                                            name="video_duration" value="{{ old('video_duration') }}"
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
                            </textarea>
                        </div>
                        <!-- /.description -->
                    </div>

                    <div class="card-footer">
                        <button type="submit" class="btn btn-primary">Publish</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
</div>
@endsection