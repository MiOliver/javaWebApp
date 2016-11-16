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
        function deleteType(id) {
            $.ajax({
                data: {
                    'id': id
                },
                type: "post",
                dataType: 'json',
                url: "/deleteType",
                error: function (XMLHttpRequest, error, errorThrown) {
                    console.log("error " + error + ": " + errorThrown);
                    BootstrapDialog.show({
                        message: "error " + error + ": " + errorThrown
                    });
                },
                success: function (data) {
                    BootstrapDialog.show({
                        title: '提示',
                        message: '类别删除成功!',
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
            <h3>类别管理</h3>
            <hr>
            <form  action="/subTitleManage" method="post" class="form-inline">
                <div class="row">
                    类别搜索：<input type="text" class="form-control" id="searchId" name="search" value="${search}" placeholder="请输入类别标题或者ID" />&nbsp;&nbsp;
                    <input type="submit" class="form-control" value="搜  索"> </input>
                </div>
                <br/>
                <table class="table table-bordered thead-table">
                    <thead>
                    <th>类别ID</th>
                    <th>类别标题</th>
                    <th>类别图</th>
                    <th>创建时间</th>
                    <th>类别创建者</th>
                    <th>操作</th>
                    </thead>
                <#if ( typeList ?? && typeList?size>0)>
                    <#list typeList as type >
                        <tr>
                            <td>${type.id }</td>
                            <td>${type.subTitle}</td>
                            <td><img src="${type.imageUrl}" width="30" height="30"/></td>
                            <td>${type.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                            <td>${type.createPerson}</td>
                            <td>
                                <a href="/updateType?id=${type.id}" >
                                    <span class="glyphicon glyphicon-edit" title="编辑" style="font-size: 18px"></span></a>
                                &nbsp;&nbsp;
                                <a href="#" onclick="deleteType(${type.id })">
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