<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class BlogPostRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        if($this->method()=='PATCH'){
            return [
                'category_id' => 'required|exists:categories,id',
                'title'=>'required',
                'content' =>'required',
            ];
        }else{
            return [
                'title'=>'required',
                'content' =>'required',
                'category_id' =>'required',
            ];
        }
    }

    public function messages(){
        return[ 
            'title.required'=>'Please Enter Tilte.',
            'content.required'=>'Please Enter Content.',
            'category_id.required'=>'Please Select Category.',
        ];
    }

}
