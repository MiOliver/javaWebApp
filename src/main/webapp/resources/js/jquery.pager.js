(function($) {

    $.fn.pager = function(options) {
        var opts = $.extend({}, $.fn.pager.defaults, options);
        return this.each(function() {
            $(this).empty().append(renderpager(parseInt(options.pagenumber), parseInt(options.pagecount), options.buttonClickCallback));
            
        });
    };
    
    function getCookie(name) {  
        var bikky = document.cookie;  
        name += "=";  
        var i = 0;  
        while (i < bikky.length) {  
            var offset = i + name.length;  
            if (bikky.substring(i, offset) == name) {  
                var endstr = bikky.indexOf(";", offset);  
                if (endstr == -1) endstr = bikky.length;  
                return unescape(bikky.substring(offset, endstr));  
            }  
            i = bikky.indexOf(" ", i) + 1;  
            if (i == 0) break;  
        }  
        return null;  
    }  
    var localeStr = getCookie("locale");
    
    // render and return the pager with the supplied options
    function renderpager(pagenumber, pagecount, buttonClickCallback) {

        // setup $pager to hold render
        var $pager = $('<ul class="page"></ul>');

        // add in the previous and next buttons
        if(localeStr=="en_US"){
        	$pager.append(renderButton('Home', pagenumber, pagecount, buttonClickCallback)).append(renderButton('Previous', pagenumber, pagecount, buttonClickCallback));
        }else{
        	$pager.append(renderButton('首页', pagenumber, pagecount, buttonClickCallback)).append(renderButton('上一页', pagenumber, pagecount, buttonClickCallback));
        }        

        // pager currently only handles 10 viewable pages ( could be easily parameterized, maybe in next version ) so handle edge cases
        var startPoint = 1;
        var endPoint = 9;

        if (pagenumber > 4) {
            startPoint = pagenumber - 4;
            endPoint = pagenumber + 4;
        }

        if (endPoint > pagecount) {
            startPoint = pagecount - 8;
            endPoint = pagecount;
        }

        if (startPoint < 1) {
            startPoint = 1;
        }

        // loop thru visible pages and render buttons
        for (var page = startPoint; page <= endPoint; page++) {
            var currentButton = $('<li class="page-number">' + (page) + '</li>');
            page == pagenumber ? currentButton.addClass('pgCurrent') : currentButton.click(function() { buttonClickCallback(this.firstChild.data); });
            currentButton.appendTo($pager);
        }
        // render in the next and last buttons before returning the whole rendered control back.
        if(localeStr=="en_US"){
        	$pager.append(renderButton('Next', pagenumber, pagecount, buttonClickCallback)).append(renderButton('Last', pagenumber, pagecount, buttonClickCallback));
        }else{
        	$pager.append(renderButton('下一页', pagenumber, pagecount, buttonClickCallback)).append(renderButton('末页', pagenumber, pagecount, buttonClickCallback));
        }
        return $pager;
    }

    // renders and returns a 'specialized' button, ie 'next', 'previous' etc. rather than a page number button
    function renderButton(buttonLabel, pagenumber, pagecount, buttonClickCallback) {
        var $Button = $('<li class="pgNext">' + buttonLabel + '</li>');
        var destPage = 1;

        // work out destination page for required button type
        switch (buttonLabel) {
            case "首页":
                destPage = 1;
                break;
            case "上一页":
                destPage = pagenumber - 1;
                break;
            case "下一页":
                destPage = pagenumber + 1;
                break;
            case "末页":
                destPage = pagecount;
                break;
            case "Home":
                destPage = 1;
                break;
            case "Previous":
                destPage = pagenumber - 1;
                break;
            case "Next":
                destPage = pagenumber + 1;
                break;
            case "Last":
                destPage = pagecount;
                break;   
        }

        // disable and 'grey' out buttons if not needed.
        if (buttonLabel == "首页" || buttonLabel == "上一页" || buttonLabel == "Home" || buttonLabel == "Previous") {
            pagenumber <= 1 ? $Button.addClass('pgEmpty') : $Button.click(function() { buttonClickCallback(destPage); });
        }
        else {
            pagenumber >= pagecount ? $Button.addClass('pgEmpty') : $Button.click(function() { buttonClickCallback(destPage); });
        }

        return $Button;
    }

    // pager defaults. hardly worth bothering with in this case but used as placeholder for expansion in the next version
    $.fn.pager.defaults = {
        pagenumber: 1,
        pagecount: 1
    };

})(jQuery);





