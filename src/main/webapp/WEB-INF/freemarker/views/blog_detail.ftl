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
    <h1>Keep calm and Carry on</h1>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">
                    <img alt="Brand" src="/resources/img/Dolphin.png" width="25" height="25">
                </a>
            </div>
            <ul class="nav navbar-nav">
                <li ><a href="/index">首页</a></li>
                <li ><a href="/addblog">生活</a></li>
                <li><a href="/about">关于</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
            <@shiro.user>
                <li><a href="#"><span class="glyphicon glyphicon-user">&nbsp;<@shiro.principal/></span> </a></li>
                <li><a href="/logout">注销</a></li>
            </@shiro.user>
            <@shiro.guest>
                <li><a href="/login"><span class="glyphicon glyphicon-user">&nbsp;游客</span> </a></li>
            </@shiro.guest>

            </ul>
        </div>



    </nav>


    <div class="row" style="background-color: white;border-radius:5px;line-height: 30px;padding: 20px;  ">
        <div class=".col-xs-6 col-md-9">
            <h3>${blog.blogTitle}</h3>
            <div>
                <span class="glyphicon glyphicon-calendar"></span>&nbsp;&nbsp;${blog.createTime?string('yyyy-MM-dd HH:mm:ss')} &nbsp;&nbsp;&nbsp;
                <span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;${blog.createPerson}&nbsp;&nbsp;&nbsp;
                阅读次数：<span class="badge" style="background-color: yellowgreen">${blog.visitCount}</span>&nbsp;&nbsp&nbsp;&nbsp;&nbsp;
            </div>
            <div>
                标签：
            <#if blog.tags?length &gt;0 >
                <#list blog.tags?split(" ") as tag >
                    <span class="label label-default">${tag}</span>
                </#list>
            </#if>

            </div>
            <p>${blog.blogContent}</p>
            <br>
            <p class="text-primary">如果您觉得文章还不错，记得分享给朋友们，O(∩_∩)O~</p>
            <hr>
            <div>
                <label>分享到：</label>
                <!-- JiaThis Button BEGIN -->
                <div class="jiathis_style_32x32">
                    <a class="jiathis_button_qzone"></a>
                    <a class="jiathis_button_tsina"></a>
                    <a class="jiathis_button_tqq"></a>
                    <a class="jiathis_button_weixin"></a>
                    <a class="jiathis_button_renren"></a>
                    <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
                    <a class="jiathis_counter_style"></a>
                </div>
                <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
                <!-- JiaThis Button END -->
            </div>
        </div>
        <div class=".col-xs-6 col-md-3">
            <div>

                <#if similarBlogList?size &gt; 0>
                    <h3>相关阅读</h3>
                    <#list similarBlogList as blog >
                        <div class="row">
                            <img src="/resources/img/greenPoint.png" width="12" height="12"><a href="/blogdetail?id=${blog.id}"> ${blog.blogTitle}</a>
                        </div>
                    </#list>
                <#else>

                </#if>
                </ul>
            </div>
            <#--<div>-->
                <#--<h2>Sidebar</h2>-->
                <#--<ul class="nav-tabs-justified">-->
                    <#--<li><a href="#">Another Link 1</a></li>-->
                    <#--<li><a href="#">Another Link 2</a></li>-->
                    <#--<li><a href="#">Another Link 3</a></li>-->
                <#--</ul>-->
            <#--</div>-->
        </div>
    </div>
</div>

</body>
</html>