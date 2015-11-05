<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<#--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">-->
<head>
    <title>Blog manage </title>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
    <script type="text/javascript" src="/resources/js/jquery.pager.js"></script>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <script src="/resources/js/bootstrap-dialog.min.js" type="text/javascript"></script>
    <link href="/resources/css/bootstrap-dialog.min.css" rel="stylesheet">
    <script type="text/javascript" src="/resources/js/bootstrap.js"></script>

    <style type="text/css">
        body {
            background-color: #CCC;
        }
    </style>
    <script type="text/javascript">
        function deleteBlog(id) {
            console.log(id);
            $.ajax({
                data: {
                    'id': id
                },
                type: "post",
                dataType: 'json',
                url: "/deleteblog",
                error: function (XMLHttpRequest, error, errorThrown) {
                    console.log("error " + error + ": " + errorThrown);
                    BootstrapDialog.show({
                        message: "error " + error + ": " + errorThrown
                    });
                },
                success: function (data) {
                    BootstrapDialog.show({
                        title: '提示',
                        message: '博客删除成功!',
                        buttons: [
                            {
                                label: '确定',
                                action: function (dialog) {
                                    refreshPage();
                                }
                            }
                        ]
                    });


                }
            });
            return false;
        }
        function refreshPage() {
            window.location.reload();
        }
    </script>
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
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#">Link</a></li>
                <li><a href="#">About</a></li>
            </ul>
        </div>

    </nav>

    <div class="row" style="background-color: white;border-radius:5px;line-height: 30px;padding: 20px;  ">
        <div class=".col-xs-6 col-md-9">
            <h3>博客管理</h3>
            <hr>
            <form id="listForm" action="/blogManage" method="post" class="form-inline">
                <table class="table table-bordered thead-table">
                    <thead>
                    <th>博客ID</th>
                    <th>博客标题</th>
                    <th>创建时间</th>
                    <th>博客创建者</th>
                    <th>操作</th>
                    </thead>
                <#if blogList?size &gt; 0>
                    <#list blogList as blog >
                        <tr>
                            <td>${blog.id }</td>
                            <td>${blog.blogTitle}</td>
                            <td>${blog.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td>${blog.createPerson}</td>
                            <td><a href="#" onclick="deleteBlog(${blog.id })"><span
                                    class="glyphicon glyphicon-remove-sign" title="删除" style="font-size: 15"></span></a>
                            </td>
                        </tr>
                    </#list>
                </#if>
                </table>
            <#include "./common/common_pager_bar.ftl" />
            </form>

        </div>
        <div class=".col-xs-6 col-md-3">

        </div>
    </div>
</div>

</body>
</html>