<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Admin;
use Auth;
use DB;
use Session;

class AdminController extends Controller
{
    public function dashboard(){
        session::put('page','dashboard');
        //dynamic counts
        $adminCount = DB::table('admins')->count();
        $adCount = DB::table('advertisements')->count();
       
       
        $itemCount = DB::table('items')->count();
        $notifiCount = DB::table('notifications')->count();
     
        $settingsCount = DB::table('settings')->count();
        $sliderCount = DB::table('sliders')->count();
        $tvCount = DB::table('categories')->count();
       
        
        // dd($count);
        return view('admin.admin_dashboard',compact('adminCount','adCount','itemCount','notifiCount','settingsCount','sliderCount','tvCount'));
    }

    //data insert on database table
    public function login(Request $request){
        $data = [
            'userName' =>'Abdur Rahman',
            'email' =>'admin@admins',
            'full_name' =>'ProRahman',
            'user_role' =>'super_admin',
            'password' =>'admin',
        ];
        // Admin::create($data);
        $admin = Admin::all();

        
        //to signin admin and to go dashboard after post
        if($request->isMethod('post')){
            $data = $request->all();
            // dd($data); 

            //validation for admin login
        $rules = [
            'email'=> 'required|email|max:255',
            'password'=>'required',
        ];
        $message = [
            'email.max' => 'Enter a valid email address. ',
            'email.required' => 'Required email. ',
            'password.required' => 'Required a valid password. ',
        ];
        $validator = Validator::make($request->all(), $rules, $message);
        if ($validator->fails()) {
            return redirect()->back()
                        ->withErrors($validator)
                        ->withInput();
        }


            if(Auth::guard('admin')->attempt(['email'=>$data['email'], 'password'=>$data['password']])){
                return redirect('admin/dashboard');
            }else{
                return redirect()->back()->with('error', 'Invalid Email or Password');
            }
        }    //end of admin loginpost 
        return view('admin.admin_login');
    }

    //logout 
    public function logout(){
        Auth::guard('admin')->logout();
        return redirect('/admin');
    }
}
