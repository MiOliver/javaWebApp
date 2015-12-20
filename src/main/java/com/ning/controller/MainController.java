package com.ning.controller;


import com.ning.domain.BlogContent;
import com.ning.domain.BlogSearchVO;
import com.ning.domain.User;
import com.ning.serviceimpl.BlogServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.*;

/*There must be a Controller annotation or the application will doesn't work .*/
@Controller
public class MainController extends BaseController{


    @Autowired
    private BlogServiceImpl blogService;

    private static int COUNTER = 0;
    private static final String VIEW_INDEX = "index";
    private static final String LIFE_INDEX = "life";
    private static final String ADDVIEW = "add";
    private static final String USERLIST = "user_list";
    private static final String TEST = "test";
    private static final Logger logger = LoggerFactory.getLogger(MainController.class);

    private List<User> userList;
    private List<BlogContent> blogList;
    private List<BlogContent> bestVisitBlogList;

    @RequestMapping(value = "/dd", method = RequestMethod.GET)
    public String welcome(ModelMap model) {
        model.addAttribute("message", "Welcome");
        model.addAttribute("counter", ++COUNTER);
        logger.debug("[Welcome counter :{}", COUNTER);
        return VIEW_INDEX;//返回index.jsp
    }

    @RequestMapping(value = {"/","/index",}, method = RequestMethod.GET)
    public ModelAndView indexpage(ModelMap model,HttpServletRequest request, Principal principal) {
        if(principal!=null){
            if(this.getUser(principal.toString())==null){
                setAdminFromCookie(request);
            }
        }
        ModelAndView mv=new ModelAndView(VIEW_INDEX);
        BlogSearchVO searchVO=new BlogSearchVO();
        searchVO.setType(1);
        blogList=blogService.getBlogList(page,searchVO);
        blogList=blogService.getFixBlogList(blogList);
        bestVisitBlogList=blogService.getBestList();
        if (blogList != null && blogList.size() > 0) {
            this.setDisplayPageBar(true);
        } else {
            blogList = null;
            this.setDisplayPageBar(false);
        }
        mv.addObject("displayPageBar",displayPageBar);
        mv.addObject("page",page);
        mv.addObject("blogList",blogList);
        mv.addObject("bestBlogList",bestVisitBlogList);
        mv.addObject("user",this.getUser());
        return mv;
    }

    @RequestMapping(value = {"/life",}, method = RequestMethod.GET)
    public ModelAndView lifepage(ModelMap model) {
        ModelAndView mv=new ModelAndView(LIFE_INDEX);
        BlogSearchVO searchVO=new BlogSearchVO();
        searchVO.setType(2);
        blogList=blogService.getBlogList(page,searchVO);
        blogList=blogService.getFixBlogList(blogList);
        bestVisitBlogList=blogService.getBestList();
        if (blogList != null && blogList.size() > 0) {
            this.setDisplayPageBar(true);
        } else {
            blogList = null;
            this.setDisplayPageBar(false);
        }
        mv.addObject("displayPageBar",displayPageBar);
        mv.addObject("page",page);
        mv.addObject("blogList",blogList);
        mv.addObject("bestBlogList",bestVisitBlogList);
        return mv;
    }

    @RequestMapping(value = "/addview",method = RequestMethod.GET)
    public String addview(){
        return ADDVIEW;
    }

    @RequestMapping(value = "/adduser",method = RequestMethod.POST)
    public ModelAndView add(HttpServletRequest request){

        ModelAndView mav = new ModelAndView(USERLIST);
        //将参数返回给页面
        mav.addObject(userList);
        return mav;
    }

    @RequestMapping(value = "/user_list",method = RequestMethod.GET)
    public String userlist(Model model){

        return USERLIST;
    }


    /***
     * 验证参数是否为空
     * @param params
     * @return
     */
    private boolean checkParams(String[] params){
        for(String param:params){
            if(param==""||param==null||param.isEmpty()){
                return false;
            }
        }
        return true;
    }



}

