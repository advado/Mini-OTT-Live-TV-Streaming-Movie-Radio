<?php

namespace App\Http\Controllers\Api;

use App\Category;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CategoryController extends Controller
{
    public function get_category(){
       

        $categories = DB::table('categories')
                
                ->select('categories.id')
            
                ->selectRaw('categories.id as cid, category_name, category_image')
                ->orderBy('id', 'DESC')->get();
        // $categories = DB::table('categories')
        //         ->leftJoin('items','categories.id', 'items.cat_id')
        //         ->select('items.id')
        //         ->groupBy('items.id')
        //         ->selectRaw('categories.id as cid, category_name, category_image, count(items.id) as video_count')
        //         ->orderBy('id', 'DESC')->get();
        $total = $categories->count();
       
        return response()->json([
            'status' => 'ok',
            'count'=>$total,
            'categories' => $categories
        ]);
    }

    public function get_post_by_category(Request $request){
        $object = $request->query('id');
        $category = Category::find($object);

        $limit = isset($this->_request['count']) ? ((int)$this->_request['count']) : 10;
		$page = isset($this->_request['page']) ? ((int)$this->_request['page']) : 1;

        $offset = ($page * $limit) - $limit;

        $items = DB::table('items')->leftJoin('categories','items.cat_id', 'categories.id')->where('cat_id','=',$object)
        ->select(
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
            'category' => $category,
            'posts' => $result
        ]);
    }
}