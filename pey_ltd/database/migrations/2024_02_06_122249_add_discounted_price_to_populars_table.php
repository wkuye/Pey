<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Schema::table('populars', function (Blueprint $table) {
        //     // $table->decimal('discounted_price', 8, 2)->nullable();
        // });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Schema::table('populars', function (Blueprint $table) {
        //     $table->dropColumn('discounted_price');
        // });
    }
};
