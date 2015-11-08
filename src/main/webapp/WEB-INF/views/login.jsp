<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>Twitter Bootstrap Tutorial </title>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
        body {
            background-color: #CCC;
        }
    </style>
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
        <div class=" col-md-9">
            <form action="" method="post">
                <table>
                    <tr>
                        <td colspan="2" >
                            ${error}
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 80px;">
                            <span style="color:red;">*</span>用户名:
                        </td>
                        <td>
                            <input class="form-control" type="text" name="username"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="color:red;">*</span>密 码:
                        </td>
                        <td>
                            <input class="form-control" type="password" name="password"><br/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" class="btn btn-success" value="登  录"/></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class=" col-md-3">
            <div>
                <h2>Sidebar</h2>
                <ul class="nav-tabs-justified">
                    <li><a href="#">Another Link 1</a></li>
                    <li><a href="#">Another Link 2</a></li>
                    <li><a href="#">Another Link 3</a></li>
                </ul>
            </div>
            <div>
                <h2>Sidebar</h2>
                <ul class="nav-tabs-justified">
                    <li><a href="#">Another Link 1</a></li>
                    <li><a href="#">Another Link 2</a></li>
                    <li><a href="#">Another Link 3</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

</body>
</html>