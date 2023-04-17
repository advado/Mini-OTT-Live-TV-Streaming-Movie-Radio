<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    protected $guarded = [];

    //belongsto relationship
    public function category()
    {
        return $this->belongsTo(Category::class, 'cat_id');
    }
}
