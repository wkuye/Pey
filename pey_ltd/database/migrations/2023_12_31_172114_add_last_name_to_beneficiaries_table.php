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
            $table->string('last_name'); // Add the last_name column
        });
    }
    
    public function down()
    {
        Schema::table('beneficiaries', function (Blueprint $table) {
            $table->dropColumn('last_name'); // Drop the last_name column if needed
        });
    }
};
