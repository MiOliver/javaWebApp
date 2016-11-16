<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<head>
    <title>Oliver's Blogs</title>
    <#include "./common/base_static_file.ftl"/>
    <style type="text/css">
        body {
            background-color: #CCC;
        }
    </style>
</head>
<body>
<div class="container">
<#include "./common/header.ftl"/>

    <div class="row"
         style="background-color: white;border-top-left-radius:5px;border-top-right-radius:5px;line-height: 30px;padding: 20px;  ">
        <div class="col-xs-9 col-sm-9">

        <#if (blogList?? && blogList?size>0) >
            <#list blogList as blog >
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div style="padding-left: 10px;" class="row" >
                            <span class="label label-info" style="font-size:large">${blog.subTitle}</span> <a href="${rc.contextPath}/blogdetail?id=${blog.id}" > <h3 style="display: inline"> <b style="margin-left: 5px">${blog.blogTitle}</b></h3></a>
                        </div>
                        <div class="row" style="padding-left: 15px;padding-right: 15px">
                            <hr>
                            <span class="glyphicon glyphicon-calendar" ></span><b style="margin-left: 10px;margin-right: 5px">${blog.createTime?string('yyyy-MM-dd HH:mm:ss')}</b>
                            <span class="glyphicon glyphicon-user"></span><b style="margin-left: 10px;margin-right: 5px">${blog.createPerson}</b>
                            <span class="glyphicon glyphicon-eye-open"></span><b style="margin-left: 10px;margin-right: 5px">${blog.visitCount}</b>

                        </div>
                        <div style="padding-left: 15px;padding-right: 15px;padding-bottom: 10px">
                            <div>
                            ${blog.blogContent}
                            </div>

                            <hr>
                            <div class="pull-left">
                                <a href="${rc.contextPath}/blogdetail?id=${blog.id}"><b>more >>></b></a>
                            </div>
                            <div class="pull-right">
                                <#if blog.tags?length &gt;0 >
                                    <#list blog.tags?split(" ") as tag >
                                        <span class="glyphicon glyphicon-tag" style="margin-right: 5px;color: #337ab7">${tag}</span>
                                    </#list>
                                </#if>

                            </div>
                        </div>

                    </div>
                </div>
            </#list>
        <#else>
            <div class="row">
                <label style="color: purple">目前还没有文章，去添加以一个吧...</label><br/>
                <a href="/addblog"><img src="${rc.contextPath}/resources/img/add_blog.png"/></a>
            </div>
        </#if>
            <br>
            <hr>
            <form id="listForm" action="sales!searchList.action" method="post" class="form-inline">
            <#include "./common/common_pager_bar.ftl" />
            </form>

        </div>
    <#include "./common/rightbar.ftl" />

    </div>

<#include "./common/footer.ftl" />

</div>

</body>
</html>