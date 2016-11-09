<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<#--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">-->
<head>
    <title>后台管理</title>
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
    <#include "./common/header.ftl"/>

    <div class="row" style="background-color: white;border-top-left-radius:5px;border-top-right-radius:5px;line-height: 30px;padding: 20px;  ">
        <div class="col-sm-12 col-md-12">
            <h3>博客管理</h3>
            <hr>
            <div class="row">
                <div class="col-sm-2 col-md-2">
                    <div class="thumbnail">
                        <a href="/blogManage"><img src="/resources/img/Calendar.png" width="50" height="50" alt="100*80"></a>

                        <div class="caption" align="center">
                            <h4>博客管理</h4>
                        </div>
                    </div>
                </div>
                <div class="col-sm-2 col-md-2">
                    <div class="thumbnail">
                        <a href="/addblog"><img src="/resources/img/Coffee.png" width="50" height="50" alt="100*80"></a>

                        <div class="caption" align="center">
                            <h4>添加博客</h4>
                        </div>
                    </div>
                </div>
                <div class="col-sm-2 col-md-2">
                    <div class="thumbnail">
                        <a href="#"><img src="/resources/img/Line.png" width="50" height="50" alt="100*80"></a>

                        <div class="caption" align="center">
                            <h4>数据统计</h4>
                        </div>
                    </div>
                </div>
                <div class="col-sm-2 col-md-2">
                    <div class="thumbnail">
                        <a href="#"><img src="/resources/img/Clock.png" width="50" height="50" alt="100*80"></a>

                        <div class="caption" align="center">
                            <h4>博客管理</h4>
                        </div>
                    </div>
                </div>
                <div class="col-sm-2 col-md-2">
                    <div class="thumbnail">
                        <a href="#"><img src="/resources/img/Line.png" width="50" height="50" alt="100*80"></a>

                        <div class="caption" align="center">
                            <h4>博客管理</h4>
                        </div>
                    </div>
                </div>
                <div class="col-sm-2 col-md-2">
                    <div class="thumbnail">
                        <a href="#"><img src="/resources/img/Clock.png" width="50" height="50" alt="100*80"></a>

                        <div class="caption" align="center">
                            <h4>博客管理</h4>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>
<#include "./common/footer.ftl" />
</div>

</body>
</html>