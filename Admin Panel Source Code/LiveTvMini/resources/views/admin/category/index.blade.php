@extends('layouts.admin_layout.admin_layout')
@section('content')
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Categories</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{url('admin/dashboard')}}">Home</a></li>
              <li class="breadcrumb-item active">Category</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row justify-content-center">
        <div class="col-md-11">
          <x-alert/>
          <div class="card">
            <div class="card-header">
              <h3 class="card-title">Category</h3>
              
                <a href="{{ url('admin/category_create') }}" style="max-width: 150px; float:right; display:inline-block;" 
                class="btn btn-block btn-primary"><i class="fas fa-plus"></i>Add</a>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              
              <table id="category" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Sl.No</th>
                  <th>Name</th>
                  <th>Image</th>
                  <th>Actions</th>
                  
                </tr>
                </thead>
                <tbody>
                @foreach($categories as $cat)
                <tr>
                  
                  <td>{{ $no++ }}</td>
                  <td>{{$cat->category_name}}</td>
                  <td>
                    
                  @if(!empty($cat->category_image))
                    <img style="width: 130px; height: 130px;" class="img-thumbnail" src="{{asset('upload/category/'.$cat->category_image)}}"/>
                  @endif
                  </td>
                  <td>
                    <a href="{{url('admin/category_edit/'.$cat->id)}}" class="btn btn-success" role="button"><i class="material-icons option-icon">mode_edit</i></a>
                    &nbsp; &nbsp;
                    <a href="{{url('admin/category_delete/'.$cat->id)}}" class="btn btn-danger" role="button" onclick="return confirm('Are you sure want to delete this News?')" >
									                <i class="material-icons option-icon">delete</i></a>
                  </td>
                  
                </tr>
                @endforeach

                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
  <!-- /.content-wrapper -->
  @endsection
