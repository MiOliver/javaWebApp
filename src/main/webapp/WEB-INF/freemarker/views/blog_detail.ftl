<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<#--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">-->
<head>
    <title>Twitter Bootstrap Tutorial </title>
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
    <h1>Oliver's Blogs</h1>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header" >
                <a class="navbar-brand" href="#">
                    <img alt="Brand" src="/resources/img/Dolphin.png" width="25" height="25">
                </a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#">Link</a></li>
                <li><a href="#">About</a></li>
            </ul>
        </div>

    </nav>

    <div class="row" style="background-color: white;border-radius:5px;line-height: 30px;padding: 20px;  ">
        <div class=".col-xs-6 col-md-9">
            <h3>${blog.blogTitle}</h3>
            <div>
                <span class="glyphicon glyphicon-calendar"></span>&nbsp;&nbsp;${blog.createTime?string('yyyy-MM-dd HH:mm:ss')} &nbsp;&nbsp;&nbsp;
                <span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;${blog.createPerson}&nbsp;&nbsp;&nbsp;
                阅读次数：<span class="badge" style="background-color: yellowgreen">${blog.visitCount}</span>&nbsp;&nbsp&nbsp;&nbsp;&nbsp;
            </div>
            <div>
                标签：
            <#if blog.tags?length &gt;0 >
                <#list blog.tags?split(" ") as tag >
                    <span class="label label-default">${tag}</span>
                </#list>
            </#if>

            </div>
            <p>${blog.blogContent}</p>
        </div>
        <div class=".col-xs-6 col-md-3">
            <div>
                <h2>Sidebar</h2>
                <ul class="nav-tabs-justified">
                    <li><a href="#">Another Link 1</a></li>
                    <li><a href="#">Another Link 2</a></li>
                    <li><a href="#">Another Link 3</a></li>
                </ul>
            </div>
            <div>
                <h2>Sidebar</h2>
                <ul class="nav-tabs-justified">
                    <li><a href="#">Another Link 1</a></li>
                    <li><a href="#">Another Link 2</a></li>
                    <li><a href="#">Another Link 3</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

</body>
</html>