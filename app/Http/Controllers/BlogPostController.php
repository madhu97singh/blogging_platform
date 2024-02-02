<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\{BlogPost,Category,Comment,Tag};
use App\Http\Requests\BlogPostRequest;
use Illuminate\Support\Facades\Cache;
class BlogPostController extends Controller
{
    public function index(Request $request)
    {
        // $categories = Category::all();
        // $tags = Tag::all();
        // $cacheKey = 'blog_posts_' . md5(json_encode($request->all()));
        // $posts = Cache::remember($cacheKey, now()->addMinutes(10), function () use ($request) {
        //     $query = BlogPost::with('category')->latest();

        //     if ($request->has('category')) {
        //         $query->where('category_id', $request->category);
        //     }

        //     if ($request->has('search')) {
        //         $query->where(function ($innerQuery) use ($request) {
        //             $innerQuery->where('title', 'like', '%' . $request->search . '%')
        //                         ->orWhere('content', 'like', '%' . $request->search . '%');
        //         });
        //     }

        //     return $query->paginate(10);
        // });
        // return view('blog.index', compact('posts', 'categories', 'tags'));
        
        $categories = Category::all();
        $tags = Tag::all();
        $query = BlogPost::with('category')->latest();

        if ($request->has('category')) {
            $query->where('category_id', $request->category);
        }

        if ($request->has('search')) {
            $query->where(function ($innerQuery) use ($request) {
                $innerQuery->where('title', 'like', '%' . $request->search . '%')
                            ->orWhere('content', 'like', '%' . $request->search . '%');
            });
        }

        $posts = $query->paginate(10);

        return view('blog.index', compact('posts', 'categories', 'tags'));
    }

    public function create()
    {
        $categories = Category::all();
        return view('blog.create', compact('categories'));
    }

    public function store(BlogPostRequest $request)
    {
        $post = new BlogPost();
        $post->user_id = auth()->id();
        $post->category_id = $request->category_id;
        $post->title = $request->title;
        $post->content = $request->content;
        $post->save();
        
        $tags = explode(',', $request->tags);
        foreach ($tags as $tag) {
            $tagModel = Tag::firstOrCreate(['name' => trim($tag)]);
            $post->tags()->attach($tagModel->id);
        }
        
        // Cache::forget('blog_posts_' . md5(json_encode($request->all())));
        return redirect('posts')->with('success', 'Post has been created successfully');
    }

    public function edit($id)
    {
        $post = BlogPost::find($id);
        $categories = Category::all();
        return view('blog.edit',compact('post','categories'));
    }

    public function update(Request $request, $id)
    {
        $post = BlogPost::find($id);

        $post->user_id = auth()->id();
        $post->category_id = $request->category_id;
        $post->title = $request->title;
        $post->content = $request->content;
        $post->save();
        $tags = explode(',', $request->tags);
        $tagIds = [];
        foreach ($tags as $tag) {
            $tagModel = Tag::firstOrCreate(['name' => trim($tag)]);
            $tagIds[] = $tagModel->id;
        }

        $post->tags()->sync($tagIds);
        return redirect('posts')->with('success','Post updated succesfully');
    }

    public function destroy($id)
    {
        $post =BlogPost::find($id);
        $post->delete();
        return redirect('posts');
    }

    public function Commentstore(Request $request)
    {
        $request->validate([
            'blog_post_id' => 'required|exists:blog_posts,id',
            'content' => 'required',
        ]);

        Comment::create([
            'blog_post_id' => $request->blog_post_id,
            'user_id' => auth()->user()->id, 
            'content' => $request->content,
        ]);

        return redirect()->back();
    }
}
