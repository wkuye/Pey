<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddBenIdToBeneficiaries extends Migration
{
    public function up()
    {
        Schema::table('beneficiaries', function (Blueprint $table) {
            $table->unsignedBigInteger('ben_id');
            // Add any additional configurations, such as foreign key constraints
        });
    }

    public function down()
    {
        Schema::table('beneficiaries', function (Blueprint $table) {
            $table->dropColumn('ben_id');
        });
    }
}
