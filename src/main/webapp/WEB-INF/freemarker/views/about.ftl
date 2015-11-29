<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<#--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">-->
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
                <li ><a href="/life">生活</a></li>
                <li class="active"><a href="/about">关于</a></li>
            </ul>
        </div>

    </nav>


    <div class="row" style="background-color: white;border-radius:5px;line-height: 30px;padding: 20px;  ">

        <div class=".col-xs-6 col-md-11">
            <address>
                <h3>个人简介</h3><hr>
                <img src="/resources/img/me.jpg" ><br><br>
                <strong>Oliver</strong>
                <p>
                    目前在一家互联网公司从事java后台和Android App研发工作！
                </p>

            </address>
            <address>
                <strong>个人爱好</strong><br>
              <p>热爱篮球、喜欢登山、跑步、骑行、户外野营</p>

            </address>


            <address>
                <strong>微博账号</strong><br>
                <a href="http://weibo.com/ningvip/home">猫仔仔</a>
            </address>

            <address>
                <strong>Email:</strong><br>
                <a href="mailto:#">tianxingzhe1990@gmail.com</a>
            </address>
        </div>
        <div class=".col-xs-6 col-md-3">

        </div>
    </div>
</div>

</body>
</html>