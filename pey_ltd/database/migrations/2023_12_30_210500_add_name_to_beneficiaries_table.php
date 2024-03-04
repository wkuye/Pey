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
            // $table->string('name'); // Add the name column
        });
    }
    
    public function down()
    {
        Schema::table('beneficiaries', function (Blueprint $table) {
            // $table->dropColumn('name'); // Drop the name column
        });
    }
};
