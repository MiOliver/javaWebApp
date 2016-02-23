<!DOCTYPE html>
<html lang="zh-CN" >
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
    <h1>享受技术和生活中的快乐</h1>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">
                      <img alt="Brand" src="/resources/img/Dolphin.png" width="25" height="25">
                </a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="/index">首页</a></li>
                <li><a href="/life">生活</a></li>
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

    <div class="row" style="background-color: white;border-radius:5px;line-height: 30px;padding: 20px;  ">
        <div class="col-xs-8 col-sm-9">

       <#if (blogList?? && blogList?size>0) >
            <#list blogList as blog >

                <div class="panel panel-default">
                    <div style="padding-left: 10px"> <a href="/blogdetail?id=${blog.id}"><h3>${blog.blogTitle}</h3></a></div>
                    <div style="padding-left: 15px;padding-right: 15px;padding-bottom: 10px"" >
                        <p>
                            <span class="glyphicon glyphicon-calendar"  style="color:darkorange"></span>&nbsp;&nbsp;${blog.createTime?string('yyyy-MM-dd HH:mm:ss')}
                            &nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-user" style="color:darkorange"></span>&nbsp;&nbsp;${blog.createPerson}
                            &nbsp;&nbsp;&nbsp;
                        </p>
                        <img src=" ${blog.blogImgSrc}" height="70" width="70" style="float: right">
                        <div>
                        ${blog.blogContent}<a href="/blogdetail?id=${blog.id}">阅读全文 >>></a>
                        </div>
                    </div>
                </div>
            </#list>
       <#else>
           <div class="row">
               <label style="color: purple">目前还没有文章，去添加以一个吧...</label><br/>
               <a href="/addblog"><img src="/resources/img/add_blog.png"/></a>
           </div>
        </#if>
            <br>
            <hr>
            <form id="listForm" action="sales!searchList.action" method="post" class="form-inline">
            <#include "./common/common_pager_bar.ftl" />
            </form>

        </div>
        <div class="col-xs-4 col-sm-3">
            <div>
                <h3>最近文章</h3>
                <#if (blogList?? && blogList?size>0) >
                    <#list blogList as blog >
                    <div class="row">
                        <img src="/resources/img/greenPoint.png" width="12" height="12"><a href="/blogdetail?id=${blog.id}"> ${blog.blogTitle}</a>
                    </div>
                    </#list>
                </#if>
            </div>
            <div>
                <h3>最多访问</h3>
                <#if (bestBlogList?? && bestBlogList?size> 0)>
                    <#list bestBlogList as blog >
                        <div class="row">
                            <img src="/resources/img/greenPoint.png" width="12" height="12"><a href="/blogdetail?id=${blog.id}"> ${blog.blogTitle}</a>
                        </div>
                    </#list>
                </#if>
            </div>
        </div>
    </div>
</div>

</body>
</html>