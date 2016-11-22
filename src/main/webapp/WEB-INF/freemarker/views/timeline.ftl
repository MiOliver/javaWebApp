<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">

<head>
    <title>Oliver's Blogs</title>
    <#include "./common/base_static_file.ftl"/>
    <link href="${rc.contextPath}/resources/css/timeline_style.css" rel="stylesheet">
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
    <div class="col-xs-12 col-sm-12" style="background-color: #FFF">
        <ul class="timeline">
            <#list blogList as blog >

                    <#if (blog_index%2 ==0)>
                        <li>
                            <div class="timeline-badge">
                                <i class="glyphicon glyphicon-map-marker"></i>
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                  <h4 class="timeline-title">${blog.blogTitle}</h4>
                                    <p>
                                        <small class="text-muted"><i class="glyphicon glyphicon-time"></i> ${blog.createTime?string('yyyy-MM-dd HH:mm:ss')}</small>
                                    </p>
                                </div>
                                <div class="timeline-body">
                                    <p>
                                    ${blog.blogContent}
                                    </p>
                                    <p>
                                        <a href="${rc.contextPath}/blogdetail?id=${blog.id}"> more >>></a>
                                    </p>
                                </div>
                            </div>
                        </li>
                    <#else>
                        <li class="timeline-inverted">
                            <div class="timeline-badge">
                                <i class="glyphicon glyphicon-map-marker"></i>
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4 class="timeline-title">${blog.blogTitle}</h4>
                                    <p>
                                        <small class="text-muted"><i class="glyphicon glyphicon-time"></i> ${blog.createTime?string('yyyy-MM-dd HH:mm:ss')}</small>
                                    </p>
                                </div>
                                <div class="timeline-body">
                                    <p>
                                    ${blog.blogContent}
                                    </p>
                                    <p>
                                        <a href="${rc.contextPath}/blogdetail?id=${blog.id}"> more >>></a>
                                    </p>
                                </div>
                            </div>
                        </li>
                    </#if>

            </#list>
        </ul>
        </div>
        </div>

<#include "./common/footer.ftl" />
</div>


</body>
</html>