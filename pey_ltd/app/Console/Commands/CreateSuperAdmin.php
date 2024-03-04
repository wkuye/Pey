<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Auth\Database\Role;
use Encore\Admin\Auth\Database\Permission;



class CreateSuperAdmin extends Command
{
    protected $signature = 'admin:create-super-admin';
    protected $description = 'Create a super admin user with all permissions';

    public function handle()
    {
        $username = $this->ask('Please enter a username to login:');
        $password = $this->secret('Please enter a password to login:');
        $name = $this->ask('Please enter a name to display:');

        try {
            // Create the admin user
            $adminUser = Administrator::create([
                'username' => $username,
                'password' => bcrypt($password),
                'name' => $name,
            ]);

            // Get or create the administrator role
            $adminRole = Role::firstOrCreate([
                'name' => 'Administrator',
                'slug' => 'administrator',
            ]);

            // Attach the administrator role to the admin user
            $adminUser->roles()->sync([$adminRole->id]);

            // Get all permissions
            $allPermissions = Permission::all();

            // Attach all permissions to the admin user
            $adminUser->permissions()->sync($allPermissions->pluck('id'));

            $this->info('Super Admin user created successfully with all permissions.');
        } catch (\Exception $e) {
            $this->error('Error creating super admin user: ' . $e->getMessage());
        }
    }
}



