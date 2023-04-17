<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Item;
use Illuminate\Support\Facades\DB;

class ItemController extends Controller
{
	public function get_posts(){

        $limit = isset($this->_request['count']) ? ((int)$this->_request['count']) : 10;
		$page = isset($this->_request['page']) ? ((int)$this->_request['page']) : 1;

        $offset = ($page * $limit) - $limit;

        $items = DB::table('items')->leftJoin('categories','items.cat_id', 'categories.id')->select(
            'items.id', 
            'items.id as vid', 
            'items.cat_id', 
            'items.video_title', 
            'items.video_url', 
            'items.video_id', 
            'items.video_thumbnail', 
            'items.video_duration', 
            'items.video_description', 
            'items.video_type', 
            'items.size', 
            'items.total_views', 
            'items.date_time', 
            'categories.category_name'
        )->orderBy('id', 'DESC');

        $total = $items->count();
        $result =  $items->offset($offset)->limit($limit)->get();
        return response()->json([
            'status' => 'ok',
            'count'=>count($result),
            'count_total'=>$total,
            'pages'=>$page,
            'posts' => $result
        ]);
    }
	
    public function search(Request $request)
    {

        $search = $request->query('search');

        $limit = isset($this->_request['count']) ? ((int)$this->_request['count']) : 10;
		$page = isset($this->_request['page']) ? ((int)$this->_request['page']) : 1;

        $offset = ($page * $limit) - $limit;

        $items = DB::table('items')->leftJoin('categories','items.cat_id', 'categories.id')->select(
            'items.id', 
            'items.id as vid', 
            'items.cat_id', 
            'items.video_title', 
            'items.video_url', 
            'items.video_id', 
            'items.video_thumbnail', 
            'items.video_duration', 
            'items.video_description', 
            'items.video_type', 
            'items.size', 
            'items.total_views', 
            'items.date_time', 
            'categories.category_name'
        )->where('video_title', 'like', '%' . $search . '%')->orderBy('id', 'DESC');

        $total = $items->count();
        $result =  $items->offset($offset)->limit($limit)->get();
        return response()->json([
            'status' => 'ok',
            'count'=>count($result),
            'count_total'=>$total,
            'pages'=>$page,
            'posts' => $result
        ]);
    }




    public function item_view_count($id) {
        
        $item = Item::select('id','video_title','total_views')->find($id);
        // Increment the post's view count by one
         Item::where('items.id', '=', $id)
            ->update(['total_views' => $item->total_views + 1 ]);
    
            if ($item){
                return response()->json([
                    'message'=>'Views added Successfully',
                    'data'=>$item
                ], 200);
            }else {
                return response()->json(['message'=>'Views could not be added'], 404);
            }
    }
}