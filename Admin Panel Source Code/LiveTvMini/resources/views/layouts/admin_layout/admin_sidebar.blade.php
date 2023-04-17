  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
      <!-- Brand Logo -->
      <a href="{{ url('admin/dashboard') }}" class="brand-link">
          <span class="brand-text font-weight-light pl-4">Live Tv Mini</span>
      </a>

      <!-- Sidebar -->
      <div class="sidebar">
          <!-- Sidebar user panel (optional) -->
          <div class="user-panel mt-3 pb-3 mb-3 d-flex">
              <div class="image">
                  <img src="{{ asset('images/admin_images/avatar04.png  ') }}" class="img-circle elevation-2"
                      alt="User Image">
              </div>
              <div class="info">
                  <a href="#" class="d-block">{{ucwords(Auth::guard('admin')->user()->userName)}}</a>
              </div>
          </div>

          <!-- Sidebar Menu -->
          <nav class="mt-2">
              <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                  data-accordion="false">
                  <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                  <li class="nav-item">
                      @if(Session::get('page')=="dashboard")
                      <?php $active = "active";?>
                      @else
                      <?php $active = ""; ?>
                      @endif
                      <a href="{{ url('admin/dashboard') }}" class="nav-link {{$active}}">
                          <i class="nav-icon fas fa-tachometer-alt"></i>
                          <p>
                              Dashboard
                          </p>
                      </a>
                  </li>
                  <!--  -->
                  <li class="nav-item">
                      @if(Session::get('page')=="tvcat")
                      <?php $active = "active";?>
                      @else
                      <?php $active = ""; ?>
                      @endif
                      <a href="{{ url('admin/category_index') }}" class="nav-link {{$active}}">
                          <i class="nav-icon fas fa-list"></i>
                          <p>
                              Category
                          </p>
                      </a>
                  </li>
                  <!--  -->
		  
                  <!--  -->
                  
                  <!--  -->
                  
                  <li class="nav-item">
                      @if(Session::get('page')=="item")
                      <?php $active = "active";?>
                      @else
                      <?php $active = ""; ?>
                      @endif
                      <a href="{{ url('admin/item_index') }}" class="nav-link {{$active}}">
                          <i class="nav-icon fas fa-video"></i>
                          <p>
                            Video
                          </p>
                      </a>
                  </li>
                  
                  <!--  -->
                  
                  <!--  -->

                  <li class="nav-item">
                    @if(Session::get('page')=="notifi")
                    <?php $active = "active";?>
                    @else
                    <?php $active = ""; ?>
                    @endif
                    <a href="{{ url('admin/notifications') }}" class="nav-link {{$active}}">
                        <i class="nav-icon fas fa-bell"></i>
                        <p>
                        Notifications
                        </p>
                    </a>
                  </li>
                    

                  <!--  -->
                  <li class="nav-item">
                      @if(Session::get('page')=="slider")
                      <?php $active = "active";?>
                      @else
                      <?php $active = ""; ?>
                      @endif
                      <a href="{{ url('admin/slider_index') }}" class="nav-link {{$active}}">
                          <i class="nav-icon fas fa-film"></i>
                          <p>
                              Slider
                          </p>
                      </a>
                  </li>
                  <!--  -->
                  
                  <!--  -->
                  <li class="nav-item">
                      @if(Session::get('page')=="ads")
                      <?php $active = "active";?>
                      @else
                      <?php $active = ""; ?>
                      @endif
                      <a href="{{ url('admin/advertisement') }}" class="nav-link {{$active}}">
                          <i class="nav-icon fas fa-ad"></i>
                          <p>
                              Advertisement
                          </p>
                      </a>
                  </li>
                  <!--  -->
                  <li class="nav-item">
                      @if(Session::get('page')=="administrator")
                      <?php $active = "active";?>
                      @else
                      <?php $active = ""; ?>
                      @endif
                      <a href="{{ url('admin/Aindex') }}" class="nav-link {{$active}}">
                          <i class="nav-icon fas fa-user"></i>
                          <p>
                              Administrator
                          </p>
                      </a>
                  </li>
                  <!--  -->
                  
                  <li class="nav-item">
                      @if(Session::get('page')=="settings")
                      <?php $active = "active";?>
                      @else
                      <?php $active = ""; ?>
                      @endif
                      <a href="{{ url('admin/settings') }}" class="nav-link {{$active}}">
                          <i class="nav-icon fas fa-cog"></i>
                          <p>
                              Settings
                          </p>
                      </a>
                  </li>
                  <!--  -->
              </ul>
          </nav>
          <!-- /.sidebar-menu -->
      </div>
      <!-- /.sidebar -->
  </aside>