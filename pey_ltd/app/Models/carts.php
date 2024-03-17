<?php



namespace App\Models;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class carts extends Model
{
    use HasFactory;

      /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
     'user_id',
     'product_id',
     'popular_id', 
     'quantity'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    
}