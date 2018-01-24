<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ContactMessage;
use App\Events\MessageSent;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\Response; 

class ContactMessageController extends Controller
{
    public function getContactIndex()
    {
        return view('frontend.other.contact');
    }

    public function postSendMessage(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|max:100',
            'email' => 'required|email',
            'subject' => 'required|max:140',
            'message' => 'required|min:10'
        ]);
        
        $message = new ContactMessage;
        $message->sender = $request->input('name');
        $message->email = $request->input('email');
        $message->subject = $request->input('subject');
        $message->body = $request->input('message');
        $message->save();
        Event::fire(new MessageSent($message));
        return redirect()->route('contact')->with(['success' => 'Message successfully sent!']);
    }

    public function getContactMessageIndex() 
    {
        $contact_messages = ContactMessage::orderBy('created_at', 'desc')->paginate(5);
        return view('admin.other.contact_messages', ['contact_messages' => $contact_messages]);
    }

    public function getDeleteMessage($message_id)
    {
        $contact_message = ContactMessage::find($message_id);
        $contact_message->delete();
        return Response::json(['message' => 'Category deleted'], 200);
    }
}
