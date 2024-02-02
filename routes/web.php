<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BlogPostController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();


Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::middleware(['auth'])->group(function () {
    Route::get('/posts', [BlogPostController::class, 'index'])->name('posts');
    Route::GET('/create', [App\Http\Controllers\BlogPostController::class, 'create'])->name('create');
    Route::POST('/store', [App\Http\Controllers\BlogPostController::class, 'store'])->name('store');
    Route::GET('/post/show/{id}', [App\Http\Controllers\BlogPostController::class, 'show'])->name('post.show');
    Route::GET('/post/{id}/edit', [App\Http\Controllers\BlogPostController::class, 'edit'])->name('post.edit');
    Route::PATCH('/post/{id}', [App\Http\Controllers\BlogPostController::class, 'update'])->name('post.update');
    Route::delete('/post/delete/{id}', [App\Http\Controllers\BlogPostController::class, 'destroy'])->name('post.delete');
    Route::post('/posts/{posts}', [App\Http\Controllers\BlogPostController::class, 'status']);
    Route::post('/comments', [BlogPostController::class, 'Commentstore'])->name('comments.store');

});
