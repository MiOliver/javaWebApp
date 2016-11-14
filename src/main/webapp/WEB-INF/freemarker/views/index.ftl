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

                <div class="panel panel-default" style="border-width: 2px">
                <div class="panel-body">
                    <div style="padding-left: 10px"><a href="${rc.contextPath}/blogdetail?id=${blog.id}">
                        <h3>${blog.blogTitle}</h3></a>
                    </div>
                    <div style="padding-left: 15px;padding-right: 15px;padding-bottom: 10px">
                        <p>
                        <span class="glyphicon glyphicon-calendar"
                              style="color:darkorange"></span>创建时间：&nbsp;&nbsp;${blog.createTime?string('yyyy-MM-dd HH:mm:ss')}
                            &nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-user" style="color:darkorange"></span>创建人：&nbsp;&nbsp;${blog.createPerson}
                            &nbsp;&nbsp;&nbsp;
                        </p>
                        <img src=" ${blog.blogImgSrc}" height="80" width="80" style="float: right">
                        <div>
                        ${blog.blogContent}<a href="/blogdetail?id=${blog.id}">阅读全文 >>></a>
                        </div>

                        <hr>
                        <div class="pull-left">
                            <a href="${rc.contextPath}/blogdetail?id=${blog.id}"><b>more >>></b></a>
                        </div>
                        <div class="pull-right">
                            <a href="https://www.facebook.com/DLZYagiz"><i
                                    class="fa fa-2x fa fa-facebook-square"></i></a>  
                            <a><i class="fa fa-2x fa fa-google-plus-square"></i></a>  
                            <a><i class="fa fa-2x fa fa-twitter-square"></i></a>  

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