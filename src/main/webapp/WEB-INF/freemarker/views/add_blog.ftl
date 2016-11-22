<!DOCTYPE html>
<html lang="zh-CN" xmlns="http://java.sun.com/jsf/facelets">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<#--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">-->
<head>
    <title>Oliver's Blogs</title>
    <#include "./common/base_static_file.ftl" />

    <!-- include summernote css/js-->
    <link href="${rc.contextPath}/resources/css/summernote.css" rel="stylesheet"/>
    <script src="${rc.contextPath}/resources/js/summernote.js"></script>

    <script src="${rc.contextPath}/resources/js/bootstrap-dialog.min.js" type="text/javascript"></script>
    <link href="${rc.contextPath}/resources/css/bootstrap-dialog.min.css" rel="stylesheet">

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
                    <#if (blog.blogCategoryId??)>
                        getsubtype(${blog.blogCategoryId});
                    </#if>


                }
        );
        function checkBlogText() {
            var blogTitle = $('#blogTitle').val();
            var tags = $('#tags').val();
            var blogCategoryId = $("input[type='radio']:checked").val();
            var blogImgSrc = $('#blogImgSrc').val();
            var blogContent = $('#summernote').code();
            var subTitle = $('#subTitle').val();
            console.log(blogTitle.length);
            if(blogTitle.length==0 || blogTitle.length>15){
                BootstrapDialog.show({
                    message: '博客标题请控制在15字符，谢谢!'
                });
                return;
            }else{
                console.log("submit");
                $.ajax({
                    data: {
                        'blogTitle': blogTitle,
                        'tags': tags,
                        'blogCategoryId': blogCategoryId,
                        'subTitle': subTitle,
                        'blogImgSrc': blogImgSrc,
                        'blogContent': blogContent
                    },
                    type: "post",
                    dataType: 'json',
                    url: "${rc.contextPath}/createblog",
                    error: function (XMLHttpRequest, error, errorThrown) {
                        console.log("error " + error + ": " + errorThrown);
                        BootstrapDialog.show({
                            message: '添加博客失败!'
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
            }
            return false;
        }

        function updateBlog() {
            var blogId= $('#blogId').val();
            var blogTitle = $('#blogTitle').val();
            var tags = $('#tags').val();
            var blogCategoryId =  $("input[type='radio']:checked").val();
            var blogImgSrc = $('#blogImgSrc').val();
            var blogContent = $('#summernote').code();
            var subTitle = $('#subTitle').val();;

            console.log(blogId);
            console.log(blogTitle);
            console.log(blogCategoryId);
            console.log(subTitle);
            $.ajax({
                data: {
                    'id': blogId,
                    'blogTitle': blogTitle,
                    'subTitle': subTitle,
                    'tags': tags,
                    'blogCategoryId': blogCategoryId,
                    'blogImgSrc': blogImgSrc,
                    'blogContent': blogContent
                },
                type: "post",
                dataType: 'json',
                url: "${rc.contextPath}/updateBlog",
                error: function (XMLHttpRequest, error, errorThrown) {
                    console.log("error " + error + ": " + errorThrown);
                    BootstrapDialog.show({
                        message: '博客更新成功!'
                    });
                },
                success: function (data) {
                    BootstrapDialog.show({
                        title: '提示',
                        message: '博客更新成功!',
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

            $.ajax({
                data: {
                    'cateId': type
                },
                type: "get",
                dataType: 'json',
                url: "${rc.contextPath}/getSublist",
                error: function (XMLHttpRequest, error, errorThrown) {
                    console.log("error " + error + ": " + errorThrown);
                    BootstrapDialog.show({
                        message: '请求出错!'
                    });
                },
                success:function (data,textStatus){
                    if(textStatus=='success'){
                        var clsList = data.var;
                        var selectStr = "<option value=''>请选择</option>";
                        $.each(clsList, function(index, value){
                            if(value!=null){
                                selectStr +='<option value="'+value.subTitle+'"   >'+value.subTitle+'</option>';
                            <#--<#if value.subTitle==blog.subTitle> selected="selected" </#if>-->
                            }
                        });
                        $("#subTitle").empty();
                        $("#subTitle").append(selectStr);
                    }else{
                        alert(data.message);
                    }
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
<#include "./common/header.ftl"/>

    <div class="row" style="background-color: white;border-top-left-radius:5px;border-top-right-radius:5px;;padding: 20px;  ">
        <div class=" col-md-12">
            <#if update == false>
                <div style="padding: 30px;">
                    <h3>添加博客</h3>
                    <hr>
                    <form action="" method="post">
                        <div class="form-group">
                            <label>博客标题:</label>
                            <input type="text" class="form-control" style="width: 100%" placeholder="title" id="blogTitle" name="blogTitle"
                                   required="true">
                        </div>
                        <div class="form-group">
                            <label>博客内容:</label>

                            <div id="summernote">请在此处编辑博客内容...

                            </div>
                        </div>

                        <div class="form-group">
                            <label>博客标签</label>
                            <input type="text" class="form-control" style="width: 100%" placeholder="tags" id="tags" name="tags"
                                  >
                        </div>
                        <div class="form-group">
                            <label>博客类型</label><br>
                            <#if (cateList?size > 0)>
                                <#list cateList as category >
                                    <input type="radio" name="blogCategoryId" style="width: 17px;height: 17px" value="${category.categoryId}"  onclick="getsubtype('${category.categoryId}')"> ${category.categoryTitle} &nbsp;&nbsp;
                                </#list>
                            </#if>

                        </div>
                        <div class="form-group">
                            <label>博客类别</label>
                            <select class="form-control" style="width: 20%"  id="subTitle" name="subTitle"
                                    required="true">
                                <option selected>选择博客类别</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>博客配图:</label>
                            <input type="text" class="form-control" style="width: 100%" placeholder="title" id="blogImgSrc"  name="blogImgSrc" required="true">
                        </div>

                        <input type="button" value="创  建" class="btn btn-success" onclick="checkBlogText()">
                    </form>
                </div>
            <#else>
                <div style="padding: 30px;">
                    <h3>更新博客</h3>
                    <hr>
                <#--<form ac method="post">-->
                    <form action="" method="post">
                        <div class="form-group">
                            <label>博客标题:</label>
                            <input type="text" class="form-control" style="width: 100%" placeholder="title" value="${blog.blogTitle}" name="blogTitle"
                                   id="blogTitle" required="true">
                            <input type="hidden" id="blogId" value="${blog.id}">
                        </div>
                        <div class="form-group">
                            <label>博客内容:</label>
                            <div id="summernote">${blog.blogContent}
                            </div>
                        </div>

                        <div class="form-group">
                            <label>博客标签</label>
                            <input type="text" class="form-control" style="width: 100%" placeholder="tags" value="${blog.tags}" name="tags" id="tags">
                        </div>
                        <div class="form-group">
                            <label>博客类型</label><br>
                            <#if (cateList?size > 0)>
                                <#list cateList as category >
                                    <input type="radio"  name="blogCategoryId" style="width: 17px;height: 17px" value="${category.categoryId}" <#if category.categoryId==blog.blogCategoryId> checked="checked"</#if> onclick="getsubtype('${category.categoryId}')"> ${category.categoryTitle} &nbsp;&nbsp;
                                </#list>
                            </#if>

                        </div>
                        <div class="form-group">
                            <label>博客类别</label>
                            <select class="form-control" style="width: 150px" id="subTitle"
                                    required="true">
                                <option selected>选择博客类别</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>博客配图:</label><br>
                            <img src="${blog.blogImgSrc}" width="60" height="60">
                            <input type="text" class="form-control" style="width: 100%" value="${blog.blogImgSrc}" name="blogImgSrc"
                                   id="blogImgSrc" required="true">
                        </div>

                        <input type="button" value="更新" class="btn btn-success" onclick="updateBlog()" ></input>
                    </form>
                </div>
            </#if>


        </div>

    </div>
    <#include "./common/footer.ftl" />
</div>


</body>
</html>