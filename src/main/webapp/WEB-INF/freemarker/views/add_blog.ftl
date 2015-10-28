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

            <form>
                <input type="text" placeholder="title">
                <br/>
                <input type="text" placeholder="content">
                <br/>
                <input type="text" placeholder="tags">
                <br/>
                <button type="submit" class="btn">Submit</button>
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