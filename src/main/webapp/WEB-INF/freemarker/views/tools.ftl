<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<head>
    <title>Oliver's Blogs</title>
    <link href="${rc.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${rc.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
        body {
            background-color: #CCC;
        }
        .row .btn:not(.btn-block) { width:150px;margin-bottom:10px; margin-right: 10px}

    </style>
</head>
<body>
<div class="container">
<#include "./common/header.ftl"/>
    <div class="row" style="background-color: white;border-top-left-radius:5px;border-top-right-radius:5px;line-height: 30px;padding: 20px; ">

        <div style="padding: 5px">
            <h3>常用工具集</h3>
            <hr>
            <div class="col-xs-12 col-md-12" >
                <div class="row">

                <#if (toolList?? && toolList?size>0) >
                    <#list toolList as tool>
                        <a href="${tool.toolUrl}" class="btn btn-primary btn-lg" role="button" target="_blank">
                            <#if (tool.toolIcon?length>0)>
                                <img src="${tool.toolIcon}" width="28" height="28"/>
                            <#else >
                                <span class="glyphicon glyphicon-bookmark" style="width: 28px;height: 28px"></span>
                            </#if>

                            <br/>${tool.toolName}
                        </a>
                    </#list>
                </#if>
                <#--<a href="${rc.contextPath}#" class="btn btn-danger btn-lg" role="button"><span class="glyphicon glyphicon-list-alt"></span> <br/>Apps</a>-->
                <#--<a href="${rc.contextPath}#" class="btn btn-warning btn-lg" role="button"><span class="glyphicon glyphicon-bookmark"></span> <br/>Bookmarks</a>-->
                <#--<a href="${rc.contextPath}#" class="btn btn-primary btn-lg" role="button"><span class="glyphicon glyphicon-signal"></span> <br/>Reports</a>-->
                <#--<a href="${rc.contextPath}#" class="btn btn-primary btn-lg" role="button"><span class="glyphicon glyphicon-comment"></span> <br/>Comments</a>-->
                <#--<a href="${rc.contextPath}#" class="btn btn-success btn-lg" role="button"><span class="glyphicon glyphicon-comment"></span> <br/>Comments</a>-->
                <#--<a href="${rc.contextPath}#" class="btn btn-default btn-lg" role="button"><span class="glyphicon glyphicon-comment"></span> <br/>Comments</a>-->
                <#--<a href="${rc.contextPath}#" class="btn btn-info btn-lg" role="button"><span class="glyphicon glyphicon-comment"></span> <br/>Comments</a>-->
                <#--<a href="${rc.contextPath}#" class="btn btn-link btn-lg" role="button"><span class="glyphicon glyphicon-comment"></span> <br/>Comments</a>-->
                </div>

            </div>
        </div>

    </div>
<#include "./common/footer.ftl" />
</div>

</body>
</html>