<?php


namespace App\Admin\Controllers;

use App\Admin\Controllers\Controller;
use App\Models\Beneficiary;
use Encore\Admin\Layout\Content;
use App\Models\User;
use Illuminate\Support\Facades\Log;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Show;
use Encore\Admin\Form;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Hash;
use Illuminate\Support\MessageBag;
class AdminUserController extends Controller
{
    public function index(Content $content)
    {
        Log::info('Entering index method');
        return $content
            ->header('MyUsers')
            ->description('Manage users')
            ->body($this->grid());
    }

    protected function grid()
    {
        $grid = new Grid(new User);

        $grid->column('id', __('ID'))->sortable();
        $grid->column('created_at', __('Created at'));
        $grid->column('email', __('User_Email')); 
        $grid->column('image', __('Image')); 
        $grid->column('name', __('First_name'));
        $grid->column('last_name',__('Last_name'));
        $grid->column('password', __('User_password'));
        $grid->column('balance', __('User_amount'));
    $grid->column('expenses',__('Expenses'));
      
        $grid->actions(function ($actions) {
            $userId = $actions->getKey();

           
            $editUrl = url("/myUsers/{$userId}/edit");

            // Add an "Edit" link to the actions column
            $actions->append("<a href='{$editUrl}'>Edit</a>");
     
        });

        return $grid;
    }

    public function edit($id, Content $content)
    {
      
       $user= User::find($id);

        return $content
            ->header('Edit User')
            ->description('Edit user details')
            ->body($this->form()->edit($id));
    }

       // Update User
       public function update($id, Request $request)
       {
           // Fetch the user based on the provided ID
           $user = User::findOrFail($id);
     
   
           // Validate the request data
           $request->validate([
               'email' => 'required|email|unique:users,email,' . $user->id,
               'name' => 'required|string|max:255',
               'password' => 'nullable|string|min:8',
               'balance' => 'required|numeric',
               'expenses'=>'required|numeric',
               'image' => 'image|mimes:jpeg,png,jpg,gif|max:3048',
           ]);
   
           // Update the user data
           $user->email = $request->input('email');
           $user->name = $request->input('name');
           $beneficiary=Beneficiary::where('email', $user->email)->first();
           if ($request->filled('password')) {
               $user->password = bcrypt($request->input('password')); // Hash the password if provided
           }
           $user->balance = $request->input('balance');
           $user->expenses= $request->input('expenses');
           if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $image->storeAs('public/images', $imageName); // Store image in storage
    
            // Save image path to user profile_image attribute
         
            $user->image = 'storage/images/' . $imageName; 
   if ($beneficiary !=null) {
    $beneficiary->image= 'storage/images/' . $imageName;  // or any other value
    $beneficiary->save();
   }
                // Assign the image path or value
              

            // Set other attributes and save user
      
        }
           $user->save();

   
           // Redirect back with a success message
           return redirect('admin/myUsers');
       }
       // Define the form
       protected function form()
       {
           $form = new Form(new User());
   
           $form->display('id', 'ID');
           $form->text('email', 'Email')->rules('required|email|unique:users,email');
           $form->text('name', 'Name')->rules('required|string|max:255');
           $form->password('password', 'Password')->rules('nullable|string|min:8');
           $form->decimal('balance', 'Balance')->rules('required|numeric');
           $form->decimal('expenses', 'Expenses')->rules('required|numeric');
           $form->image('image','Image');
           $form->footer(function ($footer) {
            // 去掉`查看`checkbox
            $footer->disableViewCheck();
        
            // 去掉`继续编辑`checkbox
            $footer->disableEditingCheck();
        
            // 去掉`继续创建`checkbox
            $footer->disableCreatingCheck();
        
        });
        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
            $tools->disableView( );
        
        });  
           return $form;
       }
   }