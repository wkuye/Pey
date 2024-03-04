<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Encore\Admin\Auth\Database\Administrator;
use Encore\Admin\Auth\Database\Role;
use Encore\Admin\Auth\Database\Permission;

class AssignAllRolesAndPermissions extends Command
{
    protected $signature = 'admin:assign-all-roles-and-permissions';
    protected $description = 'Assign all roles and permissions to an admin user';

    public function handle()
    {
        // Replace with your user retrieval logic
        $adminUser = Administrator::find(1);

        // Get all roles and permissions
        $roles = Role::all();
        $permissions = Permission::all();

        // Assign roles and permissions to the admin user
        $adminUser->roles()->sync($roles->pluck('id'));
        $adminUser->permissions()->sync($permissions->pluck('id'));

        $this->info('All roles and permissions assigned successfully.');
    }
}

