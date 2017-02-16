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
                        message: '房源删除成功!',
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
            <h3>房源管理</h3>
            <hr>
            <form  action="/lianjiaManage" method="post" class="form-inline">
                <div class="row">
                    房源搜索：<input type="text" class="form-control" id="searchId" name="seach" value="${toolseach}" placeholder="请输入房源标题或者ID" />&nbsp;&nbsp;
                    <input type="submit" class="form-control" value="搜  索"> </input>
                </div>
                <br/>
                <table class="table table-bordered thead-table">
                    <thead>
                    <th>房源ID</th>
                    <th>房源标题</th>
                    <th>地区</th>
                    <th>地址</th>
                    <th>描述</th>
                    <th>创建时间</th>
                    <th>操作</th>
                    </thead>
                <#if ( houseList ?? && houseList?size>0)>
                    <#list houseList as house >
                        <tr>
                            <td>${house.id }</td>
                            <td>${house.title}</td>
                            <td>${house.area}</td>
                            <td>${house.address }</td>
                            <td>${house.descri}</td>
                            <td>${house.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td>
                                <a href="/updateTool?id=${tool.id}" >
                                    <span class="glyphicon glyphicon-edit" title="编辑" style="font-size: 18px"></span></a>
                                &nbsp;&nbsp;
                                <a href="#" onclick="deleteTool(${tool.id })">
                                    <span class="glyphicon glyphicon-remove-sign" title="删除" style="font-size: 18px"></span></a>

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