<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Slider;
use App\Item;
use Illuminate\Support\Facades\DB;

class SliderController extends Controller
{
    

    public function get_slide(){

        $limit = isset($this->_request['count']) ? ((int)$this->_request['count']) : 10;
		$page = isset($this->_request['page']) ? ((int)$this->_request['page']) : 1;

        $offset = ($page * $limit) - $limit;

        $sliders = DB::table('sliders')->leftJoin('categories','sliders.cat_id', 'categories.id')->select(
            'sliders.id', 
            'sliders.id as vid', 
            'sliders.cat_id', 
            'sliders.video_title', 
            'sliders.video_url', 
            'sliders.video_id', 
            'sliders.video_thumbnail', 
            'sliders.video_duration', 
            'sliders.video_description', 
            'sliders.video_type', 
            'sliders.size', 
            'sliders.total_views', 
            'sliders.date_time', 
            'categories.category_name'
        )->orderBy('id', 'DESC');

        $total = $sliders->count();
        $result =  $sliders->offset($offset)->limit($limit)->get();
        return response()->json([
            'status' => 'ok',
            'count'=>count($result),
            'count_total'=>$total,
            'pages'=>$page,
            'posts' => $result
        ]);
    }

    public function slider_view_count($id) {
        
        $slider = Slider::select('id','video_title','total_views')->find($id);
        // Increment the post's view count by one
        Slider::where('sliders.id', '=', $id)
            ->update(['total_views' => $slider->total_views + 1 ]);
    
            if ($slider){
                return response()->json([
                    'message'=>'Views added Successfully',
                    'data'=>$slider
                ], 200);
            }else {
                return response()->json(['message'=>'Views could not be added'], 404);
            }
    }
}