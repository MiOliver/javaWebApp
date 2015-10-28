package com.ning.controller;

import org.omg.CORBA.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by ning on 10/23/15.
 */
@Controller
public class ManageController {

    private static final String PAGE_MANAGE="manage";
    private static final String LOGIN="login";

    @RequestMapping(value = "manage",method= RequestMethod.GET)
     public String base(Model model){
        model.addAttribute("admin","admin");
        return PAGE_MANAGE;
    }
    @RequestMapping(value = "login",method= RequestMethod.GET)
    public String login(Model model){
        return LOGIN;
    }
}
