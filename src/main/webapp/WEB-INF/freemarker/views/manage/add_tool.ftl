<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<head>
    <title>Oliver's Blogs</title>
    <#include "/common/base_static_file.ftl" />
    <script src="/resources/js/bootstrap-dialog.min.js" type="text/javascript"></script>
    <link href="/resources/css/bootstrap-dialog.min.css" rel="stylesheet">
    <style type="text/css">
        body {
            background-color: #CCC;
        }

    </style>
    <script type="text/javascript">

        function refreshPage() {
            window.location.reload();
        }

        function updateTool() {
            var toolId= $('#toolId').val();
            var toolTitle = $('#titleId').val();
            var type = $('#toolTypeId').val();
            var toolUrl = $('#toolUrlId').val();
            var icon = $('#toolIconId').val();;

            console.log(toolId);
            console.log(toolTitle);
            $.ajax({
                data: {
                    'id': toolId,
                    'toolName': toolTitle,
                    'type': type,
                    'toolUrl': toolUrl,
                    'toolIcon': icon
                },
                type: "post",
                dataType: 'json',
                url: "/updateTool",
                error: function (XMLHttpRequest, error, errorThrown) {
                    console.log("error " + error + ": " + errorThrown);
                    BootstrapDialog.show({
                        message: '更新失败!'
                    });
                },
                success: function (data) {
                    BootstrapDialog.show({
                        title: '提示',
                        message: '更新成功!',
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
<#include "/common/header.ftl"/>


    <div class="row" style="background-color: white;border-top-left-radius:5px;border-top-right-radius:5px;line-height: 30px;padding: 20px;  ">

        <div class="col-xs-12 col-md-12">
            <#if update == false>
               <div style="padding: 30px;">
                   <h3>添加工具</h3>
                   <hr>
                   <form action="/postTool" method="post">
                       <div class="form-group">
                           <label>工具标题:</label>
                           <input type="text" class="form-control" style="width: 100%" placeholder="title" id="" name="toolName"
                                  required="true">
                       </div>
                       <div class="form-group">
                           <label>工具连接:</label>
                           <input type="text" class="form-control" style="width: 100%" placeholder="title" id="" name="toolUrl"
                                  required="true">
                       </div>

                       <div class="form-group">
                           <label>工具类型</label>
                           <input type="text" class="form-control" style="width: 100%" placeholder="tags" id="tags" name="type" required="true">
                       </div>

                       <div class="form-group">
                           <label>工具配图:</label>
                           <input type="text" class="form-control" style="width: 100%" placeholder="title"   name="toolIcon" >
                       </div>

                       <input type="submit" value="创  建" class="btn btn-success">
                   </form>
               </div>
            <#else >
                <div style="padding: 30px;">
                    <h3>修改工具</h3>
                    <hr>
                <#--<form ac method="post">-->
                    <form action="" method="post">
                        <div class="form-group">
                            <label>工具标题:</label>
                            <input type="text" class="form-control" style="width: 100%" placeholder="title" id="titleId" name="toolName" value="${tool.toolName}"
                                   required="true">
                            <input type="hidden" id="toolId" value="${tool.id}">
                        </div>
                        <div class="form-group">
                            <label>工具连接:</label>
                            <input type="text" class="form-control" style="width: 100%" placeholder="title" id="toolUrlId" name="toolUrl" value="${tool.toolUrl}"
                                   required="true">
                        </div>

                        <div class="form-group">
                            <label>工具类型</label>
                            <input type="text" class="form-control" style="width: 100%" placeholder="type" id="toolTypeId" name="type" value="${tool.type}">
                        </div>

                        <div class="form-group">
                            <label>工具配图:</label>
                            <input type="text" class="form-control" style="width: 100%" placeholder="title"  id="toolIconId"  name="toolIcon" value="${tool.toolIcon}"  required="true">
                        </div>

                        <input type="button" value="更 新" class="btn btn-success" onclick="updateTool()">
                    </form>
                </div>
            </#if>
        </div>

    </div>
<#include "/common/footer.ftl" />
</div>

</body>
</html>