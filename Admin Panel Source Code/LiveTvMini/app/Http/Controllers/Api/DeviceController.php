<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Token;

class DeviceController extends Controller
{
    public function StoreToken(Request $request){
        $validator = Validator::make($request->all(),[
            'device_token'=>'required',
            'device_name'=>'required',
        ]);

        if ($validator->fails()){
            return response()->json(['message'=>'require all the details'], 404);
        }

        $saved = Token::create($request->all());
        if($saved){
            return response()->json(['message'=>'Token Saved Successfully'], 200);
        }else{
            return response()->json(['message'=>'Token could not be saved'], 404);
        }
    }
}
