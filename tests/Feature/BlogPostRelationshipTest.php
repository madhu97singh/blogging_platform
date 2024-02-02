<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class BlogPostRelationshipTest extends TestCase
{
    use RefreshDatabase;

    public function test_user_relationship()
    {
        $user = \App\Models\User::factory()->create();
        $post = \App\Models\BlogPost::factory()->create(['user_id' => $user->id]);
        $this->assertInstanceOf(\App\Models\User::class, $post->user);
        $this->assertEquals($user->id, $post->user->id);
    }

    public function test_category_relationship()
    {
        $category = \App\Models\Category::factory()->create();
        $post = \App\Models\BlogPost::factory()->create(['category_id' => $category->id]);
        $this->assertInstanceOf(\App\Models\Category::class, $post->category);
        $this->assertEquals($category->id, $post->category->id);
    }
}
