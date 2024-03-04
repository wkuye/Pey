<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::table('beneficiaries', function (Blueprint $table) {
            $table->string('image')->nullable(); // Add the image column with nullable flag if needed
        });
    }
    
    public function down()
    {
        Schema::table('beneficiaries', function (Blueprint $table) {
            $table->dropColumn('image'); // Drop the image column if rolling back migration
        });
    }
};
