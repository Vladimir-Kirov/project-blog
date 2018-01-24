@extends('layouts.admin-master')

@section('title')
    Admin area
@endsection

@section('styles')
    <link rel="stylesheet" href="{{ asset('src/css/form.css') }}">
@endsection

@section('content')
    <div class="container">
        @include('includes.info-box')
        <form action="{{ route('admin.blog.post.create') }}" method="POST">
            {{ csrf_field() }}
            <div class="input-group">
                <label for="title">Title</label>
                <input type="text" name="title" id="title" {{ $errors->has('title') ? 'class=has-error' : '' }} value="{{ Request::old('title') }}" />
            </div>
            <div class="input-group">
                <label for="author">Author</label>
                <input type="text" name="author" id="author" {{ $errors->has('author') ? 'class=has-error' : '' }} value="{{ Request::old('author') }}" />
            </div>
            <div class="input-group">
                <label for="category_select">Add Categories</label>
                <select name="category_select" id="category_select">
                    @foreach($categories as $category)
                        <option value="{{ $category->id }}">{{ $category->name }}</option>
                    @endforeach
                </select>
                <button type="button" class="btn">Add Category</button>
                <div class="added-categories">
                    <ul></ul>
                </div>
                <input type="hidden" name="categories" id="categories">
            </div>
            <div class="input-group">
                <label for="body">Body</label>
                <textarea name="body" id="body" rows="12" {{ $errors->has('body') ? 'class=has-error' : '' }}>{{ Request::old('body') }}</textarea>
            </div>
            <button type="submit" class="btn">Create Post</button>
        </form>
    </div>
@endsection

@section('scripts')
    <script src="{{ asset('src/js/posts.js') }}"></script>
@endsection