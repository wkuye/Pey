<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {
    $router->get('/', 'HomeController@index')->name('home');
    $router->get('/myUsers','AdminUserController@index')->name('user');
    $router->get('/myUsers/{id}/edit', 'AdminUserController@edit')->name('admin.users.edit');
    $router->put('/myUsers/{id}', 'AdminUserController@update')->name('admin.users.update');
$router->get('/categories','shopCategory@index')->name('cat');
$router->get('/categories/{id}/edit', 'shopCategory@edit')->name('admin.category.edit');
$router->put('/categories/{id}', 'shopCategory@update')->name('admin.category.update');
$router->get('/categories/create','shopCategory@creationPage')->name('admin.category.create');
$router->post('/categories/submit', 'shopCategory@submitCreation')->name('admin.category.submit');;
$router->get('/items','Categoryitems@index')->name('items');
$router->get('/items/create','Categoryitems@create')->name('items.create');
$router->post('/items/submit', 'Categoryitems@submitCreation')->name('admin.items.submit');
$router->get('/items/{id}/edit', 'CategoryItems@edit')->name('admin.items.edit');
$router->put('/items/{id}', 'CategoryItems@update')->name('admin.items.update');
$router->get('/subcategory','SubCategoryController@index')->name('cat');
$router->get('/subcategory/{id}/edit', 'SubCategoryController@edit')->name('admin.category.edit');
$router->put('/subcategory/{id}', 'SubCategoryController@update')->name('admin.category.update');
$router->get('/subcategory/create','SubCategoryController@creationPage')->name('admin.subcategory.create');
$router->post('/subcategory/submit', 'SubCategoryController@submitCreation')->name('admin.subcategory.submit');
$router->get('/popular','PopularItems@index')->name('items');
$router->get('/popular/create','PopularItems@create')->name('items.create');
$router->post('/popular/submit', 'PopularItems@submitCreation')->name('admin.popular.submit');
$router->get('/popular/{id}/edit', 'PopularItems@edit')->name('admin.popular.edit');
$router->put('/popular/{id}', 'PopularItems@update')->name('admin.popular.update');
$router->get('/transactions','AdminTransactions@index')->name('transaction');
});
