package com.ning.controller;

import com.ning.domain.BlogContent;
import com.ning.serviceimpl.BlogServiceImpl;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;

/**
 * Created by ning on 10/23/15.
 */
@Controller
public class ManageController extends BaseController{

    private static final String PAGE_MANAGE="manage";
    private static final String LOGIN="login";
    private static final String BLOGMANAGE="blog_manage";

    @Autowired
    private BlogServiceImpl blogService;

    @RequestMapping(value = "manage",method= RequestMethod.GET)
     public String base(Model model){
        model.addAttribute("admin","admin");
        return PAGE_MANAGE;
    }
    @RequestMapping(value = "login",method= RequestMethod.GET)
    public String login(Model model){
        return LOGIN;
    }
    @RequestMapping(value = "blogManage",method= RequestMethod.GET)
    public ModelAndView blogManage(){
        ModelAndView mv=new ModelAndView(BLOGMANAGE);
        List<BlogContent> blogList=blogService.getBlogList(page);
        mv.addObject("displayPageBar",displayPageBar);
        mv.addObject("page",page);
        mv.addObject("blogList",blogList);
        if (blogList != null && blogList.size() > 0) {
            this.setDisplayPageBar(true);
        } else {
            blogList = null;
            this.setDisplayPageBar(false);
        }
        return mv;
    }


}
