<header class="top-nav">
    <nav>
        <ul>
            <li {{ Request::is('admin') ? 'class=active' : '' }}><a href="{{ route('admin.index') }}">Dashboard</a></li>
            <li {{ Request::is('admin/blog/post*') ? 'class=active' : '' }}><a href="{{ route('admin.blog.index') }}">Posts</a></li>
            <li {{ Request::is('admin/blog/category*') || Request::is('admin/blog/categories*') ? 'class=active' : '' }}><a href="{{ route('admin.blog.categories') }}">Categories</a></li>
            <li {{ Request::is('admin/contact*') ? 'class=active' : '' }}><a href="{{ route('admin.contact.index') }}">Contact Messages</a></li>
            @if(!Auth::check())
                <li {{ Request::is('admin/register') ? 'class=active' : '' }}><a href="{{ route('admin.register') }}">Register</a></li>
                <li {{ Request::is('admin/login') ? 'class=active' : '' }}><a href="{{ route('admin.login') }}">Login</a></li>
            @else
                <li><a href="{{ route('admin.logout') }}">Logout</a></li>
            @endif
        </ul>
    </nav>
</header>