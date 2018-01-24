@extends('layouts.admin-master')

@section('title')
    Admin area
@endsection

@section('styles')
	<link rel="stylesheet" href="{{ asset('/src/css/form.css') }}" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
@endsection

@section('content')
    <div class="container">
		<div class="row">
			<div class="col-md-6">
				@include('includes.info-box')
			</div>
		</div>
		<br>
	    <div class="row">
	        <div class="col-md-6">

	            <div class="panel panel-primary">
	                <div class="panel-heading">
		                <h3 class="panel-title">Login</h3>
	                </div>
	                <div class="panel-body">
	                    <form class="form-horizontal" role="form" method="POST" action="{{ route('admin.login') }}">
	                        {{ csrf_field() }}

	                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
	                            <label for="email" class="col-md-4 control-label">E-Mail Address</label>

	                            <div class="col-md-6">
	                                <input id="email" type="email" class="form-control" name="email" value="{{ Request::old('email') }}" required autofocus {{ $errors->has('email') ? 'class=has-error' : '' }} >

	                                @if ($errors->has('email'))
	                                    <span class="help-block">
	                                        <strong>{{ $errors->first('email') }}</strong>
	                                    </span>
	                                @endif
	                            </div>
	                        </div>

	                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
	                            <label for="password" class="col-md-4 control-label">Password</label>

	                            <div class="col-md-6">
	                                <input id="password" type="password" class="form-control" name="password" required {{ $errors->has('password') ? 'class=has-error' : '' }}>

	                                @if ($errors->has('password'))
	                                    <span class="help-block">
	                                        <strong>{{ $errors->first('password') }}</strong>
	                                    </span>
	                                @endif
	                            </div>
	                        </div>

							<div class="form-group">
								<div class="col-md-6 col-md-offset-4">
									<div class="checkbox">
										<label>
											<input type="checkbox" name="remember" {{ old('remember') ? 'checked' : ''}}> Remember Me
										</label>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-8 col-md-offset-4">
									<button type="submit" class="btn btn-primary">
										Login
									</button>

									<a class="btn btn-link" href="{{ url('/password/reset') }}">
										Forgot Your Password?
									</a>
								</div>
							</div>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
@endsection

@section('scripts')
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
@endsection

