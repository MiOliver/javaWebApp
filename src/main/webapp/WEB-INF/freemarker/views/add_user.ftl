<!DOCTYPE html>
<html lang="zh-CN" xmlns="http://java.sun.com/jsf/facelets">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<#--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">-->
<head>
    <title>Twitter Bootstrap Tutorial </title>
    <#include "./common/base_static_file.ftl" />

    <!-- include summernote css/js-->
    <link href="/resources/css/summernote.css" rel="stylesheet"/>
    <script src="/resources/js/summernote.js"></script>
    <script src="/resources/js/bootstrap-dialog.min.js" type="text/javascript"></script>
    <link href="/resources/css/bootstrap-dialog.min.css" rel="stylesheet">
    <script type="text/javascript" src="/resources/js/bootstrap.js"></script>


    <style type="text/css">
        body {
            background-color: #CCC;
        }
    </style>
    <script type="text/javascript">
        //                        message: '用户添加成功!',
        function refreshPage() {
            window.location.reload();
        }
        $(document).ready(

        );
        function submitUserText(){
            var username = $('#userNameId').val();
            var password = $('#passWordId').val();
            var salt = $('#salt').val();
            console.log(username);
            $.ajax({
                data: {
                    'username': username,
                    'password': password,
                    'salt': salt
                },
                type: "post",
                dataType: 'json',
                url: "/createUser",
                error: function (XMLHttpRequest, error, errorThrown) {
                    console.log("error " + error + ": " + errorThrown);
                    BootstrapDialog.show({
                        message: error.message
                    });
                },
                success: function (data) {
                    BootstrapDialog.show({
                        title: '提示',
                        message: '用户添加成功',
                        buttons: [{
                            label: '确定',
                            action: function (dialog) {
                                refreshPage();
                            }
                        }]
                    });

                }
            });
            return false;
        }

    </script>

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
                <li><a href="/index">Home</a></li>
                <li class="active"><a href="/addblog">Link</a></li>
                <li><a href="/about">About</a></li>
            </ul>
        </div>

    </nav>

    <div class="row" style="background-color: white;border-radius:5px;padding: 20px;  ">
        <div class=" col-md-10">

            <div style="padding: 30px;">
                <h3>添加用户</h3>
                <hr>
                <form action="" method="post" onsubmit="return submitUserText()">
                    <div class="form-group">
                        <label>用户名:</label>
                        <input type="text" class="form-control" style="width: 600px" placeholder="title" id="userNameId" required="true">
                    </div>
                    <div class="form-group">
                        <label>密码:</label>
                        <input type="text" class="form-control" style="width: 600px" placeholder="title" id="passWordId" required="true">
                    </div>

                    <div class="form-group">
                        <label>盐</label>
                        <input type="text" class="form-control" style="width: 600px" placeholder="salt" id="salt">
                    </div>

                    <input type="submit" value="创  建" class="btn"></input>
                </form>
            </div>

        </div>

    </div>
</div>


</body>
</html>