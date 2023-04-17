<?php

namespace App\Http\Controllers\Admin;

use App\Category;
use App\Http\Controllers\Controller;
use App\Item;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class ItemController extends Controller
{
    public function index()
    {
        Session::put('page','item');

        $items = Item::with('category')->orderBy('id', 'DESC')->get();
        return view('admin.item.index',compact('items'))->with('no', 1);
    }


    public function create(){
        $categories = Category::get();

        return view('admin.item.create',compact('categories'));
        
    }

    public function store(Request $request)
        {
           
        //Item Validations
                $rules = [
                    'video_title' => 'required|max:55',
                    'cat_id' => 'required|numeric',
                    'video_type' => 'required',
                    'video_duration' => 'required',
                    'video_description' => 'required',
                   
                ];
    
                $messages = [
    
                    'video_title.required' => ' Title is required',
                    'cat_id.required' => 'Category is required',
                    'video_thumbnail.required' => ' Thumbnail is required',
                    'video_type.required' => ' Type is required',
                    'video_duration.required' => ' Duration is required',
                    'video_description.required' => ' Description is required'
    
                ];
    
                $this->validate($request, $rules, $messages);
                  
                    $item = new item;
    
                    //video file
                    if($request->video_type == 'Upload'){

                        $rules = [
                        
                            'video_file' => 'required|file|mimetypes:video/mp4',
                            'video_thumbnail' => 'required'
                           
                        ];                
                        $this->validate($request, $rules);
    
                        if($request->hasFile('video_thumbnail')){
                             //image
                            $imageName = time().'.'.$request->video_thumbnail->extension();  
                            $request->video_thumbnail->move(public_path('upload/video/'), $imageName);
                            $item->video_thumbnail = $imageName;
                        }


                        // get file size in bytes
                        $file_size = $request->file('video_file')->getSize();
                    
                        if ($file_size >= 1073741824) {
                            $bytes = number_format($file_size / 1073741824, 2) . ' GB';
                        }
            
                        else if ($file_size >= 1048576) {
                            $bytes = number_format($file_size / 1048576, 2) . ' MB';
                        }
            
                        else if ($file_size >= 1024) {
                            $bytes = number_format($file_size / 1024, 2) . ' KB';
                        }
            
                        else if ($file_size > 1) {
                            $bytes = $file_size . ' bytes';
                        }
            
                        else if ($file_size == 1) {
                            $bytes = $file_size . ' byte';
                        } else {
                            $bytes = '0 bytes';
                        }
    


                        $videoName = rand().'.'.$request->video_file->extension();  
                        $request->video_file->move(public_path('upload/video/'), $videoName);
                        $item->video_url = $videoName;
                        
                        $item->size = $bytes;
                    }
                    
                    //normal url
                    if($request->video_type == 'Hls' | $request->video_type == 'Rtmp' | $request->video_type == 'Rtsp' | $request->video_type == 'Ts' | $request->video_type == 'Daily_Motion' | $request->video_type == 'Embed' | $request->video_type == 'Vimeo'){
                        $rules = [
                        
                            'video_url' => 'required',
                            'video_thumbnail' => 'required'
                           
                        ];                
                        $this->validate($request, $rules);
    
                        if($request->hasFile('video_thumbnail')){
                            $imageName = time().'.'.$request->video_thumbnail->extension();  
                            $request->video_thumbnail->move(public_path('upload/video/'), $imageName);
                            $item->video_thumbnail = $imageName;
                        }
    
                        $item->video_url = $request->input('video_url');
                    }
                    
                    
                    
                    if($request->video_type == 'Youtube' && $request->video_file==null){

                        $rules = [
                            'video_url' => 'required',       
                        ];                
                        $this->validate($request, $rules);

                        $url = $request->input('video_url');
                        preg_match("/^(?:http(?:s)?:\/\/)?(?:www\.)?(?:m\.)?(?:youtu\.be\/|youtube\.com\/(?:(?:watch)?\?(?:.*&)?v(?:i)?=|(?:embed|v|vi|user|shorts)\/))([^\?&\"'>]+)/", $url, $matches);
                        $item->video_id = $matches[1];
                        $item->video_url = $url;
                    }
                    
                    $item->video_title = $request->input('video_title');
                    $item->cat_id = $request->input('cat_id');
                    $item->video_type = $request->input('video_type');
                    $item->video_duration = $request->input('video_duration');
                    $item->video_description = $request->input('video_description');
                   
                   
                    
                    $item->save();
                
                return redirect('admin/item_index')->with('message','Item Added Successfully!');
 
    }

    public function edit($id){
        $itemdata = Item::find($id);
        $categories = Category::get();

        return view('admin.item.edit',compact('itemdata','categories'));
        
    }

    public function update(Request $request, $id){
        //Item Validations
        $rules = [];

        $messages = [];

        if($request->video_title == null){
            $rules['video_title'] = 'required|max:55';
            $messages['video_title.required'] = ' Title is required';
        }
        if($request->cat_id == null){
            $rules['cat_id'] = 'required|numeric';
            $messages['cat_id.required'] = 'Category is required';
            $messages['cat_id.numeric'] = 'Category should be numeric';
        }
        
        if($request->video_type == null){
            $rules['video_type'] = 'required';
            $messages['video_type.required'] = ' Type is required';
        }
        if($request->video_duration == null){
            $rules['video_duration'] = 'required';
            $messages['video_duration.required'] = ' Duration is required';
        }
        if($request->video_description == null){
            $rules['video_description'] = 'required';
            $messages['video_description.required'] = ' Description is required';
        }
        
       

        $this->validate($request, $rules, $messages);
          
            $item = Item::find($id);


            if($request->hasFile('video_thumbnail')){ 

                if(file_exists(public_path('upload/video/'.$item->video_thumbnail)))
                {
                    @unlink(public_path('upload/video/'.$item->video_thumbnail));
                }
                
                //image
                $imageName = time().'.'.$request->video_thumbnail->extension();  
                $request->video_thumbnail->move(public_path('upload/video/'), $imageName);
                $item->video_thumbnail = $imageName;

                $item->update();
            }
            
            //video file
            if($request->video_type == 'Upload' ){
                
                if($request->hasFile('video_file')){

                    if(file_exists(public_path('upload/video/'.$item->video_url)))
                    {
                        @unlink(public_path('upload/video/'.$item->video_url));
                    }

                    // get file size in bytes
                    $file_size = $request->file('video_file')->getSize();
                
                    if ($file_size >= 1073741824) {
                        $bytes = number_format($file_size / 1073741824, 2) . ' GB';
                    }
        
                    else if ($file_size >= 1048576) {
                        $bytes = number_format($file_size / 1048576, 2) . ' MB';
                    }
        
                    else if ($file_size >= 1024) {
                        $bytes = number_format($file_size / 1024, 2) . ' KB';
                    }
        
                    else if ($file_size > 1) {
                        $bytes = $file_size . ' bytes';
                    }
        
                    else if ($file_size == 1) {
                        $bytes = $file_size . ' byte';
                    } else {
                        $bytes = '0 bytes';
                    }

                    $videoName = rand().'.'.$request->video_file->extension();  
                    $request->video_file->move(public_path('upload/video/'), $videoName);
                    $item->video_url = $videoName;

                    $item->size = $bytes;

                }
                

                $item->update();
            }
            
            // if($request->video_type == 'Url'){

                if($request->video_type == 'Hls' | $request->video_type == 'Rtmp' | $request->video_type == 'Rtsp' | $request->video_type == 'Ts' | $request->video_type == 'Daily_Motion' | $request->video_type == 'Embed' | $request->video_type == 'Vimeo'){

                $rules = [
                    
                    'video_url' => 'required',
                   
                ];      
                
                
                $this->validate($request, $rules);
                $item->video_url = $request->input('video_url');
            }
            
            
            
            if($request->video_type == 'Youtube' && $request->video_file==null){
                        $url = $request->input('video_url');
                            preg_match("/^(?:http(?:s)?:\/\/)?(?:www\.)?(?:m\.)?(?:youtu\.be\/|youtube\.com\/(?:(?:watch)?\?(?:.*&)?v(?:i)?=|(?:embed|v|vi|user|shorts)\/))([^\?&\"'>]+)/", $url, $matches);
                            $item->video_id = $matches[1];
                            $item->video_url = $url;
                    }
            
            
            $item->video_title = $request->input('video_title');
            $item->cat_id = $request->input('cat_id');
            $item->video_type = $request->input('video_type');
            $item->video_duration = $request->input('video_duration');
            $item->video_description = $request->input('video_description');
           
            
            $item->update();
            
            return redirect()->back()->with('message','Item Updated Successfully!');
    }


    public function destroy($id){
            $item = Item::find($id);
        

            $image = public_path('upload/video/'. $item->video_thumbnail);
            $file = public_path('upload/video/'. $item->video_url);

            if (file_exists($image)){
                @unlink($image);
            }

            if (file_exists($file)){
                @unlink($file);
            }
            $item->delete();
            
            return redirect()->back()->with('message', 'Item has been deleted.');
    }


    
}