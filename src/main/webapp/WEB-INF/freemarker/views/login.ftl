<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="utf-8">
<head>
    <title>Twitter Bootstrap Tutorial - A responsive layout tutorial</title>
    <link href="/resources/css/bootstrap-combined.min.css" rel="stylesheet">
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
                <li class="active"><a href="/index">Home</a></li>
                <li><a href="/addblog">Page One</a></li>
                <li><a href="#">Page Two</a></li>
            </ul>
        </div>
    </div>
    <div id="content" class="row-fluid">
        <div class="span9 main">
            <table >
                <tr align="center">
                    <td>
                        <span style="color:red;">*</span>username:
                    </td>
                    <td>
                        <input type="text"/>
                    </td>
                </tr>
                <tr align="center">
                    <td>
                        <span style="color:red;">*</span>password:
                    </td>
                    <td>
                        <input type="text"/>
                    </td>
                </tr>
                <tr >
                    <td colspan="2"><button type="button" class="btn btn-success">登  录</button> </td>
                </tr>
            </table>

        </div>

    </div>
</div>


</body>
</html>