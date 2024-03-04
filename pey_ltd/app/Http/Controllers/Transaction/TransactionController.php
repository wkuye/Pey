<?php
namespace App\Http\Controllers\Transaction;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Transaction;
use App\Models\User;
use Illuminate\Support\Carbon;
use Illuminate\Validation\ValidationException;
class TransactionController extends Controller{


public function transfer(Request $request, $userid)
{

    try {
        $request->validate([
            'recipient_id' => 'required|exists:users,id',
            'amount' => 'required|numeric|min:0.01', 
            'type'=>'required|string|',
           'description'=>'',
            // Assuming the amount is a positive number
        ]);
    
        // Get the authenticated user
        $sender = User::find($userid);
    
        // Check if the sender has sufficient balance
        if ($sender->balance < $request->amount) {
            return response()->json(['error' => 'Insufficient balance'], 400);
        }
    
        // Create a transfer record
        $transfer = new Transaction();
        $transfer->user_id = $sender->id;
        $transfer->recipient_id = $request->recipient_id;
        $transfer->amount = $request->amount;
        $transfer->type= $request->type;
        $transfer->description= $request->description;
        $transfer->save();
    
        // Update sender and recipient balances (You should define methods to handle this in the User model)
        $sender->decrement('balance', $request->amount);
        $recipient = User::find($request->recipient_id);
        $recipient->increment('balance', $request->amount);
    $allTransaction= Transaction::all();
        return response()->json(['message' => 'Transfer successful', 'Transactions'=>$allTransaction ,'user'=>$sender ], 200);
    } catch (ValidationException $e) {
        $validationErrors = $e->validator->errors()->toArray();

        // Return JSON response with validation errors
        return response()->json(['error' => 'Validation failed', 'errors' => $validationErrors], 422);
    }
    // Validate the request data
   
}
public function getTransaction($userId,){
    
   

    $transactions = Transaction::where(function ($query) use ($userId,) {
        $query->where('user_id', $userId);
      
    })
        ->orWhere(function ($query) use ($userId, ) {
            $query
                ->where('recipient_id', $userId);
        })
        ->get();

    return response()->json(['transactions' => $transactions]);
}



public function getTransactionByDate($userId, $dateRange)
{
    $now = date('Y-m-d H:i:s');
    $startOfWeek = date('Y-m-d H:i:s', strtotime('-1 week', strtotime($now)));
    $startOfMonth = date('Y-m-d H:i:s', strtotime('-1 month', strtotime($now)));
    $startOfYear = date('Y-m-d H:i:s', strtotime('-1 year', strtotime($now)));

    switch ($dateRange) {
        case 'week':
            $transactions = Transaction::where(function ($query) use ($userId) {
                $query->where('user_id', $userId)
                    ->orWhere('recipient_id', $userId);
            })
                ->where('created_at', '>=', $startOfWeek)
                ->get();
            break;
        case 'month':
            $transactions = Transaction::where(function ($query) use ($userId) {
                $query->where('user_id', $userId)
                    ->orWhere('recipient_id', $userId);
            })
                ->where('created_at', '>=', $startOfMonth)
                ->get();
            break;
        case 'year':
            $transactions = Transaction::where(function ($query) use ($userId) {
                $query->where('user_id', $userId)
                    ->orWhere('recipient_id', $userId);
            })
                ->where('created_at', '>=', $startOfYear)
                ->get();
            break;
        default:
            $transactions = Transaction::where(function ($query) use ($userId) {
                $query->where('user_id', $userId)
                    ->orWhere('recipient_id', $userId);
            })
                ->get();
            break;
    }

    return response()->json(['transactions' => $transactions, 'week' => $startOfWeek]);
}


}