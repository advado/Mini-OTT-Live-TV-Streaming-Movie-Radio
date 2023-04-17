<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $guarded = [];


	public function category()
    {
        return $this->hasMany(Item::class, 'cat_id');
    }
}
