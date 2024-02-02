<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\BlogPost;
use App\Models\User;
use App\Models\Category;

class BlogPostTest extends TestCase
{
    use RefreshDatabase;

    protected function setUp(): void
    {
        parent::setUp();
    }

    /** @test */
    public function a_user_can_create_a_blog_post()
    {
        $user = User::factory()->create();
        $category = Category::factory()->create();

        $response = $this->actingAs($user)->post('/store', [
            'category_id' => $category->id,
            'title' => 'Test Post',
            'content' => 'This is a test post.',
        ]);

        $response->assertStatus(302);
        $this->assertCount(1, BlogPost::all());
    }

    /** @test */
    public function a_user_can_edit_a_blog_post()
    {
        $user = User::factory()->create();
        $post = BlogPost::factory()->create(['user_id' => $user->id]);
        $newTitle = 'Updated Title';

        $response = $this->actingAs($user)->patch("/post/{$post->id}", [
            'category_id' => $post->category_id,
            'title' => $newTitle,
            'content' => $post->content,
        ]);

        $response->assertStatus(302);
        $this->assertEquals($newTitle, $post->fresh()->title);
    }

    /** @test */
    public function a_user_can_delete_a_blog_post()
    {
        $user = User::factory()->create();
        $post = BlogPost::factory()->create(['user_id' => $user->id]);

        $response = $this->actingAs($user)->delete("/post/delete/{$post->id}");

        $response->assertStatus(302);
        $this->assertCount(0, BlogPost::all());
    }
}
