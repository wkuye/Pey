<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Encore\Admin\Auth\Database\Administrator;

class ResetAdminUsers extends Command
{
    protected $signature = 'admin:reset-users';
    protected $description = 'Reset admin users to default';

    public function handle()
    {
        // Remove all existing admin users
        Administrator::truncate();

        // Create default admin user
        Administrator::create([
            'username' => 'admin',
            'password' => bcrypt('admin'),
            'name' => 'Admin User',
        ]);

        $this->info('Admin users reset successfully.');
    }
}

