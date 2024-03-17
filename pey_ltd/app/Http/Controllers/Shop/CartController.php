<?php
namespace App\Http\Controllers\Shop;
use App\Models\AddCartel;
use App\Http\Controllers\Controller;

use App\Models\carts;
use App\Models\Item;
use Illuminate\Http\Request;
class CartController extends Controller{
    public function addItem(Request $request, $userId)
    {
 
        $productId = $request->input('product_id');
        $quantity = $request->input('quantity');
        $popular = $request->input('popular_id');
        // Check if the same item exists in the user's cart
        $cartItem = carts::where('product_id', $productId)
                        
                        ->first();
                        $Item= Item::find($productId);

        if ($cartItem) {
            // If the item exists, update the quantity
            $cartItem->quantity += $quantity;
            $cartItem->save();
        } else {
            // If the item doesn't exist, create a new entry
         $cartItem=  carts::create([
                'user_id' => $userId,
                'product_id' => $productId,
                'quantity' => $quantity,
                'popular_id'=> $popular
         ]);
        }
        return response()->json(['cart'=>$cartItem,],200);
        
    }
}