<?php
namespace app\Admin\Controllers;
use App\Admin\Controllers\Controller;
use App\Models\SubCategory;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
Use Encore\Admin\Widgets\Table;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Encore\Admin\Form;
class SubCategoryController extends Controller{
    public function index(Content $content)
    {
        Log::info('Entering index method');
        return $content
            ->header('SubCategory')
            ->description('Manage Items')
            ->body($this->grid());
    }

    protected function grid()
    {
      
        $grid = new Grid(new SubCategory);

        $grid->column('id', __('ID'))->sortable();
        $grid->column('created_at', __('Created at'));
        $grid->column('description_one', __('Description_One'));
        $grid->column('description_two', __('Description_Two'));
        $grid->column('image', __('Image')); 
        $grid->column('name', __('Name'))->expand(function ($model){
            $comments = $model->items()->take(10)->get()->map(function ($comment) {
                return $comment->only(['sub_category_id', 'name', 'price', 'description', 'image']);
            });
        
            return new Table(['ID', 'content', 'price', 'description','image' ], $comments->toArray());
        });
    
      
        $grid->actions(function ($actions) {
            $Id = $actions->getKey();

           
            $editUrl = url("/categories/{$Id}/edit");

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
        $form = new Form(new SubCategory);

        $form->display('id', 'ID');

        $form->text('name', 'Name')->rules('required|string|max:255');
        $form->text('description_one', 'DescriptionOne')->rules('required|string|max:255');
        $form->text('description_two', 'DescriptionTwo')->rules('required|string|max:255');
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
    protected function update($id , Request $request){
$category= SubCategory::find($id);
$request->validate([
   
    'name' => 'required|string|max:255',
    'description_one' => 'required|string|max:255',
    'description_two' => 'required|string|max:255',
    'image' => 'image|mimes:jpeg,png,jpg,gif|max:3048',
]);
$category->name=$request->input('name');
$category->description_one=$request->input('description_one');
$category->description_two=$request->input('description_two');
if ($request->hasFile('image')) {
    $image = $request->file('image');
    $imageName = time() . '.' . $image->getClientOriginalExtension();
    $image->storeAs('public/images', $imageName); // Store image in storage

    // Save image path to user profile_image attribute
 
    $category->image = 'storage/images/' . $imageName; 

        // Assign the image path or value
      

    // Set other attributes and save user

}
   $category->save();
   return redirect('admin/subcategory');
    }

    protected function creationPage( Content $content)
    {
  

        return $content
            ->header('Categor Creation')
            ->description('Create  your Category')
            ->body($this->create());
    }

    protected function create(){
        $form= new  Form(new SubCategory);
        $form->text('name', 'Name')->rules('required|string|max:255');
        $form->text('description_one', 'DescriptionOne')->rules('required|string|max:255');
        $form->text('description_two', 'DescriptionTwo')->rules('required|string|max:255');
        $form->image('image','Image');
        $form->setAction(url('/admin/subcategory/submit'));

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
    protected function submitCreation(Request $request){
        $request->validate([
            'name' => 'required|string|max:255',
            'description_one' => 'required|string|max:255',
            'description_two' => 'required|string|max:255',
            'image' => 'image|mimes:jpeg,png,jpg,gif|max:3048',
            // Add validation rules for other attributes if needed
        ]);
    
        // Retrieve all form input data
        $categoryData = $request->all();
    
        // Handle image upload
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('images', 'public');
            $categoryData['image'] = $imagePath;
        }
    
        // Create a new Category instance and fill it with the form data
        $subcategory = new SubCategory;
        $subcategory->fill($categoryData);
    
        // Save the category to the database
        $subcategory->save();
    
        return redirect('admin/subcategory');
    }
    
}