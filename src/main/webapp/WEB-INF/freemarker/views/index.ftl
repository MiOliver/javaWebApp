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
    <h1>Oliver's Blogs</h1>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">
                    <img alt="Brand" src="/resources/img/Dolphin.png" width="25" height="25">
                </a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="/index">Home</a></li>
                <li><a href="/addblog">Link</a></li>
                <li><a href="/about">About</a></li>
            </ul>
        </div>

    </nav>

    <div class="row" style="background-color: white;border-radius:5px;line-height: 30px;padding: 20px;  ">
        <div class=".col-xs-6 col-md-9">

        <#if blogList?size &gt; 0>
            <#list blogList as blog >
                <div>
                    <a href="/blogdetail?id=${blog.id}"><h3>${blog.blogTitle}</h3></a>

                    <p><span
                            class="glyphicon glyphicon-calendar"></span>&nbsp;&nbsp;${blog.createTime?string('yyyy-MM-dd HH:mm:ss')}
                        &nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;${blog.createPerson}
                        &nbsp;&nbsp;&nbsp;</p>
                    <img src=" ${blog.blogImgSrc}" height="70" width="70" style="float: right">${blog.blogContent}
                </div>
            </#list>
        </#if>
            <br>
            <hr>
            <form id="listForm" action="sales!searchList.action" method="post" class="form-inline">
            <#include "./common/common_pager_bar.ftl" />
            </form>

        </div>
        <div class=".col-xs-6 col-md-3">
            <div>
                <h3>最近文章</h3>
                <ul class="nav-tabs-justified">
                <#if blogList?size &gt; 0>
                    <#list blogList as blog >
                        <li><a href="/blogdetail?id=${blog.id}">${blog.blogTitle}</a></li>
                    </#list>
                </#if>
                </ul>
            </div>
            <div>
                <h3>最多访问</h3>
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