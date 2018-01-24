<?php

namespace App\Http\Controllers;
use App\User;
use App\Post;
use App\ContactMessage;
use Illuminate\Support\Facades\Auth;

use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function getIndex()
    {
        $posts = Post::orderBy('created_at', 'desc')->take(3)->get();
        $contact_messages = ContactMessage::orderBy('created_at', 'desc')->take(3)->get();

        return view('admin.index', ['posts' => $posts, 'contact_messages' => $contact_messages]);
    }

    public function getRegister()
    {
    	return view('admin.register');
    }

    public function postRegister(Request $request)
    {
    	$this->validate($request, [
    		'email' => 'email|required|unique:users',
    		'password' => 'required|min:4',
    	]);

    	$user = new User();
    	$user->email = $request->input('email');
    	$user->password = bcrypt($request->input('password'));
    	$user->save();

    	Auth::login($user);

    	return redirect()->route('admin.index');
    }

    public function getLogin() 
    {
        return view('admin.login');
    }

    public function postLogin(Request $request)
    {
        $this->validate($request, [
            'email' => 'required|email',
            'password' => 'required'
        ]);

        $email = $request->input('email');
        $password = $request->input('password');

        if (Auth::attempt(['email' => $email, 'password' => $password], $request->has('remember'))) {
            return redirect()->route('admin.index');
        }
        return redirect()->back()->with(['fail' => 'Could not log in']);
    }

    public function getLogout()
    {
        Auth::logout();
        return redirect()->route('blog.index');
    }
}
