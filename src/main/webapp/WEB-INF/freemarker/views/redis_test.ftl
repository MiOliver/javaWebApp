<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">

<#--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">-->
<head>
    <title>Oliver's Blogs</title>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
    <script type="text/javascript" src="/resources/js/jquery.pager.js"></script>
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
<#--<nav class="navbar navbar-inverse">-->
<#--<div class="container-fluid">-->
<#--<div class="navbar-header">-->
<#--<a class="navbar-brand" href="#">-->
<#--<img alt="Brand" src="/resources/img/Dolphin.png" width="25" height="25">-->
<#--</a>-->
<#--</div>-->
<#--<ul class="nav navbar-nav">-->
<#--<li class="active"><a href="/index">首页</a></li>-->
<#--<li><a href="/life">生活</a></li>-->
<#--<li><a href="/about">关于</a></li>-->
<#--<@shiro.user>-->
<#--<li><a href="/manage">管理</a></li>-->
<#--</@shiro.user>-->
<#--</ul>-->

<#--<ul class="nav navbar-nav navbar-right">-->
<#--<@shiro.user>-->
<#--<li><a href="#"><span class="glyphicon glyphicon-user">&nbsp;<@shiro.principal/></span> </a></li>-->
<#--<li><a href="/logout">注销</a></li>-->
<#--</@shiro.user>-->
<#--<@shiro.guest>-->
<#--<li><a href="/login"><span class="glyphicon glyphicon-user">&nbsp;游客</span> </a></li>-->
<#--</@shiro.guest>-->

<#--</ul>-->
<#--</div>-->

<#--</nav>-->

    <div class="row" style="background-color: white;border-radius:5px;line-height: 30px;padding: 20px;">
        <div class="col-xs-9 col-sm-9">
        <#if (list?? && list?size> 0)>
            <#list list as item >
                <p>${item}</p>
            </#list>
        </#if>
            <hr>
        <#if (map?? && (map?keys?size> 0))>
            <#list map?keys as key>
                <p>${key} &nbsp; ${map[key]}</p>
            </#list>
        </#if>
            <hr>
            <label>${string}</label>

        </div>
    <#--<div class="col-xs-3 col-sm-3">-->
    <#--<div >-->
    <#--<hr>-->
    <#--<h3>个人账号</h3>-->
    <#--<p align="center">-->
    <#--<img src="/resources/img/qrcode.png" width="80" height="80" >-->
    <#--</p>-->
    <#--<p>扫一扫加我O(∩_∩)O</p>-->
    <#--</div>-->
    <#--<div>-->
    <#--<hr>-->
    <#--<h3>最近文章</h3>-->
    <#--<#if (blogList?? && blogList?size>0) >-->
    <#--<#list blogList as blog >-->
    <#--<div class="row">-->
    <#--<img src="/resources/img/greenPoint.png" width="12" height="12"><a href="/blogdetail?id=${blog.id}"> ${blog.blogTitle}</a>-->
    <#--</div>-->
    <#--</#list>-->
    <#--</#if>-->
    <#--</div>-->
    <#--<div>-->
    <#--<hr>-->
    <#--<h3>最多访问</h3>-->
    <#--<#if (bestBlogList?? && bestBlogList?size> 0)>-->
    <#--<#list bestBlogList as blog >-->
    <#--<div class="row">-->
    <#--<img src="/resources/img/greenPoint.png" width="12" height="12"><a href="/blogdetail?id=${blog.id}"> ${blog.blogTitle}</a>-->
    <#--</div>-->
    <#--</#list>-->
    <#--</#if>-->
    <#--</div>-->
    <#--</div>-->
    </div>
</div>

</body>
</html>