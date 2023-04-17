@extends('layouts.admin_layout.admin_layout')
@section('content')

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Items</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{url('admin/dashboard')}}">Home</a></li>
                        <li class="breadcrumb-item active">Manage Items</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <x-alert />
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Items</h3>
                        <a href="{{ url('admin/item_create') }}"
                            style="max-width: 150px; float:right; display:inline-block;"
                            class="btn btn-block btn-primary"><i class="fas fa-plus"></i><strong>Add</strong> </a>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body" style="overflow-x:auto;">

                        <table id="story" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Sl.No</th>
                                    <th>Title</th>
                                    <th>Image</th>
                                    <th>Type</th>
                                    <th>Category</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($items as $item)
                                <tr>

                                    <td>{{ $no++ }}</td>
                                    <td>{{$item->video_title}}</td>
                                    <td>
                                        @if($item->video_type=='Youtube')
                                        <img style="width: 60px; height: 60px;" alt="no image"
                                            src=" {{'https://img.youtube.com/vi/'.$item->video_id.'/hqdefault.jpg' }} " />

                                        @else
                                        <img style=" width: 60px; height: 60px;" alt="no image"
                                            src="{{asset('upload/video/'.$item->video_thumbnail)}}" />
                                        @endif
                                    </td>
                                    <td>{{$item->video_type}}</td>

                                    <td>{{$item->category->category_name}}</td>

                                    <td>
                                        <a href="{{url('admin/item_edit/'.$item->id)}}" class="btn btn-success"
                                            role="button"><i class="material-icons option-icon">mode_edit</i></a>

                                        <a href="{{url('admin/item_delete/'.$item->id)}}"
                                            onclick="return confirm('Are you sure want to delete this News?')"
                                            class="btn btn-danger" role="button"><i
                                                class="material-icons option-icon">delete</i></a>
                                    </td>

                                </tr>

                                @endforeach
                            </tbody>
                        </table>
                    </div>
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