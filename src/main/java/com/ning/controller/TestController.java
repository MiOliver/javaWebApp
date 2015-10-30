package com.ning.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by ning on 10/30/15.
 */

@Controller
public class TestController {

    private static final String TEST="test";

    @RequestMapping(value = "/testbs", method = RequestMethod.GET)
    public String testPage(){
        return TEST;
    }
}
