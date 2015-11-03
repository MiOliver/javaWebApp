<!-- 列表下分页条 -->
<#if displayPageBar>

        每页显示: 
        <select name="pageSizeName" id="pageSize" onChange="getSelectValue();"  class="form-control" style="width:80px;">
            <option value="10"<#if page.pageSize == 10> selected</#if>>10</option>
            <option value="20"<#if page.pageSize == 20> selected</#if>>20</option>
            <option value="50"<#if page.pageSize == 50> selected</#if>>50</option>
            <option value="100"<#if page.pageSize == 100> selected</#if>>100</option>
            <option value="300"<#if page.pageSize == 300> selected</#if>>300</option>
            <option value="500"<#if page.pageSize == 500> selected</#if>>500</option>
            <option value="1000"<#if page.pageSize == 1000> selected</#if>>1000</option>
        </select>总记录数: ${page.totalCount} (共${page.pageCount}页)
       <script type="text/javascript">
			$().ready( function() {
				
				var $pager = $("#pager");
				
				$pager.pager({
					pagenumber: ${page.pageNumber},
					pagecount: ${page.pageCount},
					buttonClickCallback: $.gotoPage
				});
			
			})
			
			function getSelectValue(){
				     var   myid   =   document.getElementById("pageSize"); 
				     var text=myid.options[myid.selectedIndex].text;   
				     document.getElementById("switchPageSize").value =text;
			}
		</script>
		<span id="pager"></span>
		<input type="hidden" name="page.pageNumber" id="pageNumber" value="${page.pageNumber}" />
		<input type="hidden" name="page.pageSize" id="switchPageSize" value="${page.pageSize}" />
<#else>
<div class="noRecord" style="margin:10px;">没有找到任何记录!</div>
</#if>
