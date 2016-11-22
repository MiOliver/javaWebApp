<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<head>
    <title>后台管理</title>
<#include "./common/base_static_file.ftl"/>
    <style type="text/css">
        body {
            background-color: #CCC;
        }
        .row .btn:not(.btn-block) { width:120px;margin-bottom:10px; margin-left: 20px;}

    </style>
</head>
<body>
<div class="container">
<#include "./common/header.ftl"/>

    <div class="row" style="background-color: white;border-top-left-radius:5px;border-top-right-radius:5px;line-height: 30px;padding: 20px;  ">
        <div class="col-sm-12 col-md-12">
            <h3>缓存管理</h3>
            <hr>
            <div class="row">
                <a href="/cleanTags" class="btn btn-primary btn-normal" role="button" ><span class="glyphicon glyphicon-list-alt"></span> <br/>标签清理</a>

            </div>
        </div>

    </div>
<#include "./common/footer.ftl" />
</div>

</body>
</html>