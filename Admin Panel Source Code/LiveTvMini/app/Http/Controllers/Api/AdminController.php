<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Admin;
use Auth;


class AdminController extends Controller
{
    public function __construct()
    {

    }


    public function index()
    {
        return response()->json([
            'success' => true,
            'message' => '',
            'data' => Admin::all(),
        ]);
    }

    public function store(Request $request)
    {
        if($request->isMethod('post')){
            $data = $request->all();
        
        //validation for admin login
        $rules = [
            'email'=> 'required|email|max:255',
            'password'=>'required',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json($validator->getMessageBag()->all());
                    }

                    if(Auth::guard('admin')->attempt(['email'=>$data['email'], 'password'=>$data['password']])){
                return response()->json([
                    'message'=>'User Logged in'
                ]);
            }else{
                return response()->json([
                    'error'=> 'Invalid Email or Password'
                ]);
            }
        }
            //end of admin loginpost 
    }
    public function destroy($id)
    {
         return response()->json([
            'success' => true,
            'message' => 'Story Deleted!',
            'data' => Admin::where('id',$id)->delete(),
        ]);
    }
}
