<?php
namespace App\Admin\Controllers;
use App\Models\Transaction;
use Illuminate\Support\Facades\Log;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
class AdminTransactions extends Controller
{
    public function index(Content $content)
    {
        Log::info('Entering index method');
        return $content
            ->header('Transactions')
            ->description('Manage transactions')
            ->body($this->grid());
    }

    protected function grid()
    {
        $grid = new Grid(new Transaction);

        $grid->column('id', __('ID'))->sortable();
        $grid->column('user_id', __('UserID'));
        $grid->column('recipient_id', __('RecipientID')); 
        $grid->column('amount', __('Amount')); 
        $grid->column('type', __('Type'));
        $grid->column('description',__('Description'));
        $grid->column('created_at', __('Created at'));
      
        $grid->actions(function ($actions) {
            $userId = $actions->getKey();

           
            $editUrl = url("/myUsers/{$userId}/edit");

            // Add an "Edit" link to the actions column
            $actions->append("<a href='{$editUrl}'>Edit</a>");
     
        });

        return $grid;
    }
}