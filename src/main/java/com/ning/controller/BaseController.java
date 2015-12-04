package com.ning.controller;

import com.ning.domain.BasicConstants;
import com.ning.utils.JsonUtil;
import com.xiaomi.platform.xmybatis.plugins.Pagination;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ning on 11/3/15.
 */

@Controller
public class BaseController {

    private static final long serialVersionUID = 6718838822334455667L;
    private static final Logger logger = LoggerFactory.getLogger(BaseController.class);
    private static final String HEADER_ENCODING = "UTF-8";
    private static final boolean HEADER_NO_CACHE = true;
    private static final String HEADER_TEXT_CONTENT_TYPE = "text/plain";
    private static final String HEADER_JSON_CONTENT_TYPE = "text/plain";

    public static final String STATUS_PARAMETER_NAME = "status";
    public static final String MESSAGE_PARAMETER_NAME = "message";
    public static final String OBJ_PARAMETER_NAME = "var";

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

    // 操作状态（警告、错误、成功）
    public enum Status {
        warn, error, success
    }

    private HttpServletResponse initResponse(String contentType) {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType(contentType + ";charset=" + HEADER_ENCODING);
        if (HEADER_NO_CACHE) {
            response.setDateHeader("Expires", 1L);
            response.addHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-cache, no-store, max-age=0");
        }
        return response;
    }


    // 根据操作状态、消息内容输出AJAX
    protected String ajax(Status status, String message) {
        HttpServletResponse response = initResponse(HEADER_JSON_CONTENT_TYPE);
        Map<String, String> jsonMap = new HashMap<String, String>();
        jsonMap.put(STATUS_PARAMETER_NAME, status.toString());
        jsonMap.put(MESSAGE_PARAMETER_NAME, message);
        JsonUtil.toJson(response, jsonMap);
        return BasicConstants.NONE;
    }

    // 根据操作状态、消息内容输出AJAX
    protected String ajax(Status status, Object object) {
        HttpServletResponse response = initResponse(HEADER_JSON_CONTENT_TYPE);
        Map<String, Object> jsonMap = new HashMap<String, Object>();
        jsonMap.put(STATUS_PARAMETER_NAME, status.toString());
        jsonMap.put(OBJ_PARAMETER_NAME, object);
        JsonUtil.toJson(response, jsonMap);
        return BasicConstants.NONE;;
    }
}
