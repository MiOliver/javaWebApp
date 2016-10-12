package com.ning.listener;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.servlet.ServletRequest;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by ning on 10/12/16.
 * @author ning
 * test listener
 */

public class RequestListener implements ServletRequestListener {
    private final Logger logger= LoggerFactory.getLogger(ServletRequestListener.class);
    private static String START="start";

    @Override
    public void requestInitialized(ServletRequestEvent sre) {
        ServletRequest servletRequest=sre.getServletRequest();
        servletRequest.setAttribute(START,System.nanoTime());
    }

    @Override
    public void requestDestroyed(ServletRequestEvent sre) {
        HttpServletRequest httpServletRequest=(HttpServletRequest) sre.getServletRequest();
        long startTime=(Long) httpServletRequest.getAttribute(START);
        long time=(System.nanoTime()-startTime)/1000000;
        String uri=httpServletRequest.getRequestURI();
        logger.info(String.format("uri is %s,execute time is %s: ms",uri,time));

    }


}
