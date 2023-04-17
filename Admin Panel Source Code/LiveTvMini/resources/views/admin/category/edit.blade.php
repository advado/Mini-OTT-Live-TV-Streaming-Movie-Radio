@extends('layouts.admin_layout.admin_layout')
@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Category</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{url('admin/dashboard')}}">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{ url('admin/tvcat-index') }}">Category</a></li>
                        <li class="breadcrumb-item active">Edit Category</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <!-- left column -->
                <div class="col-md-9">
                    <!-- general form elements -->
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Edit Category</h3>
                        </div>
                        <br>
                        <x-alert />
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form name="tvcategoryForm" id="tvcategoryForm"
                            action="{{ url('admin/category_update/'.$data->id) }}" method="post"
                            enctype="multipart/form-data">@csrf

                            <!-- <input type="hidden" name="old_image" value="{{$data->category_image}}"> -->
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="category_name">Category Name</label>
                                    <input type="text" class="form-control" id="category_name" name="category_name"
                                        value="{{$data->category_name}}" placeholder="Enter Tv Category Name">
                                </div>
                                <div class="form-group">
                                    <label for="category_image">Category Image</label>
                                    <div class="input-group">
                                        <input type="file" class="form-control" id="category_image"
                                            name="category_image">
                                    </div>
                                    <br>
                                    <br>
                                    <br>
                                    <div>
                                        <img  class="img-fluid img-thumbnail" alt="Responsive image"
                                            src="{{asset('upload/category/'.$data->category_image)}}">
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->

                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary">Update</button>
                            </div>
                        </form>
                    </div>
                    <!-- /.card -->

                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->

</div>
<!-- /.content-wrapper -->

@endsection