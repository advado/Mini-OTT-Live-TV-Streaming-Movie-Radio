<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Admin;
use Auth;
use Session;



class AdministratorController extends Controller
{
    public function index(){
        session::put('page','administrator');
        $admins = Admin::latest()->paginate(3);
        // echo "<pre>"; print_r($admins);  die;
        return view('admin.Aindex', compact('admins'))->with('no', 1);
    }

    //add functionality
    public function create()
    {
        
       return view('admin.Acreate');
    }

    //Submit function
    public function store(Request $request)
    {

            
            $admin = new Admin;
        
            $admin->userName = $request->input('userName');
            $admin->email = $request->input('email');
            $admin->password = $request->input('password');
            $admin->full_name = $request->input('full_name');
            
            
            $admin->save();
            return redirect('admin/Aindex')->with('message', 'Admin added successfully!');
    }
    
    public function edit($id)
    {
       
        $admindata = Admin::find($id);
        
       return view('admin.Aedit',compact('admindata'));
    }

    public function update(Request $request, $id){

        
                    //check if new and confirm password is matching or not
                    if($request['password']==$request['confirm_password']){
                        Admin::where('id',Auth::guard('admin')->user()->id)->update(['password'=>bcrypt($request['password'])]);
                        return redirect()->back()->with('message','Admin has been updated successfully!');
                    }else{
                         return redirect()->back()->with('error','new and confirm password not match!');
                    }

            
            $admin->userName = $request->input('userName');
            $admin->email = $request->input('email');
            $admin->password = $request->input('password');
            $admin->full_name = $request->input('full_name');
            
            
            $admin->save();
           
            return redirect('admin/Aindex')->with('message', 'Admin updated successfully!');
    }

    public function destroy(Admin $admin, $id){
        Admin::destroy(array('id',$id));
        return redirect()->back()->with('message', 'SubAdmin has been deleted.');
    }

    public function search(){
        $search_txt = $_GET['name'];
       
         $admins = Admin::where('userName', 'LIKE', '%'.$search_txt.'%')
         ->orWhere('full_name', 'LIKE', '%'.$search_txt.'%')
         
         ->paginate(1);
        
         
        return view('admin.Aindex',compact('admins'));
    }


}