<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<head>
    <title>Oliver's Blogs</title>
<#include "/common/base_static_file.ftl" />
    <script type="text/javascript" src="${rc.contextPath}/resources/js/jquery.pager.js"></script>

    <script src="${rc.contextPath}/resources/js/bootstrap-dialog.min.js" type="text/javascript"></script>
    <link href="${rc.contextPath}/resources/css/bootstrap-dialog.min.css" rel="stylesheet">
    <style type="text/css">
        body {
            background-color: #CCC;
        }

    </style>
    <script type="text/javascript">
        function deleteTool(id) {
            console.log(id);
            $.ajax({
                data: {
                    'id': id
                },
                type: "post",
                dataType: 'json',
                url: "/deleteTool",
                error: function (XMLHttpRequest, error, errorThrown) {
                    console.log("error " + error + ": " + errorThrown);
                    BootstrapDialog.show({
                        message: "error " + error + ": " + errorThrown
                    });
                },
                success: function (data) {
                    BootstrapDialog.show({
                        title: '提示',
                        message: '工具删除成功!',
                        buttons: [
                            {
                                label: '确定',
                                action: function (dialog) {
                                    refreshPage();
                                }
                            }
                        ]
                    });


                }
            });
            return false;
        }
        function refreshPage() {
            window.location.reload();
        }
    </script>
</head>
<body>
<div class="container">
<#include "/common/header.ftl"/>


    <div class="row" style="background-color: white;border-top-left-radius:5px;border-top-right-radius:5px;line-height: 30px;padding: 20px;  ">

        <div class="col-xs-12 col-md-12">
            <h3>工具管理</h3>
            <hr>
            <form  action="/toolManage" method="post" class="form-inline">
                <div class="row">
                    工具搜索：<input type="text" class="form-control" id="searchId" name="toolseach" value="${toolseach}" placeholder="请输入工具标题或者ID" />&nbsp;&nbsp;
                    <input type="submit" class="form-control" value="搜  索"> </input>
                </div>
                <br/>
                <table class="table table-bordered thead-table">
                    <thead>
                    <th>工具ID</th>
                    <th>工具标题</th>
                    <th>创建时间</th>
                    <th>工具创建者</th>
                    <th>操作</th>
                    </thead>
                <#if ( toolList ?? && toolList?size>0)>
                    <#list toolList as tool >
                        <tr>
                            <td>${tool.id }</td>
                            <td>${tool.toolName}</td>
                            <td>${tool.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td>${tool.createPerson}</td>
                            <td>
                                <a href="/updateTool?id=${tool.id}" >
                                    <span class="glyphicon glyphicon-edit" title="编辑" style="font-size: 15"></span></a>
                                &nbsp;&nbsp;
                                <a href="#" onclick="deleteTool(${tool.id })">
                                    <span class="glyphicon glyphicon-remove-sign" title="删除" style="font-size: 15"></span></a>

                            </td>
                        </tr>
                    </#list>
                </#if>
                </table>
            <#include "/common/common_pager_bar.ftl" />
            </form>

        </div>

    </div>
<#include "/common/footer.ftl" />
</div>

</body>
</html>