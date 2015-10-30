<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="utf-8">
<head>
    <title>Twitter Bootstrap Tutorial - A responsive layout tutorial</title>
    <link href="/resources/css/bootstrap-combined.min.css" type="text/css" rel="stylesheet">
    <#--<link href="/resources/css/bootstrap.css" type="text/css" rel="stylesheet">-->
    <#--<link href="/resources/css/bootstrap.min.css" type="text/css" rel="stylesheet">-->
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
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#">Page One</a></li>
                <li><a href="#">Page Two</a></li>
            </ul>
        </div>
    </div>
    <div id="content" class="row-fluid">
        <div class="span9 main">
            <div>
                <div >
                    <h3>${blog.blogTitle}</h3>
                    <div>
                        <span class="glyphicon glyphicon-calender"></span>${blog.createTime?string('yyyy-MM-dd HH:mm:ss')}
                        <span class="icon-user"></span>${blog.createPerson}
                        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                    </div>
                    <div>
                        标签：
                        <#if blog.tags?length &gt;0 >
                        <#list blog.tags?split(" ") as tag >
                            <span class="label label-default">${tag}</span>
                        </#list>
                        </#if>

                    </div>
                    <p>${blog.blogContent}</p>
                </div>
            </div>
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