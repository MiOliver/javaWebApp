package com.ning.controller;

import com.xiaomi.platform.xmybatis.plugins.Pagination;
import org.springframework.stereotype.Controller;

/**
 * Created by ning on 11/3/15.
 */

@Controller
public class BaseController {

    // 分页
    protected Pagination page = new Pagination();
    // 分页显示bar标志
    protected boolean displayPageBar = false;

    public boolean isDisplayPageBar() {
        return displayPageBar;
    }

    public void setDisplayPageBar(boolean displayPageBar) {
        this.displayPageBar = displayPageBar;
    }

    public Pagination getPage() {
        return page;
    }

    public void setPage(Pagination page) {
        this.page = page;
    }
}
