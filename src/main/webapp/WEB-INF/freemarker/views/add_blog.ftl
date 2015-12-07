<!DOCTYPE html>
<html lang="zh-CN" xmlns="http://java.sun.com/jsf/facelets">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<#--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">-->
<head>
    <title>Twitter Bootstrap Tutorial </title>
    <#include "./common/base_static_file.ftl" />

    <!-- include summernote css/js-->
    <link href="/resources/css/summernote.css" rel="stylesheet"/>
    <script src="/resources/js/summernote.js"></script>

    <script src="/resources/js/bootstrap-dialog.min.js" type="text/javascript"></script>
    <link href="/resources/css/bootstrap-dialog.min.css" rel="stylesheet">
    <script type="text/javascript" src="/resources/js/bootstrap.js"></script>

    <style type="text/css">
        body {
            background-color: #CCC;
        }
    </style>
    <script type="text/javascript">
        function refreshPage() {
            window.location.reload();
        }
        $(document).ready(
                function () {
                    $('#summernote').summernote();
                }
        );
        function checkBlogText() {
            var blogTitle = $('#blogTitle').val();
            var tags = $('#tags').val();
            var blogCategory = $('#blogCategory').val();
            var blogImgSrc = $('#blogImgSrc').val();
            var blogContent = $('#summernote').code();
            console.log(blogContent);
            $.ajax({
                data: {
                    'blogTitle': blogTitle,
                    'tags': tags,
                    'blogCategory': blogCategory,
                    'blogImgSrc': blogImgSrc,
                    'blogContent': blogContent
                },
                type: "post",
                dataType: 'json',
                url: "/createblog",
                error: function (XMLHttpRequest, error, errorThrown) {
                    console.log("error " + error + ": " + errorThrown);
                    BootstrapDialog.show({
                        message: '博客添加成功!'
                    });
                },
                success: function (data) {
                    BootstrapDialog.show({
                        title: '提示',
                        message: '博客添加成功!',
                        buttons: [{
                            label: '确定',
                            action: function (dialog) {
                                refreshPage();
                            }
                        }]
                    });

                }
            });
            return false;
        }
        function getsubtype(type){
//            $.getJSON("/getSublist",type,function(data){
//                if(data.status && data.status=="success") {
//
//                } else {
//
//                }
//            });
            $.ajax({
                data: {
                    'cateId': type
                },
                type: "get",
                dataType: 'json',
                url: "/getSublist",
                error: function (XMLHttpRequest, error, errorThrown) {
                    console.log("error " + error + ": " + errorThrown);
                    BootstrapDialog.show({
                        message: '请求出错!'
                    });
                },
                success:function (data,textStatus){
                    console.log(textStatus);
                    var json=eval(data);//转换为json对象
                    console.log(json);
                    $.each(json, function (index, item) {
                        //循环获取数据
                        console.log(index);
                        if("var"==index){
//                            var datajson=json[index];
//                            console.log(typeof datajson);
//                            var eval("("+datajson+")");

                            $.each(json[index], function(name, value) {
                                $.each(value, function(name, value) {
                                    console.log(name);
                                    console.log(value);
                                    <#--$("#blogCategory").append("<option <#if value==category.categoryTitle> selected </#if> >${category.categoryTitle} </option>")-->
                                });
                            });
                        }

                    });
                }
            });
        }
        function updateSubClass(type){
            console.log(type);
        }

    </script>

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
                <li ><a href="/index">首页</a></li>
                <li class="active"><a href="/life">生活</a></li>
                <li><a href="/about">关于</a></li>
            </ul>
        </div>

    </nav>

    <div class="row" style="background-color: white;border-radius:5px;padding: 20px;  ">
        <div class=" col-md-10">
            <#if update == false>
                <div style="padding: 30px;">
                    <h3>添加博客</h3>
                    <hr>
                <#--<form ac method="post">-->
                    <form action="/createBlog" method="post" onsubmit="return checkBlogText()">
                        <div class="form-group">
                            <label>博客标题:</label>
                            <input type="text" class="form-control" style="width: 800px" placeholder="title" id="blogTitle"
                                   name="blogTitle" required="true">
                        </div>
                        <div class="form-group">
                            <label>博客内容:</label>

                            <div id="summernote">请在此处编辑博客内容...

                            </div>
                        </div>

                        <div class="form-group">
                            <label>博客标签</label>
                            <input type="text" class="form-control" style="width: 800px" placeholder="tags" id="tags"
                                   name="tags">
                        </div>
                        <div class="form-group">
                            <label>博客类型</label><br>
                            <#if (cateList?size > 0)>
                                <#list cateList as category >
                                    <input type="radio"  name="blogType" style="width: 17px;height: 17px" onclick="getsubtype('${category.categoryTitle}')"> ${category.categoryTitle} &nbsp;&nbsp;
                                </#list>
                            </#if>

                        </div>
                        <div class="form-group">
                            <label>博客类别</label>
                            <select class="form-control" style="width: 150px" id="blogCategory" name="blogCategory"
                                    required="true">
                                <option selected>选择博客类别</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>博客配图:</label>
                            <input type="text" class="form-control" style="width: 800px" placeholder="title" id="blogImgSrc"
                                   name="blogImgSrc" required="true">
                        </div>

                        <input type="submit" value="创  建" class="btn"></input>
                    </form>
                </div>
            <#else>
                <div style="padding: 30px;">
                    <h3>更新博客</h3>
                    <hr>
                <#--<form ac method="post">-->
                    <form action="/#" method="post" >
                        <div class="form-group">
                            <label>博客标题:</label>
                            <input type="text" class="form-control" style="width: 800px" placeholder="title" value="${blog.blogTitle}"
                                   name="blogTitle" required="true">
                        </div>
                        <div class="form-group">
                            <label>博客内容:</label>
                            <div id="summernote">value="${blog.blogContent}"
                            </div>
                        </div>

                        <div class="form-group">
                            <label>博客标签</label>
                            <input type="text" class="form-control" style="width: 800px" placeholder="tags" value="${blog.tags}"
                                   name="tags">
                        </div>
                        <div class="form-group">
                            <label>博客类型</label><br>
                            <#if (cateList?size > 0)>
                                <#list cateList as category >
                                    <input type="radio"  name="blogType" style="width: 17px;height: 17px" <#if category.categoryId==blog.blogCategoryId> checked="checked"</#if> onclick="getsubtype('${category.categoryId}')"> ${category.categoryTitle} &nbsp;&nbsp;
                                </#list>
                            </#if>

                        </div>
                        <div class="form-group">
                            <label>博客类别</label>
                            <select class="form-control" style="width: 150px" id="blogCategory" id="blogCategory"
                                    required="true">
                                <option selected>选择博客类别</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>博客配图:</label><br>
                            <img src="${blog.blogImgSrc}" width="60" height="60">
                            <input type="text" class="form-control" style="width: 800px" value="${blog.blogImgSrc}"
                                   name="blogImgSrc" required="true">
                        </div>

                        <input type="submit" value="更 新" class="btn"></input>
                    </form>
                </div>
            </#if>


        </div>

    </div>
</div>


</body>
</html>