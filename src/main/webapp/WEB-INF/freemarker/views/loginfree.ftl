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
            <ul class="pagination-right" >
                <li><label>test</label> </li>
            </ul>
        </div>
    </div>
    <div id="content" class="row-fluid">
        <div class="span9 main">
            <h3>User login</h3>
            <hr>

            <form action="" method="post">
                <table >
                    <tr  >
                        <td width="80">
                            <span style="color:red;">*</span>用户名:
                        </td>
                        <td>
                            <input type="text" name="username"><br/>
                        </td>
                    </tr>
                    <tr >
                        <td>
                            <span style="color:red;">*</span>密  码:
                        </td>
                        <td>
                            <input type="password" name="password"><br/>
                        </td>
                    </tr>
                    <tr >
                        <td colspan="2"><input type="submit" class="btn btn-success" value="登  录"></input> </td>
                    </tr>
                </table>
                <#--用户名：<input type="text" name="username"><br/>-->
                <#--密码：<input type="password" name="password"><br/>-->
                <#--<input type="submit" value="登录">-->
            </form>



        </div>

    </div>
</div>


</body>
</html>