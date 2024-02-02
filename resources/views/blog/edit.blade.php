@extends('layouts.app')

@section('content')
<div class="container">
    <form method="POST" action="{{route('post.update',$post->id)}}">
        @csrf
        @method('PATCH')
        <div class="mb-3">
            <select class="form-control rounded-pill py-3 arrowSelect" id="category_id" name="category_id">
                <option value="">{{__('Select Category')}}</option>
                @foreach($categories as $value)
                @if($post->category_id == $value->id)
                <option selected value="{{$value->id}}">{{$value->name}}</option>
                @else
                <option value="{{$value->id}}">{{$value->name}}</option>
                @endif
                @endforeach
            </select>
            @error('category_id')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
        <div class="mb-3">
            <label for="title" class="form-label">Title</label>
            <input type="text" class="form-control" id="title" name="title" value="{{$post->title}}">
            @error('title')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>

        <div class="mb-3">
            <label for="tags" class="form-label">Tags</label>
            <input type="text" class="form-control" id="tags" name="tags" placeholder="Enter tags (comma-separated)" value="{{ $post->tags->pluck('name')->implode(', ') }}">
            <!-- <input type="text" class="form-control" name="tags" id="tags" value="{{ old('tags', $post->tags->pluck('name')->implode(', ')) }}"> -->
        </div>

        <div class="mb-3">
            <label for="content" class="form-label">Content</label>
            <textarea class="form-control" id="content" name="content">{{$post->content}}</textarea>
           @error('content')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>

        <!-- Initialize CKEditor -->
        <script>
            CKEDITOR.replace('content');
        </script>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
@endsection

