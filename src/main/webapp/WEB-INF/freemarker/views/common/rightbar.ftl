<div class="col-xs-3 col-sm-3">
    <div align="center">
        <h4>微信公众号</h4>
        <p align="center">
            <img src="${rc.contextPath}/resources/img/qrcode_wx.jpg" width="95%" height="50%" >
        </p>

    </div>

    <div>
        <hr style="border-width: 2px;border-color: #303A52">
        <h4>标签</h4>
        <div >
        <#if (tagList?? && tagList?size>0) >
            <#list tagList as tag >
                <a href="${rc.contextPath}/timeline?tag=${tag}"><span class="glyphicon glyphicon-tag" style="margin-right: 5px">${tag}</span></a>
            </#list>
        </#if>
        </div>

    </div>

    <div>
        <hr style="border-width: 2px;border-color: #303A52">
        <h4>最近文章</h4>
    <#if (blogList?? && blogList?size>0) >
        <#list blogList as blog >
            <div class="row">
                <img src="${rc.contextPath}/resources/img/greenPoint.png" width="12" height="12"><a href="${rc.contextPath}/blogdetail?id=${blog.id}"> ${blog.blogTitle}</a>
            </div>
        </#list>
    </#if>
    </div>
    <div>
        <hr style="border-width: 2px;border-color: #303A52">
        <h4>最多访问</h4>
    <#if (bestBlogList?? && bestBlogList?size> 0)>
        <#list bestBlogList as blog >
            <div class="row">
                <img src="${rc.contextPath}/resources/img/greenPoint.png" width="12" height="12"><a href="${rc.contextPath}/blogdetail?id=${blog.id}"> ${blog.blogTitle}</a>
            </div>
        </#list>
    </#if>
    </div>
</div>