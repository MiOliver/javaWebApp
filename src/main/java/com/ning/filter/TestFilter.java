package com.ning.filter;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by ning on 10/23/15.
 */
public class TestFilter implements Filter {

    private String filterName=this.getClass().getName();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("=========>>"+filterName+": init");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("=========>>"+filterName+": doFilter");
        HttpServletRequest req = (HttpServletRequest)request;
        System.out.println("拦截 URI="+req.getRequestURI());
        //get all cookies
//        Cookie[] cookies = req.getCookies();
//        for(Cookie cookie : cookies)
//        {
//            cookie.getName();
//            cookie.getValue();
//            System.out.println("Cookies:"+"name->"+cookie.getName()+"\n"+"value->"+cookie.getValue());
//        }
//        System.out.println("session="+req.getSession());
        chain.doFilter(request, response);


    }

    @Override
    public void destroy() {
        System.out.println("=========>>"+filterName+": destroy");
    }
}
