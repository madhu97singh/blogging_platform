<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Category;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Category::create(['name' => 'Technology']);
        Category::create(['name' => 'Travel']);
        Category::create(['name' => 'Software']);
        Category::create(['name' => 'Agriculture']);
        Category::create(['name' => 'Pharmacy']);
        Category::create(['name' => 'Information Technology']);
        Category::create(['name' => 'Artificial Intelligence']);
    }
}
