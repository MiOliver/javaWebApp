<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<#--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">-->
<head>
    <title>Twitter Bootstrap Tutorial </title>
    <#--<link href="/resources/css/bootstrap-combined.min.css" rel="stylesheet">-->
    <#--<link href="/resources/css/bootstrap.min.css" rel="stylesheet">-->
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
    <script type="text/javascript">
        function checkBlogText(){
            var html = $("#test").val();
            console.log(html.length);
            console.log(typeof html);
            if(html.length>0){
                console.log(html);
            }
            alert("stop");
            return false;
        }
    </script>
    <style type="text/css">
        body {
            background-color: #CCC;
        }

        /*#content {*/
            /*background-color: #FFF;*/
            /*border-radius: 5px;*/
        /*}*/

        /*#content .main {*/
            /*padding: 20px;*/
        /*}*/

        /*#content .sidebar {*/
            /*padding: 10px;*/
        /*}*/

        /*#content p {*/
            /*line-height: 30px;*/
        /*}*/
    </style>
</head>
<body>
<div class="container">

    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">
                    <img alt="Brand" src="...">
                </a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#">Link</a></li>
                <li><a href="#">Link</a></li>
            </ul>
        </div>

    </nav>

    <div class="row" style="background-color: white;border-radius:5px;line-height: 30px;padding: 20px;  ">
        <div class=".col-xs-6 col-md-9">
            <h2>content</h2>
                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
                    laoreet dolore magna aliquam erat volutpat. Ut wi快递费si enim ad minim veniam, quis nostrud exerci tation
                    ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor
                    in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at
                    vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis
                    dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil
                    imperdiet doming id quod mazim placerat facer possim assum.</p>

            <input type="text" id="test">
            <button value="test" onclick="checkBlogText()"> 提交</button>
        </div>
        <div class=".col-xs-6 col-md-3">
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




    <#--<div class="row show-grid" >-->
        <#--<div class="col-md-1">.col-md-1</div>-->
        <#--<div class="col-md-1">.col-md-1</div>-->
        <#--<div class="col-md-1">.col-md-1</div>-->
        <#--<div class="col-md-1">.col-md-1</div>-->
        <#--<div class="col-md-1">.col-md-1</div>-->
        <#--<div class="col-md-1">.col-md-1</div>-->
        <#--<div class="col-md-1">.col-md-1</div>-->
        <#--<div class="col-md-1">.col-md-1</div>-->
        <#--<div class="col-md-1">.col-md-1</div>-->
        <#--<div class="col-md-1">.col-md-1</div>-->
        <#--<div class="col-md-1">.col-md-1</div>-->
        <#--<div class="col-md-1">.col-md-1</div>-->
    <#--</div>-->
    <#--<div class="row">-->
        <#--<div class="col-md-8">.col-md-8</div>-->
        <#--<div class="col-md-4">.col-md-4</div>-->
    <#--</div>-->
    <#--<div class="row">-->
        <#--<div class="col-md-4">.col-md-4</div>-->
        <#--<div class="col-md-4">.col-md-4</div>-->
        <#--<div class="col-md-4">.col-md-4</div>-->
    <#--</div>-->
    <#--<div class="row">-->
        <#--<div class="col-md-6">.col-md-6</div>-->
        <#--<div class="col-md-6">.col-md-6</div>-->
    <#--</div>-->

</div>

</body>
</html>