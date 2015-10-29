<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="utf-8">
<head>
    <title>Twitter Bootstrap Tutorial - A responsive layout tutorial</title>
    <link href="/resources/css/bootstrap-combined.min.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
    <style type="text/css">
        body {
            background-color: #CCC;
        }

        #content {
            background-color: #FFF;
            border-radius: 5px;
        }

        #content .main {
            padding: 20px;
        }

        #content .sidebar {
            padding: 10px;
        }

        #content p {
            line-height: 30px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Oliver's Blogs</h1>

    <div class="navbar navbar-inverse">
        <div class="navbar-inner nav-collapse" style="height: auto;">
            <ul class="nav">
                <li><a href="/index">Home</a></li>
                <li class="active"><a href="/addblog">Page One</a></li>
                <li><a href="#">Page Two</a></li>
            </ul>
        </div>
    </div>
    <div id="content" class="row-fluid">
        <div class="span9 main">
            <h3>add blogs</h3>
            <hr>
            <form action="/createBlog">
                <table align="center">
                    <tr>
                        <td width="80">
                            <label>博客标题:</label>
                        </td>
                        <td>
                            <input type="text" style="width: 500px" placeholder="title" name="blogTitle">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>博客内容:</label>
                        </td>
                        <td>
                            <textarea title="content" style="width: 500px" placeholder="content" name="blogContent" ></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>博客标签</label>
                        </td>
                        <td>
                            <input type="text" style="width: 500px" placeholder="tags">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>博客类别</label>
                        </td>
                        <td>
                            <select>
                                <option selected="selected">选择博客类别</option>
                                <#if (cateList?size > 0)>
                                    <#list cateList as category >
                                        <option  name="blogCategory" >${category.categoryTitle}</option>
                                    </#list>
                                </#if>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="submit" class="btn">创  建</button>
                        </td>
                    </tr>
                </table>


            </form>

        </div>
        <div class="span3 sidebar">
            <h2>Sidebar</h2>
            <ul class="nav nav-tabs nav-stacked">
                <li><a href="#">Another Link 1</a></li>
                <li><a href="#">Another Link 2</a></li>
                <li><a href="#">Another Link 3</a></li>
            </ul>
        </div>

    </div>
</div>


</body>
</html>