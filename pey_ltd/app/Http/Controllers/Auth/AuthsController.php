<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Validation\ValidationException;
class AuthsController extends Controller{

    public function register(Request $request)
    {
        try {
            // Validate and create a new user
            $validatedData = $request->validate([
                'name' => 'required|string|max:255',
                'last_name' => 'required|string|max:255',
         
                'email' => 'required|string|email|unique:users,email',
                'password' => 'required|string|min:8',
            ]);
    
            
        

            $user = User::create(array_merge(
                $validatedData,
                ['password' => Hash::make($request->password)]
            ));

            $token = $user->createToken('authToken')->accessToken;
    
            return response()->json(['message' => 'User registered successfully', 'token'=> $token, 'user'=> $user]);
        } catch (ValidationException $e) {
            $validationErrors = $e->validator->errors()->toArray();

            // Return JSON response with validation errors
            return response()->json(['error' => 'Validation failed', 'errors' => $validationErrors], 422);
    
        } catch (\Exception $e) {
            // Log the exception with additional details
            \Log::error('Exception: ' . $e->getMessage(), [
                'trace' => $e->getTrace(),
                'file' => $e->getFile(),
                'line' => $e->getLine(),
            ]);
    
            // Return a generic error response
            return response()->json(['error' => 'Error creating user', 'message' => $e->getMessage()], 500);
        }
    }

    public function login(Request $request)
    {
        try {
            $request->validate([
                'email' => 'required|string|email|',
               
                'password' => 'required',
            ]
        );
    
            $credentials = $request->only('email', 'password');
    
            if (Auth::attempt($credentials)) {
                $user = Auth::user();
          
    
                
                $token = $user->createToken('authToken')->accessToken;
    
                return response()->json(['token' => $token, 'user' => $user, 'credential'=> $credentials], );
            }
        } catch (ValidationException $e) {
            $validationErrors = $e->validator->errors()->toArray();

            // Return JSON response with validation errors
            return response()->json(['error' => 'Validation failed', 'errors' => $validationErrors], 422);
    
        }


          // Check if the email is incorrect
          if (!User::where('email', $credentials['email'])->exists()) {
            throw ValidationException::withMessages([
                'email' => ['Invalid email address'],
            ]);
        }

        // If the email is correct, assume the password is incorrect
        throw ValidationException::withMessages([
            'password' => ['Invalid password'],
        ]);
    }

    public function forgottenPassword(Request $request){

            //code...
            $request->validate(['email'=>'required|email']);
        $credentials = $request->only('email');  

        if (User::where('email', $credentials['email'])->exists()) {
         return response()->json(['email'=> $credentials], 200);
        } else{
            throw ValidationException::withMessages([
                'email' => ['Invalid email address'],
            ]);
        }
       
       
        }

        public function getUsers(Request $request){

            //code...
            $request->validate(['user_id' => 'required|exists:users,id',]);
        $credentials = $request->input('user_id');  
     
            $user = User::findOrFail($credentials);
            
         return response()->json(['user'=> $user], 200);
        
           
        
       
       
        }

        public function resetPassword(Request $request){
            try {
                $request->validate(['email'=>'required|email']);
                $credentials = $request->only('email');  
                $request->validate([ 'password' => 'required|min:8',
                'password_confirmation' => 'required|same:password',]);
                $Passcredentials = $request->only('password');
                $password = Hash::make($Passcredentials['password']);
                User::where('email', $credentials['email'])  
                ->update(['password' => $password]);
              
                return response()->json(['password'=> $Passcredentials,],200);
             
            } catch (ValidationException $e) {
                $validationErrors = $e->validator->errors()->toArray();

            // Return JSON response with validation errors
            return response()->json(['error' => 'Validation failed', 'errors' => $validationErrors], 422);
    
            }


        }
       
      


    }