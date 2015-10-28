package com.ning.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by ning on 15-10-25.
 */


@Controller
public class BlogController {

    private static final String ADDBLOG ="add_blog";

    @RequestMapping(value = "/addblog", method = RequestMethod.GET)
    public String blogCategoryView(){
        return ADDBLOG;
    }
}
