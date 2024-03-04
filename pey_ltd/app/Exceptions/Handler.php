<?php
namespace App\Exceptions;

use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Illuminate\Http\JsonResponse;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Throwable;

class Handler extends ExceptionHandler
{
    // ... (existing code)

    /**
     * Report or log an exception.
     *
     * @param  \Throwable  $exception
     * @return void
     */
    public function report(Throwable $exception): void
    {
        parent::report($exception);

        // Log the exception with additional details
        \Log::error('Exception: ' . $exception->getMessage(), [
            'trace' => $exception->getTrace(),
            'file' => $exception->getFile(),
            'line' => $exception->getLine(),
        ]);
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Throwable  $exception
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\Response
     */
    public function render($request, Throwable $exception)
    {
        // Handle specific exceptions with custom responses
        if ($exception instanceof \Illuminate\Validation\ValidationException) {
            return response()->json(['error' => 'Validation failed', 'message' => $exception->getMessage()], 422);
        }

        if ($exception instanceof \Illuminate\Database\QueryException) {
            return response()->json(['error' => 'Database error', 'message' => $exception->getMessage()], 500);
        }

        // Handle HTTP exceptions
        if ($exception instanceof HttpException) {
            $statusCode = $exception->getStatusCode();
            return response()->json(['error' => 'HTTP exception', 'message' => $exception->getMessage()], $statusCode);
        }

        // Fallback to the default Laravel error response
        return parent::render($request, $exception);
    }
}
