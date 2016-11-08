package com.ning.controller;

import com.ning.domain.BlogContent;
import com.ning.serviceimpl.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ning on 10/30/15.
 */

@Controller
public class TestController {

    private static final String TEST = "test";
    private static final String ECHARTEST = "echars_test";
    private static final String REDIS = "redis_test";

    @Autowired
    private RedisService redisService;

    private Map<String, Object> map;

    @RequestMapping(value = "/testbs", method = RequestMethod.GET)
    public String testPage() {
        return TEST;
    }

    @RequestMapping(value = "/echarTest", method = RequestMethod.GET)
    public String echarTest() {
        return ECHARTEST;
    }

    @RequestMapping(value = "/redis", method = RequestMethod.GET)
    public String redisTest(HttpServletRequest request) {
        String userId = request.getUserPrincipal().getName();
        String url = request.getRequestURL().toString();
        redisService.addLink(userId, url);
        return REDIS;
    }

    @RequestMapping(value = "/getlink", method = RequestMethod.GET)
    public ModelAndView getlinkTest(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView(REDIS);
        String userId = request.getUserPrincipal().getName();
        String url = request.getRequestURL().toString();
        List<String> values = redisService.getLink(userId);
        modelAndView.addObject("list", values);
        return modelAndView;
    }


    @RequestMapping(value = "/addhash", method = RequestMethod.GET)
    public String addhash(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name").trim().toString();
        String value = request.getParameter("value").trim().toString();
        redisService.addHash(name, value);
        return REDIS;
    }

    @RequestMapping(value = "/sethash", method = RequestMethod.GET)
    public String sethash(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name").trim().toString();
        String value = request.getParameter("value").trim().toString();
        redisService.setHash(name, value);
        return REDIS;
    }

    @RequestMapping(value = "/getall", method = RequestMethod.GET)
    public ModelAndView getAllHash(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView(REDIS);
        Map<String,Object> values = redisService.getHash();
        modelAndView.addObject("map", values);
        return modelAndView;
    }


    @RequestMapping(value = "/append", method = RequestMethod.GET)
    public String StringAppend(HttpServletRequest request, HttpServletResponse response) {
        String key = request.getParameter("key").trim().toString();
        String value = request.getParameter("value").trim().toString();
        redisService.append(key, value);
        return REDIS;
    }


    @RequestMapping(value = "/getstr", method = RequestMethod.GET)
    public ModelAndView getString(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView(REDIS);
        String key = request.getParameter("key").trim().toString();
        String value = redisService.getString(key);
        modelAndView.addObject("string", value);
        return modelAndView;
    }

}
