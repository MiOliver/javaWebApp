<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<head>
    <title>后台管理</title>
    <#include "./common/base_static_file.ftl"/>
    <style type="text/css">
        body {
            background-color: #CCC;
        }
        .row .btn:not(.btn-block) { width:120px;margin-bottom:10px; margin-left: 20px;}

    </style>
</head>
<body>
<div class="container">
    <#include "./common/header.ftl"/>

    <div class="row" style="background-color: white;border-top-left-radius:5px;border-top-right-radius:5px;line-height: 30px;padding: 20px;  ">
        <div class="col-sm-12 col-md-12">
            <h3>博客管理</h3>
            <hr>
            <div class="row">
                <a href="${rc.contextPath}/blogManage" class="btn btn-primary btn-lg" role="button" ><span class="glyphicon glyphicon-list-alt"></span> <br/>博客管理</a>
                <a href="${rc.contextPath}/addblog" class="btn btn-primary btn-lg" role="button" ><span class="glyphicon glyphicon-edit"></span> <br/>博客添加</a>
                <#--<a href="/statistics" class="btn btn-info btn-lg" role="button" ><span class="glyphicon glyphicon-tag"></span> <br/>数据统计</a>-->
                <a href="${rc.contextPath}/subTitleManage" class="btn btn-primary btn-lg" role="button" ><span class="glyphicon glyphicon-wrench"></span> <br/>类别管理</a>
                <a href="${rc.contextPath}/addSubtitle" class="btn btn-primary btn-lg" role="button" ><span class="glyphicon glyphicon-cog"></span> <br/>类别添加</a>
                <a href="${rc.contextPath}/toolManage" class="btn btn-primary btn-lg" role="button" ><span class="glyphicon glyphicon-wrench"></span> <br/>工具管理</a>
                <a href="${rc.contextPath}/addTool" class="btn btn-primary btn-lg" role="button" ><span class="glyphicon glyphicon-cog"></span> <br/>工具添加</a>
                <a href="${rc.contextPath}/redisManage" class="btn btn-primary btn-lg" role="button" ><span class="glyphicon glyphicon-cog"></span> <br/>缓存管理</a>

            </div>
        </div>

    </div>
<#include "./common/footer.ftl" />
</div>

</body>
</html>