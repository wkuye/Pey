<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    // public function up()
    // {
    //     Schema::table('transactions', function (Blueprint $table) {
    //         $table->unsignedBigInteger('recipient_id')->nullable()->after('user_id');
    //         // Add foreign key constraint if necessary
    //         $table->foreign('recipient_id')->references('id')->on('users')->onDelete('cascade');
    //     });
    // }
    
    // public function down()
    // {
    //     Schema::table('transactions', function (Blueprint $table) {
    //         $table->dropColumn('recipient_id');
    //     });
    // }
};
