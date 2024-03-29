<?php
namespace app\Admin\Controllers;
use App\Models\Item;
use App\Models\Popular;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
Use Encore\Admin\Widgets\Table;
use App\Admin\Controllers\Controller;
use Illuminate\Support\Facades\Log;
use Encore\Admin\Form;
use Illuminate\Http\Request;
class PopularItems extends Controller{
    public function index(Content $content)
    {
        Log::info('Entering index method');
        return $content
            ->header('Popular')
            ->description('Manage Items')
            ->body($this->grid());
    }

    protected function grid()
    {
      
        $grid = new Grid(new Popular);
        

        $grid->column('id', __('ID'))->sortable();
        $grid->column('category_id', __('CAT ID'))->sortable();
        $grid->column('created_at', __('Created at'));
        $grid->column('description', __('Description'));
        $grid->column('price', __('Price'));
        $grid->column('discounted_price', __('Discount'));
        $grid->column('image', __('Image')); 
        $grid->column('name', __('Name'));
    
      
        $grid->actions(function ($actions) {
            $Id = $actions->getKey();
           
            $editUrl = url("/popular/{$Id}/edit");

            // Add an "Edit" link to the actions column
            $actions->append("<a href='{$editUrl}'>Edit</a>");
     
        });

        return $grid;
    }

    public function edit($id, Content $content)
    {
  

        return $content
            ->header('Edit Category')
            ->description('Edit Category')
            ->body($this->form()->edit($id));
    }
    protected function form()
    {
        $form = new Form(new Popular);

        $form->display('id', 'ID');

        $form->text('name', 'Name')->rules('required|string|max:255');
        $form->text('category_id', 'CAT ID')->rules('required|string|max:255');;
     
     
        $form->text('description', 'Description')->rules('required|string|max:255');
        $form->decimal('price', 'Price')->rules('required|numeric');
        $form->decimal('discounted_price', 'DiscountPrice');
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

    protected function create(){
        $form= new  Form(new Popular);
        $form->text('category_id', 'CAT ID');
     
        $form->text('name', 'Name')->rules('required|string|max:255');
        $form->text('description', 'Description')->rules('required|string|max:255');
        $form->decimal('price', 'Price')->rules('required|numeric');
        $form->decimal('discounted_price', 'DiscountPrice');
        $form->image('image','Image');
        $form->setAction(url('/admin/popular/submit'));

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

    protected function update($id , Request $request){
        $popular= Popular::find($id);
        $request->validate([
            'name' => 'required|string|max:255',
            'category_id'=>'required|numeric',
            'description'=>'required|string|max:255',
            'price' => 'required|numeric',
            'discounted_price' => 'nullable|numeric',
            'image' => 'image|mimes:jpeg,png,jpg,gif|max:3048',
        ]);
        $itemName= $request->input('name');
        $item= Item::where('name', $itemName)->first();

        $popular->name=$request->input('name');
        $item->name=$request->input('name');
        $popular->category_id=$request->input('category_id');
        $item->category_id=$request->input('category_id');
        $popular->description=$request->input('description');
        $item->description=$request->input('description');
        $popular->price=$request->input('price');
        $item->price=$request->input('price');
        $popular->discounted_price=$request->input('discounted_price');
        $item->discounted_price=$request->input('discounted_price');
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $image->storeAs('public/images', $imageName); // Store image in storage
        
            // Save image path to user profile_image attribute
         
            $popular->image = 'storage/images/' . $imageName; 
            $item->image = 'storage/images/' . $imageName; 
                // Assign the image path or value
              
        
            // Set other attributes and save user
        
        }
           $popular->save();
           $item->save();
           return redirect('admin/popular');
            }

    protected function submitCreation(Request $request){
        $request->validate([
            'name' => 'required|string|max:255',
            'category_id'=>'required|numeric',
            'description'=>'required|string|max:255',
            'price' => 'required|numeric',
            'discounted_price' => 'nullable|numeric',
            'image' => 'image|mimes:jpeg,png,jpg,gif|max:3048',
            // Add validation rules for other attributes if needed
        ]);
    
        // Retrieve all form input data
        $categoryData = $request->all();
    
        // Handle image upload
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('storage/images', 'public');
            $categoryData['image'] = $imagePath;
        }
    
       
        $item = new Item;
        $popular= new Popular;
        $item->fill($categoryData);
        $popular->fill($categoryData);

    

        $item->save();
        $popular->save();
    
        return redirect('admin/popular');
    }
}