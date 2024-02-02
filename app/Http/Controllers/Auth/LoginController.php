<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;
class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::POSTS;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function logout(Request $request)
    {
        $this->guard()->logout();
        $request->session()->invalidate();
        $request->session()->forget('user_name');
        $request->session()->forget('remember');

        return redirect('/');
    }


    protected function attemptLogin(Request $request)
    {
        $remember = $request->filled('remember');

        if ($this->guard()->attempt($this->credentials($request), $remember)) {
            $this->setRememberMeCookie($request, $remember);
            $user = $this->guard()->user();
            $request->session()->put('user_name', $user->name);
            $request->session()->put('remember', $user->remember_token);
            return true;
        }

        return false;
    }

    protected function setRememberMeCookie(Request $request, $remember)
    {
        if ($remember) {
            $rememberToken = $this->guard()->user()->getRememberToken();
            Cookie::queue('remember_me', $rememberToken, 60 * 24 * 30); // 30 days expiration
        }
    }
}
