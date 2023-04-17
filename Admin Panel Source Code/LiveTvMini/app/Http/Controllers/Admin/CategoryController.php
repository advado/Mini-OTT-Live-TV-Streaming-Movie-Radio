<?php

namespace App\Http\Controllers\Admin;

use App\Category;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class CategoryController extends Controller
{
    public function index()
    {
        Session::put('page','tvcat');
    
           $categories = Category::orderBy('id', 'DESC')->get();
            return view('admin.category.index',compact('categories'))->with('no', 1);
    }

    public function create(){
        return view('admin.category.create');
    }

    public function store(Request $request){

        //Category Validations
            $rules = [
                
                'category_name' => 'required|max:55',
                'category_image' => 'required',  
            ];
            
            $this->validate($request, $rules);

        $category= new Category;
        
        
        $imageName = time().'.'.$request->category_image->extension();  
        $request->category_image->move(public_path('upload/category/'), $imageName);

        $category->category_image = $imageName;
        $category->category_name = $request->input('category_name');

        $category->save();
        return redirect('admin/category_index')->with('message','Category Added Successfully!');
    }

    public function edit($id){
        $data = Category::find($id);
        return view('admin.category.edit',compact('data'));
    }

    public function update(Request $request,$id){

        //Tv channel Category Validations
            $rules = [
                
                'category_name' => 'required|max:55'
            ];
            
            $this->validate($request, $rules);

            $category = Category::find($id);
           
            
            if($request->hasFile('category_image')){

		


		$path= public_path('upload/category/'.$category->category_image);

                if(file_exists($path)){
                    @unlink($path);
                }

		$imageName = time().'.'.$request->category_image->extension();  
        	$request->category_image->move(public_path('upload/category/'), $imageName);

        	$category->category_image = $imageName;

                $category->update();
            }
            else{
                $category->category_name = $request->input('category_name');
                $category->update();
            }
            
            return redirect('admin/category_index')->with('message','Category updated successfully!');
                
    }

    public function destroy($id){
         $data = Category::find($id);

		$path= public_path('upload/category/'.$data->category_image);
                if(file_exists($path)){
                    @unlink($path);
                }

         $data->delete();
         return redirect()->back()->with('message', 'Category has been deleted.');
    } 
}


