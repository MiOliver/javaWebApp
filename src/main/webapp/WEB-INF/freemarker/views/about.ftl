<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<#--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">-->
<head>
    <title>Oliver's Blogs</title>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
        body {
            background-color: #CCC;
        }
    </style>
</head>
<body>
<div class="container">
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
                <li class="active"><a href="/about">关于</a></li>
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


    <div class="row" style="background-color: white;border-radius:5px;line-height: 30px;padding: 20px;  ">

        <div class="col-xs-11 col-md-10">
            <address>
                <h3>个人简介</h3>
                <hr>
                <img src="/resources/img/me.jpg"><br><br>
                <strong>Oliver</strong>
                <p>
                    目前在一家知名互联网公司从事java后台和Android App研发工作！
                </p>

            </address>
            <address>
                <strong>个人爱好</strong><br>
                <p>热爱篮球、喜欢登山、跑步、骑行、户外野营</p>

            </address>

            <address>
                <strong> 微博账号</strong><br>
                <a href="http://weibo.com/ningvip/home"><img src="/resources/img/weibo.png" width="20" height="20">&nbsp;猫仔仔</a>

                <strong>Motto</strong><br>
                <img src=" http://cdn.duitang.com/uploads/item/201508/03/20150803194035_haEKc.thumb.700_0.jpeg"
                     width="200" height="300"><br><br>

            </address>

            <address>
                <strong>QQ:</strong><br>
                <a href="#"><img src="/resources/img/qq.png" width="20" height="20">&nbsp;1066114096</a>
            </address>

            <address>
                <strong>Email:</strong><br>
                <a href="mailto:#">lxnlhr@163.com</a>
            </address>

            <#if (coms.dashboard.ips?size>0) >
            <#assign dashboard_addr=""/>
                <#list coms.dashboard.ips as ip>
                    <#if ip_has_next>
                        ${dashboard_addr}=${dashboard_addr}+${ip}+":18087,";
                    <#else>
                        ${dashboard_addr}=${dashboard_addr}+${ip}+":18087";
                    </#if>
                </#list>
            </#if>



        </div>

    </div>
</div>

</body>
</html>