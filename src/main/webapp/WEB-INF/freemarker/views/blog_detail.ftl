<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<#--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">-->
<head>
    <title>Oliver's Blogs </title>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
        body {
            background-color: #CCC;
        }

        .scrollToTop {
            width: 100px;
            height: 130px;
            padding: 10px;
            text-align: center;
            background: whiteSmoke;
            font-weight: bold;
            color: #444;
            text-decoration: none;
            position: fixed;
            top: 75%;
            right: 12%;
            display: none;
            background: url('/resources/img/top.png') no-repeat 0px 20px;
        }

        .scrollToTop:hover {
            text-decoration: none;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {

            //Check to see if the window is top if not then display button
            $(window).scroll(function () {
                if ($(this).scrollTop() > 100) {
                    $('.scrollToTop').fadeIn();
                } else {
                    $('.scrollToTop').fadeOut();
                }
            });

            //Click event to scroll to top
            $('.scrollToTop').click(function () {
                $('html, body').animate({scrollTop: 0}, 800);
                return false;
            });

        });
    </script>
</head>
<body>
<div class="container">
<#include "./common/header.ftl"/>


    <div class="row"
         style="background-color: white; border-width: 2px; border-top-left-radius:5px;border-top-right-radius:5px;line-height: 30px;padding: 20px;  ">
        <div class=".col-xs-12 col-md-12">
            <h3>${blog.blogTitle}</h3>
            <div>
                <span class="glyphicon glyphicon-calendar"></span>&nbsp;&nbsp;${blog.createTime?string('yyyy-MM-dd HH:mm:ss')}
                &nbsp;&nbsp;&nbsp;
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
                <a href="#" class="scrollToTop" style="display: block;">Top</a>
            </div>
            <div>
                <label>分享到：</label>
                <!-- JiaThis Button BEGIN -->
                <div class="jiathis_style_32x32">
                    <a class="jiathis_button_qzone"></a>
                    <a class="jiathis_button_tsina"></a>
                    <a class="jiathis_button_tqq"></a>
                    <a class="jiathis_button_weixin"></a>
                    <a class="jiathis_button_renren"></a>
                    <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis"
                       target="_blank"></a>
                    <a class="jiathis_counter_style"></a>
                </div>
                <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
                <!-- JiaThis Button END -->
            </div>

            <div>
            <#if similarBlogList?size &gt; 0>
                <h3>相关阅读</h3>
                <#list similarBlogList as blog >
                    <div class="row">
                        <img src="/resources/img/greenPoint.png" width="12" height="12"><a
                            href="/blogdetail?id=${blog.id}"> ${blog.blogTitle}</a>
                    </div>
                </#list>
            <#else>

            </#if>
            </div>
        </div>


    </div>
<#include "./common/footer.ftl" />
</div>

</body>
</html>