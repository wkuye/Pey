<?php

namespace App\Console\Commands;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Hash;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Auth\Database\Role;
use Encore\Admin\Auth\Database\Permission;

class CreateAdminUser extends Command
{
    protected $signature = 'admin:create-user';
    protected $description = 'Create a new admin user';

    public function handle()
    {
        $username = $this->ask('Please enter a username to login:');
        $password = $this->secret('Please enter a password to login:');
        $name = $this->ask('Please enter a name to display:');

        // Create the admin user
        $adminUser = Administrator::create([
            'username' => $username,
            'password' => Hash::make($password),
            'name' => $name,
        ]);

        // Get or create the administrator role
        $adminRole = Role::firstOrCreate([
            'name' => 'Administrator',
            'slug' => 'administrator',
        ]);

        // Attach the administrator role to the admin user
        $adminUser->roles()->sync([$adminRole->id]);

        // Detach existing permissions (optional, depending on your use case)
        $adminUser->permissions()->detach();

        // Get all permissions
        $permissions = Permission::all();

        // Attach all permissions to the admin user
        $adminUser->permissions()->sync($permissions->pluck('id'));

        $this->info('Admin user created successfully.');
    }
}