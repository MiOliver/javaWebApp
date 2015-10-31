<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<#--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">-->
<head>
    <title>Twitter Bootstrap Tutorial </title>
    <#--<link href="/resources/css/bootstrap.min.css" rel="stylesheet">-->
    <link href="/resources/css/bootstrap.css" rel="stylesheet">

    <#--<!-- include libraries(jQuery, bootstrap, fontawesome) &ndash;&gt;-->
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.css" />

    <!-- include summernote css/js-->
    <link href="/resources/css/summernote.css" rel="stylesheet" />
    <script src="/resources/js/summernote.js"></script>

    <#--<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" />-->
    <script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>



    <style type="text/css">
        body {
            background-color: #CCC;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(
                function() {
             $('#summernote').summernote();
        }
        );
        function checkBlogText(){
            var blogTitle=$('#blogTitle').val();
            var tags=$('#tags').val();
            var blogCategory=$('#blogCategory').val();
            var blogContent = $('#summernote').code();
            console.log(blogContent);
            $.ajax({
                data:{
                    'blogTitle':blogTitle,
                    'tags':tags,
                    'blogCategory':blogCategory,
                    'blogContent':blogContent,
                },
                type:"post",
                dataType: 'json',
                url:"/createblog",
                error: function(XMLHttpRequest, error, errorThrown){
                    console.log("error "+error+": "+errorThrown);
                    alert(error);
                    alert(errorThrown);
                },
                success:function(data){
                    alert("success:"+data.msg);
                }
            });
            return false;
        }
    </script>

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
        <div class=" col-md-10">

            <div style="padding: 30px;">
                <h3>添加博客</h3>
                <hr>
                <#--<form ac method="post">-->
                    <form action="/createBlog" method="post" onsubmit="return checkBlogText()">
                    <div class="form-group">
                        <label>博客标题:</label>
                        <input type="text" class="form-control" style="width: 600px" placeholder="title" id="blogTitle" name="blogTitle" required="true" >
                    </div>
                    <div class="form-group">
                        <label>博客内容:</label>
                        <div id="summernote">请在此处编辑博客内容...

                        </div>
                    </div>


                    <div class="form-group">
                        <label>博客标签</label>
                        <input type="text" class="form-control" style="width: 600px" placeholder="tags" id="tags"  name="tags">
                    </div>
                    <div class="form-group">
                        <label>博客类别</label>
                        <select class="form-control"  style="width: 150px"  id="blogCategory" name="blogCategory" required="true">
                            <option selected >选择博客类别</option>
                        <#if (cateList?size > 0)>
                            <#list cateList as category >
                                <option >${category.categoryTitle}</option>
                            </#list>
                        </#if>
                        </select>
                    </div>
                    <input type="submit" value="创  建" class="btn"></input>
                </form>
            </div>

        </div>

    </div>
</div>


</body>
</html>