package com.ning.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

/**
 * Created by ning on 10/23/15.
 */

//如果你不喜欢使用xml配置而喜欢注解的话，没关系，Servlets API同样提供了一些注解接口给你。你可以像下面的例子一样使用
// @WebServlet 注解并且不需要在web.xml里为Servlet注册任何信息。容器会自动注册你的Servlet到运行环境，并且像往常一样处理它。
//@WebServlet(name="TemServlet",urlPatterns = {"/servlet"})
public class TemServlet extends HttpServlet {

    Logger logger = LoggerFactory.getLogger(TemServlet.class);

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.service(req, resp);
    }

    @Override
    public void destroy() {
        super.destroy();
        System.out.println("=========>> servlet destroy");
    }

    @Override
    public void init() throws ServletException {
        super.init();
        System.out.println("=========>> servlet init");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doGet(req, resp);
        resp.setContentType("text/html;charset=UTF-8");
        resp.sendRedirect("/addview");
        logger.info("temservlet call");
        logger.debug("With params: time: {}, name: {}", System.nanoTime(), "Bingo");
        PrintWriter out = resp.getWriter();
        try {
            // Write some content
            out.println("<html>");
            out.println("<head>");
            out.println("<title>CalendarServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h2>The time right now is : " + new Date() + "</h2>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }

    }
}
