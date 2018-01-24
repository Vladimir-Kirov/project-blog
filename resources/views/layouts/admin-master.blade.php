<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>@yield('title')</title>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <link rel="stylesheet" href="{{ asset('src/css/admin.css') }}">
        @yield('styles')
    </head>
    <body>
        @include('includes.admin-header')
        @yield('content')
        
        <script type="text/javascript">
            var baseUrl = "{{ asset('/') }}";
        </script>
        @yield('scripts')
    </body>
</html>