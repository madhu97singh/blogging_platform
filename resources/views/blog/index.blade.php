
@extends('layouts.app')

@section('content')
<div class="container mt-3">
    <div class="row justify-content-end">
        <div class="col-md-4">
            <form action="{{ route('posts') }}" method="get" class="d-flex">
                @csrf
                <div class="input-group">
                    <input type="search" class="form-control rounded-pill" id="search" name="search" placeholder="Search...">
                    <button type="submit" class="btn btn-primary rounded-pill ms-2">Go</button>
                </div>
            </form>
        </div>
    </div>
</div>


    <div class="container">
        
        @if(session('user_name'))
            <h1><p>Welcome back, {{ session('user_name') }}!Learn Create Your Own Blog</p></h1>
        @else
            <h1><p>Welcome To Blog Learn Create Your Own Blog</p></h1>
        @endif
        <form action="{{ route('posts') }}" method="get">
            @csrf
            <label for="category">Filter post by Category:</label>
            <select name="category" id="category">
                <option value="">All Categories</option>
                @foreach($categories as $category)
                    <option value="{{ $category->id }}" {{ request('category') == $category->id ? 'selected' : '' }}>{{ $category->name }}</option>
                @endforeach
            </select>
            <button type="submit" class="mb-3">Filter</button>
            <!-- <div class="mb-3">
                <label for="search" class="form-label">Search</label>
                <input type="text" class="form-control" id="search" name="search" placeholder="Enter search term">
            </div>

            <button type="submit">Search</button> -->
        </form>
        <h5><p>Latest Posts from all categories</p></h5>
        @if(sizeOf($posts)>0)
        @foreach($posts as $post)
            <div class="card mb-4">
                <div class="card-body">
                    <h2 class="card-title">{{ $post->title }}</h2>
                    <p class="card-text">{!! strip_tags($post->content) !!}</p>
                    <p class="card-text">Category: {{ $post->category->name }}</p>
                    <p class="card-text">Author: {{ optional($post->user)->name }}</p>
                    <p class="card-text">Publication Date: {{ $post->user->created_at->format('M d, Y') }}</p>

                    @if($post->comments->count() > 0)
                    <h3 class="card-title">Comments:</h3>
                    <ul class="list-unstyled">
                        @foreach($post->comments as $comment)
                            <li>
                                {{ $comment->content }} - {{ $comment->user->name }}
                            </li>
                        @endforeach
                    </ul>
                    @endif
                    @if($post->tags->count() > 0)
                    <p>Tags:
                    @foreach ($post->tags as $tag)
                        <span class="badge bg-primary">{{ $tag->name }}</span>
                    @endforeach</p>
                    @endif
                    <!-- @if($post->tags->count() > 0)
                        <p>Tags: {{ $post->tags->pluck('name')->implode(', ') }}</p>
                    @endif -->
                    @if(auth()->user()->id == $post->user_id)
                    <div class="d-flex align-items-center">
                        <a href="/post/{{$post->id}}/edit" class="btn btn-success"><span class="fa fa-pencil"></span> Edit</a>
                        <form action="{{ route('post.delete', $post->id) }}" enctype="multipart/form-data" method="POST">
                            @method('DELETE')
                            @csrf
                            <input type="submit" class="btn btn-danger" style="color: #fff" onclick="return confirm('Are you sure you want to delete this post');" value="Delete">
                        </form>
                    </div>
                    @endif
                </div>
            </div>
            <form action="{{ route('comments.store') }}" method="post">
                @csrf
                <input type="hidden" name="blog_post_id" value="{{ $post->id }}">
                <textarea name="content" placeholder="Leave a comment" required=""></textarea>
                <button type="submit">Comment</button>
            </form>
        @endforeach
        @else
        <h3>No Posts Available!</h3>
        @endif
    </div>
    {{ $posts->links() }}
<script type="text/javascript">
    $('.toggle-status').click(function() {
        var postId = $(this).attr('data-user');
        $.ajax({
            type: 'POST',
            url: '/posts/' + postId ,
            data: {
                _token: '{{ csrf_token() }}',
                postId : postId
            },
            success: function(response) {
                location.reload();
            },
            error: function(error) {
                console.error(error);
                alert('Error toggling user status.');
            }
        });
    });
</script>
<script>
    document.getElementById('search').addEventListener('input', function () {
        let query = this.value.trim();
        let listItems = document.querySelectorAll('#postsList');
        listItems.forEach(function (item) {
            let text = item.textContent.toLowerCase();
            let match = text.includes(query.toLowerCase());
            item.style.display = match ? 'block' : 'none';
        });
    });
</script>
@endsection
