<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Settings extends Model
{
    protected $fillable = [
        'app_fcm_key',
        'comment_approval',
        'privacy_policy',
		'app_version'
    ];
}
