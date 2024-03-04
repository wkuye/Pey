<?php

namespace Database\Seeders;

use DB;
use Illuminate\Database\Seeder;

class AdminTablesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // base tables
        \Encore\Admin\Auth\Database\Menu::truncate();
        \Encore\Admin\Auth\Database\Menu::insert(
            [

            ]
        );

        \Encore\Admin\Auth\Database\Permission::truncate();
        \Encore\Admin\Auth\Database\Permission::insert(
            [
                [
                    "name" => "BENEFICIARIESList",
                    "slug" => "beneficiaries.list",
                    "http_method" => "GET",
                    "http_path" => "/beneficiaries"
                ],
                [
                    "name" => "BENEFICIARIESView",
                    "slug" => "beneficiaries.view",
                    "http_method" => "GET",
                    "http_path" => "/beneficiaries/*"
                ],
                [
                    "name" => "BENEFICIARIESCreate",
                    "slug" => "beneficiaries.create",
                    "http_method" => "POST",
                    "http_path" => "/beneficiaries"
                ],
                [
                    "name" => "BENEFICIARIESEdit",
                    "slug" => "beneficiaries.edit",
                    "http_method" => "PUT,PATCH",
                    "http_path" => "/beneficiaries/*"
                ],
                [
                    "name" => "BENEFICIARIESDelete",
                    "slug" => "beneficiaries.delete",
                    "http_method" => "DELETE",
                    "http_path" => "/beneficiaries/*"
                ],
                [
                    "name" => "BENEFICIARIESExport",
                    "slug" => "beneficiaries.export",
                    "http_method" => "GET",
                    "http_path" => ""
                ],
                [
                    "name" => "BENEFICIARIESFilter",
                    "slug" => "beneficiaries.filter",
                    "http_method" => "GET",
                    "http_path" => "/beneficiaries"
                ],
                [
                    "name" => "FAILED-JOBSList",
                    "slug" => "failed-jobs.list",
                    "http_method" => "GET",
                    "http_path" => "/failed-jobs"
                ],
                [
                    "name" => "FAILED-JOBSView",
                    "slug" => "failed-jobs.view",
                    "http_method" => "GET",
                    "http_path" => "/failed-jobs/*"
                ],
                [
                    "name" => "FAILED-JOBSCreate",
                    "slug" => "failed-jobs.create",
                    "http_method" => "POST",
                    "http_path" => "/failed-jobs"
                ],
                [
                    "name" => "FAILED-JOBSEdit",
                    "slug" => "failed-jobs.edit",
                    "http_method" => "PUT,PATCH",
                    "http_path" => "/failed-jobs/*"
                ],
                [
                    "name" => "FAILED-JOBSDelete",
                    "slug" => "failed-jobs.delete",
                    "http_method" => "DELETE",
                    "http_path" => "/failed-jobs/*"
                ],
                [
                    "name" => "FAILED-JOBSExport",
                    "slug" => "failed-jobs.export",
                    "http_method" => "GET",
                    "http_path" => ""
                ],
                [
                    "name" => "FAILED-JOBSFilter",
                    "slug" => "failed-jobs.filter",
                    "http_method" => "GET",
                    "http_path" => "/failed-jobs"
                ],
                [
                    "name" => "ITEMSList",
                    "slug" => "items.list",
                    "http_method" => "GET",
                    "http_path" => "/items"
                ],
                [
                    "name" => "ITEMSView",
                    "slug" => "items.view",
                    "http_method" => "GET",
                    "http_path" => "/items/*"
                ],
                [
                    "name" => "ITEMSCreate",
                    "slug" => "items.create",
                    "http_method" => "POST",
                    "http_path" => "/items"
                ],
                [
                    "name" => "ITEMSEdit",
                    "slug" => "items.edit",
                    "http_method" => "PUT,PATCH",
                    "http_path" => "/items/*"
                ],
                [
                    "name" => "ITEMSDelete",
                    "slug" => "items.delete",
                    "http_method" => "DELETE",
                    "http_path" => "/items/*"
                ],
                [
                    "name" => "ITEMSExport",
                    "slug" => "items.export",
                    "http_method" => "GET",
                    "http_path" => ""
                ],
                [
                    "name" => "ITEMSFilter",
                    "slug" => "items.filter",
                    "http_method" => "GET",
                    "http_path" => "/items"
                ],
                [
                    "name" => "MIGRATIONSList",
                    "slug" => "migrations.list",
                    "http_method" => "GET",
                    "http_path" => "/migrations"
                ],
                [
                    "name" => "MIGRATIONSView",
                    "slug" => "migrations.view",
                    "http_method" => "GET",
                    "http_path" => "/migrations/*"
                ],
                [
                    "name" => "MIGRATIONSCreate",
                    "slug" => "migrations.create",
                    "http_method" => "POST",
                    "http_path" => "/migrations"
                ],
                [
                    "name" => "MIGRATIONSEdit",
                    "slug" => "migrations.edit",
                    "http_method" => "PUT,PATCH",
                    "http_path" => "/migrations/*"
                ],
                [
                    "name" => "MIGRATIONSDelete",
                    "slug" => "migrations.delete",
                    "http_method" => "DELETE",
                    "http_path" => "/migrations/*"
                ],
                [
                    "name" => "MIGRATIONSExport",
                    "slug" => "migrations.export",
                    "http_method" => "GET",
                    "http_path" => ""
                ],
                [
                    "name" => "MIGRATIONSFilter",
                    "slug" => "migrations.filter",
                    "http_method" => "GET",
                    "http_path" => "/migrations"
                ],
                [
                    "name" => "OAUTH-ACCESS-TOKENSList",
                    "slug" => "oauth-access-tokens.list",
                    "http_method" => "GET",
                    "http_path" => "/oauth-access-tokens"
                ],
                [
                    "name" => "OAUTH-ACCESS-TOKENSView",
                    "slug" => "oauth-access-tokens.view",
                    "http_method" => "GET",
                    "http_path" => "/oauth-access-tokens/*"
                ],
                [
                    "name" => "OAUTH-ACCESS-TOKENSCreate",
                    "slug" => "oauth-access-tokens.create",
                    "http_method" => "POST",
                    "http_path" => "/oauth-access-tokens"
                ],
                [
                    "name" => "OAUTH-ACCESS-TOKENSEdit",
                    "slug" => "oauth-access-tokens.edit",
                    "http_method" => "PUT,PATCH",
                    "http_path" => "/oauth-access-tokens/*"
                ],
                [
                    "name" => "OAUTH-ACCESS-TOKENSDelete",
                    "slug" => "oauth-access-tokens.delete",
                    "http_method" => "DELETE",
                    "http_path" => "/oauth-access-tokens/*"
                ],
                [
                    "name" => "OAUTH-ACCESS-TOKENSExport",
                    "slug" => "oauth-access-tokens.export",
                    "http_method" => "GET",
                    "http_path" => ""
                ],
                [
                    "name" => "OAUTH-ACCESS-TOKENSFilter",
                    "slug" => "oauth-access-tokens.filter",
                    "http_method" => "GET",
                    "http_path" => "/oauth-access-tokens"
                ],
                [
                    "name" => "OAUTH-AUTH-CODESList",
                    "slug" => "oauth-auth-codes.list",
                    "http_method" => "GET",
                    "http_path" => "/oauth-auth-codes"
                ],
                [
                    "name" => "OAUTH-AUTH-CODESView",
                    "slug" => "oauth-auth-codes.view",
                    "http_method" => "GET",
                    "http_path" => "/oauth-auth-codes/*"
                ],
                [
                    "name" => "OAUTH-AUTH-CODESCreate",
                    "slug" => "oauth-auth-codes.create",
                    "http_method" => "POST",
                    "http_path" => "/oauth-auth-codes"
                ],
                [
                    "name" => "OAUTH-AUTH-CODESEdit",
                    "slug" => "oauth-auth-codes.edit",
                    "http_method" => "PUT,PATCH",
                    "http_path" => "/oauth-auth-codes/*"
                ],
                [
                    "name" => "OAUTH-AUTH-CODESDelete",
                    "slug" => "oauth-auth-codes.delete",
                    "http_method" => "DELETE",
                    "http_path" => "/oauth-auth-codes/*"
                ],
                [
                    "name" => "OAUTH-AUTH-CODESExport",
                    "slug" => "oauth-auth-codes.export",
                    "http_method" => "GET",
                    "http_path" => ""
                ],
                [
                    "name" => "OAUTH-AUTH-CODESFilter",
                    "slug" => "oauth-auth-codes.filter",
                    "http_method" => "GET",
                    "http_path" => "/oauth-auth-codes"
                ],
                [
                    "name" => "OAUTH-CLIENTSList",
                    "slug" => "oauth-clients.list",
                    "http_method" => "GET",
                    "http_path" => "/oauth-clients"
                ],
                [
                    "name" => "OAUTH-CLIENTSView",
                    "slug" => "oauth-clients.view",
                    "http_method" => "GET",
                    "http_path" => "/oauth-clients/*"
                ],
                [
                    "name" => "OAUTH-CLIENTSCreate",
                    "slug" => "oauth-clients.create",
                    "http_method" => "POST",
                    "http_path" => "/oauth-clients"
                ],
                [
                    "name" => "OAUTH-CLIENTSEdit",
                    "slug" => "oauth-clients.edit",
                    "http_method" => "PUT,PATCH",
                    "http_path" => "/oauth-clients/*"
                ],
                [
                    "name" => "OAUTH-CLIENTSDelete",
                    "slug" => "oauth-clients.delete",
                    "http_method" => "DELETE",
                    "http_path" => "/oauth-clients/*"
                ],
                [
                    "name" => "OAUTH-CLIENTSExport",
                    "slug" => "oauth-clients.export",
                    "http_method" => "GET",
                    "http_path" => ""
                ],
                [
                    "name" => "OAUTH-CLIENTSFilter",
                    "slug" => "oauth-clients.filter",
                    "http_method" => "GET",
                    "http_path" => "/oauth-clients"
                ],
                [
                    "name" => "OAUTH-PERSONAL-ACCESS-CLIENTSList",
                    "slug" => "oauth-personal-access-clients.list",
                    "http_method" => "GET",
                    "http_path" => "/oauth-personal-access-clients"
                ],
                [
                    "name" => "OAUTH-PERSONAL-ACCESS-CLIENTSView",
                    "slug" => "oauth-personal-access-clients.view",
                    "http_method" => "GET",
                    "http_path" => "/oauth-personal-access-clients/*"
                ],
                [
                    "name" => "OAUTH-PERSONAL-ACCESS-CLIENTSCreate",
                    "slug" => "oauth-personal-access-clients.create",
                    "http_method" => "POST",
                    "http_path" => "/oauth-personal-access-clients"
                ],
                [
                    "name" => "OAUTH-PERSONAL-ACCESS-CLIENTSEdit",
                    "slug" => "oauth-personal-access-clients.edit",
                    "http_method" => "PUT,PATCH",
                    "http_path" => "/oauth-personal-access-clients/*"
                ],
                [
                    "name" => "OAUTH-PERSONAL-ACCESS-CLIENTSDelete",
                    "slug" => "oauth-personal-access-clients.delete",
                    "http_method" => "DELETE",
                    "http_path" => "/oauth-personal-access-clients/*"
                ],
                [
                    "name" => "OAUTH-PERSONAL-ACCESS-CLIENTSExport",
                    "slug" => "oauth-personal-access-clients.export",
                    "http_method" => "GET",
                    "http_path" => ""
                ],
                [
                    "name" => "OAUTH-PERSONAL-ACCESS-CLIENTSFilter",
                    "slug" => "oauth-personal-access-clients.filter",
                    "http_method" => "GET",
                    "http_path" => "/oauth-personal-access-clients"
                ],
                [
                    "name" => "OAUTH-REFRESH-TOKENSList",
                    "slug" => "oauth-refresh-tokens.list",
                    "http_method" => "GET",
                    "http_path" => "/oauth-refresh-tokens"
                ],
                [
                    "name" => "OAUTH-REFRESH-TOKENSView",
                    "slug" => "oauth-refresh-tokens.view",
                    "http_method" => "GET",
                    "http_path" => "/oauth-refresh-tokens/*"
                ],
                [
                    "name" => "OAUTH-REFRESH-TOKENSCreate",
                    "slug" => "oauth-refresh-tokens.create",
                    "http_method" => "POST",
                    "http_path" => "/oauth-refresh-tokens"
                ],
                [
                    "name" => "OAUTH-REFRESH-TOKENSEdit",
                    "slug" => "oauth-refresh-tokens.edit",
                    "http_method" => "PUT,PATCH",
                    "http_path" => "/oauth-refresh-tokens/*"
                ],
                [
                    "name" => "OAUTH-REFRESH-TOKENSDelete",
                    "slug" => "oauth-refresh-tokens.delete",
                    "http_method" => "DELETE",
                    "http_path" => "/oauth-refresh-tokens/*"
                ],
                [
                    "name" => "OAUTH-REFRESH-TOKENSExport",
                    "slug" => "oauth-refresh-tokens.export",
                    "http_method" => "GET",
                    "http_path" => ""
                ],
                [
                    "name" => "OAUTH-REFRESH-TOKENSFilter",
                    "slug" => "oauth-refresh-tokens.filter",
                    "http_method" => "GET",
                    "http_path" => "/oauth-refresh-tokens"
                ],
                [
                    "name" => "PASSWORD-RESET-TOKENSList",
                    "slug" => "password-reset-tokens.list",
                    "http_method" => "GET",
                    "http_path" => "/password-reset-tokens"
                ],
                [
                    "name" => "PASSWORD-RESET-TOKENSView",
                    "slug" => "password-reset-tokens.view",
                    "http_method" => "GET",
                    "http_path" => "/password-reset-tokens/*"
                ],
                [
                    "name" => "PASSWORD-RESET-TOKENSCreate",
                    "slug" => "password-reset-tokens.create",
                    "http_method" => "POST",
                    "http_path" => "/password-reset-tokens"
                ],
                [
                    "name" => "PASSWORD-RESET-TOKENSEdit",
                    "slug" => "password-reset-tokens.edit",
                    "http_method" => "PUT,PATCH",
                    "http_path" => "/password-reset-tokens/*"
                ],
                [
                    "name" => "PASSWORD-RESET-TOKENSDelete",
                    "slug" => "password-reset-tokens.delete",
                    "http_method" => "DELETE",
                    "http_path" => "/password-reset-tokens/*"
                ],
                [
                    "name" => "PASSWORD-RESET-TOKENSExport",
                    "slug" => "password-reset-tokens.export",
                    "http_method" => "GET",
                    "http_path" => ""
                ],
                [
                    "name" => "PASSWORD-RESET-TOKENSFilter",
                    "slug" => "password-reset-tokens.filter",
                    "http_method" => "GET",
                    "http_path" => "/password-reset-tokens"
                ],
                [
                    "name" => "PERSONAL-ACCESS-TOKENSList",
                    "slug" => "personal-access-tokens.list",
                    "http_method" => "GET",
                    "http_path" => "/personal-access-tokens"
                ],
                [
                    "name" => "PERSONAL-ACCESS-TOKENSView",
                    "slug" => "personal-access-tokens.view",
                    "http_method" => "GET",
                    "http_path" => "/personal-access-tokens/*"
                ],
                [
                    "name" => "PERSONAL-ACCESS-TOKENSCreate",
                    "slug" => "personal-access-tokens.create",
                    "http_method" => "POST",
                    "http_path" => "/personal-access-tokens"
                ],
                [
                    "name" => "PERSONAL-ACCESS-TOKENSEdit",
                    "slug" => "personal-access-tokens.edit",
                    "http_method" => "PUT,PATCH",
                    "http_path" => "/personal-access-tokens/*"
                ],
                [
                    "name" => "PERSONAL-ACCESS-TOKENSDelete",
                    "slug" => "personal-access-tokens.delete",
                    "http_method" => "DELETE",
                    "http_path" => "/personal-access-tokens/*"
                ],
                [
                    "name" => "PERSONAL-ACCESS-TOKENSExport",
                    "slug" => "personal-access-tokens.export",
                    "http_method" => "GET",
                    "http_path" => ""
                ],
                [
                    "name" => "PERSONAL-ACCESS-TOKENSFilter",
                    "slug" => "personal-access-tokens.filter",
                    "http_method" => "GET",
                    "http_path" => "/personal-access-tokens"
                ],
                [
                    "name" => "TRANSACTIONSList",
                    "slug" => "transactions.list",
                    "http_method" => "GET",
                    "http_path" => "/transactions"
                ],
                [
                    "name" => "TRANSACTIONSView",
                    "slug" => "transactions.view",
                    "http_method" => "GET",
                    "http_path" => "/transactions/*"
                ],
                [
                    "name" => "TRANSACTIONSCreate",
                    "slug" => "transactions.create",
                    "http_method" => "POST",
                    "http_path" => "/transactions"
                ],
                [
                    "name" => "TRANSACTIONSEdit",
                    "slug" => "transactions.edit",
                    "http_method" => "PUT,PATCH",
                    "http_path" => "/transactions/*"
                ],
                [
                    "name" => "TRANSACTIONSDelete",
                    "slug" => "transactions.delete",
                    "http_method" => "DELETE",
                    "http_path" => "/transactions/*"
                ],
                [
                    "name" => "TRANSACTIONSExport",
                    "slug" => "transactions.export",
                    "http_method" => "GET",
                    "http_path" => ""
                ],
                [
                    "name" => "TRANSACTIONSFilter",
                    "slug" => "transactions.filter",
                    "http_method" => "GET",
                    "http_path" => "/transactions"
                ],
                [
                    "name" => "USERSList",
                    "slug" => "users.list",
                    "http_method" => "GET",
                    "http_path" => "/users"
                ],
                [
                    "name" => "USERSView",
                    "slug" => "users.view",
                    "http_method" => "GET",
                    "http_path" => "/users/*"
                ],
                [
                    "name" => "USERSCreate",
                    "slug" => "users.create",
                    "http_method" => "POST",
                    "http_path" => "/users"
                ],
                [
                    "name" => "USERSEdit",
                    "slug" => "users.edit",
                    "http_method" => "PUT,PATCH",
                    "http_path" => "/users/*"
                ],
                [
                    "name" => "USERSDelete",
                    "slug" => "users.delete",
                    "http_method" => "DELETE",
                    "http_path" => "/users/*"
                ],
                [
                    "name" => "USERSExport",
                    "slug" => "users.export",
                    "http_method" => "GET",
                    "http_path" => ""
                ],
                [
                    "name" => "USERSFilter",
                    "slug" => "users.filter",
                    "http_method" => "GET",
                    "http_path" => "/users"
                ]
            ]
        );

        \Encore\Admin\Auth\Database\Role::truncate();
        \Encore\Admin\Auth\Database\Role::insert(
            [

            ]
        );

        // pivot tables
        DB::table('admin_role_menu')->truncate();
        DB::table('admin_role_menu')->insert(
            [

            ]
        );

        DB::table('admin_role_permissions')->truncate();
        DB::table('admin_role_permissions')->insert(
            [

            ]
        );

        // finish
    }
}
