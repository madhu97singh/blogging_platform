@extends('layouts.app')

@section('content')
<div class="container">
    <form method="POST" action="{{ route('store') }}">
        @csrf
        <div class="mb-3">
            <select class="form-control rounded-pill py-3 arrowSelect" id="category_id" name="category_id">
                <option value="">{{__('Select Category')}}</option>
                @foreach($categories as $category)
                <option value="{{$category->id}}">{{$category->name}}</option>
                @endforeach
            </select>
            @error('category_id')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
        <div class="mb-3">
            <label for="title" class="form-label">Title</label>
            <input type="text" class="form-control" id="title" name="title">
            @error('title')
                <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>

        <div class="mb-3">
            <label for="tags" class="form-label">Tags</label>
            <input type="text" class="form-control" id="tags" name="tags" placeholder="Enter tags (comma-separated)">
        </div>

        <div class="mb-3">
            <label for="content" class="form-label">Content</label>
            <textarea class="form-control" id="content" name="content"></textarea>
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
<script>
    // Initialize Select2 for better tag input
    $(document).ready(function () {
        $('#tags').select2({
            tags: true,
            tokenSeparators: [',', ' '],
            placeholder: 'Enter tags (comma-separated)',
        });
    });
@endsection

