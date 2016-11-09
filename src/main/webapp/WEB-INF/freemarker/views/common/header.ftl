<script type="text/javascript">
    /*menu handler*/
    $(function(){
        function stripTrailingSlash(str) {
            if(str.substr(-1) == '/') {
                return str.substr(0, str.length - 1);
            }
            return str;
        }

        var url = window.location.pathname;
        console.log(url);
        var activePage = stripTrailingSlash(url);

        $('.nav li a').each(function(){
            var currentPage = stripTrailingSlash($(this).attr('href'));

            if (activePage == currentPage) {
                console.log(true);
                $(this).parent().addClass('active');
            }
        });
    });
</script>
<h1>Keep calm and Carry on</h1>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">
                <img alt="Brand" src="/resources/img/Dolphin.png" width="25" height="25">
            </a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="/index">首页</a></li>
            <li><a href="/life">生活</a></li>
            <li><a href="/timeline">时间轴</a></li>
            <li><a href="/about">关于</a></li>
        <@shiro.user>
            <li><a href="/manage">管理</a></li>
        </@shiro.user>
        </ul>

        <ul class="nav navbar-nav navbar-right">
        <@shiro.user>
            <li><a href="#"><span class="glyphicon glyphicon-user">&nbsp;<@shiro.principal/></span> </a></li>
            <li><a href="/logout">注销</a></li>
        </@shiro.user>
        <@shiro.guest>
            <li><a href="/login"><span class="glyphicon glyphicon-user">&nbsp;游客</span> </a></li>
        </@shiro.guest>

        </ul>
    </div>

</nav>