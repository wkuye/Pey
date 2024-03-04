<?php

namespace Database\Seeders;
use App\Models\Category;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CategoriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $imagePath = public_path('images/'); 
        
        Category::create(['name' => 'Chair', 'image' => 'storage/images/'. 'chairs.png']);
        Category::create(['name' => 'Sofa', 'image' => 'storage/images/' . 'sofa.png']);
        Category::create(['name' => 'Desk', 'image' => 'storage/images/' . 'table.png']);
        Category::create(['name' => 'Electronics', 'image' =>'storage/images/' . 'electronics.png']);
   }
}
