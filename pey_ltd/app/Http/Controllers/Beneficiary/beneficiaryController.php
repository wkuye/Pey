<?php
namespace App\Http\Controllers\Beneficiary;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Beneficiary;
class BeneficiaryController extends Controller{
    public function getBeneficiary(Request $request,$user){
  // Assuming 'name' is the key for the username in the request


  $email= $request->input('email');
  
    $beneficiaryUser= User::where('email',$email)->first();
     
   $currentUser = User::find($user);
   

   // Check if the provided email matches the authenticated user's email
   if ($email === $currentUser->email) {
       return response()->json(['message' => 'No data to show for your own email.'], 404);
   }

   if($beneficiaryUser){
    return response()->json(['name'=>$beneficiaryUser->name, 'last_name'=>$beneficiaryUser->last_name], 200);
   }else{
    return response()->json(['message'=>'user not found'],404);
   }
    }


    public function search($userID, Request $request)
    {
        $user = User::find($userID);
    
        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }
    
        $searchTerm = $request->input('query');
    
        $beneficiaries = $user->beneficiaries()
            ->where(function ($query) use ($searchTerm) {
                $query->where('name', 'like', "%$searchTerm%")
                    ->orWhere('last_name', 'like', "%$searchTerm%")
                    ->orWhere('email', 'like', "%$searchTerm%");
            })
            ->get();
    
        return response()->json(['beneficiaries' => $beneficiaries]);
    }

 public function addBeneficiary(Request $request, $userId){

   
    $user = User::findOrFail($userId);
    $email= $request->input('email');
    $beneficiaryUser= User::where('email',$email)->first();
$ben= Beneficiary::all();

    $existingBeneficiary = $user->beneficiaries()->where('email', $email)
  
    ->first();

if ($existingBeneficiary) {
// Beneficiary already exists for the user
return response()->json([
'error' => 'Beneficiary already added',
'message' => 'A beneficiary with the provided email already exists for the authenticated user.',
'beneficiary' => $ben
], 400); // HTTP 400 Bad Request status code
}
    // Replace 1 with the user ID
    if ($beneficiaryUser) {
        $beneficiary = $user->beneficiaries()->create([
         'name'=>$beneficiaryUser->name,
         'email'=>$beneficiaryUser->email,
         'last_name'=>$beneficiaryUser->last_name,
            'image'=>$beneficiaryUser->image,
            'ben_id'=>$beneficiaryUser->id,
            // Add other beneficiary fields as needed
        ]);
        return response()->json(['message' => 'User found', 'user' => $beneficiary], 200);
    } else{
        return response()->json(['error' => 'User not found', ], 404);   
    }

// Retrieve beneficiaries for a user

 }

 public function delete(Request $request)
 {

   // Delete all beneficiaries
   Beneficiary::truncate();

$ben= Beneficiary::all();
   // Optionally, you can return a response or perform other actions

// Return a success message
return response()->json(['message' => 'Beneficiary deleted successfully', 'data'=>$ben], 200);
 }
 public function getallBeneficiaries($userID){
$user= User::find($userID);
$ben= $user->beneficiaries()->get();
return response()->json(['beneficiary'=>$ben]);
 }
}