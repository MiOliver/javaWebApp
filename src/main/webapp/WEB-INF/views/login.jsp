<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html lang="zh-CN">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<head>
    <title>Twitter Bootstrap Tutorial </title>
    <link href="${rc.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${rc.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
        body {
            background-color: #CCC;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Keep calm and Carry on</h1>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">
                    <img alt="Brand" src="${rc.contextPath}/resources/img/Dolphin.png" width="25" height="25">
                </a>
            </div>
            <ul class="nav navbar-nav">
                <li ><a href="${rc.contextPath}/index">首页</a></li>
                <li ><a href="${rc.contextPath}/addblog">生活</a></li>
                <li ><a href="${rc.contextPath}/timeline">时间轴</a></li>
                <li><a href="${rc.contextPath}/about">关于</a></li>
            </ul>
        </div>

    </nav>


    <div class="row" style="background-color: white;border-radius:5px;line-height: 30px;padding: 20px;  ">
        <div class=" col-md-9" >
            <form action="" method="post">
                <div class="row">
                    <label style="color: red">${error}</label>
                </div>
                <div class="row">
                    <span style="color:red;">*</span>用户名:
                    <input class="form-control" style="width:200px" type="text" name="username" value="<shiro:principal/>">
                </div>
                <div class="row">
                    <span style="color:red;">*</span>密 码:
                    <input class="form-control"  style="width:200px"  type="password" name="password"><br/>
                    <input type="submit" class="btn btn-success" value="登  录"/>
                </div>
            </form>
        </div>
        <div class=" col-md-3">

        </div>
    </div>
</div>

</body>
</html>