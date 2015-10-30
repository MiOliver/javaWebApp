package com.ning.controller;


import com.ning.domain.BlogContent;
import com.ning.domain.User;
import com.ning.serviceimpl.BlogServiceImpl;
import com.ning.serviceimpl.UserServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/*There must be a Controller annotation or the application will doesn't work .*/
@Controller
public class BaseController {

    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private BlogServiceImpl blogService;

    private static int counter = 0;
    private static final String VIEW_INDEX = "index";
    private static final String ADDVIEW = "add";
    private static final String USERLIST = "user_list";
    private static final String TEST = "test";
    private static final Logger logger = LoggerFactory.getLogger(BaseController.class);

    private User user;
    private List<User> userList;
    private List<BlogContent> blogList;

    @RequestMapping(value = "/dd", method = RequestMethod.GET)
    public String welcome(ModelMap model) {
        model.addAttribute("message", "Welcome");
        model.addAttribute("counter", ++counter);
        logger.debug("[Welcome counter :{}", counter);
        return VIEW_INDEX;//返回index.jsp
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView indexpage(ModelMap model) {
        ModelAndView mv=new ModelAndView(VIEW_INDEX);
        blogList=blogService.getBlogList();
        mv.addObject("blogList",blogList);
        return mv;
    }


    @RequestMapping(value = "/{name}", method = RequestMethod.GET)
    public String welcome(@PathVariable String name, ModelMap model) {
        model.addAttribute("message", "Welcome " + name);
        model.addAttribute("counter", ++counter);
        logger.debug("[Welcome counter :{}", counter);
        return VIEW_INDEX;//返回index.jsp
    }

    @RequestMapping(value = "/succ", method = RequestMethod.POST)
    public ModelAndView login(String username, String password) {
    //验证传递过来的参数是否正确，否则返回到登陆页面。
        if (this.checkParams(new String[]{username, password})) {
            System.out.println("success");
            //指定要返回的页面为succ.jsp
            ModelAndView mav = new ModelAndView("succ");
            //将参数返回给页面
            mav.addObject("username", username);
            mav.addObject("password", password);
            return mav;
        }
        System.out.println("error");
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/addview",method = RequestMethod.GET)
    public String addview(){
        return ADDVIEW;
    }

    @RequestMapping(value = "/adduser",method = RequestMethod.POST)
    public ModelAndView add(HttpServletRequest request){
        System.out.println(request.getParameter("userName"));
        System.out.println(request.getParameter("password"));
        User user =new User();
        user.setUserName(request.getParameter("userName"));
        user.setPassword(request.getParameter("password"));
        user.setAge(Integer.valueOf(request.getParameter("age")));
        userService.addUser(user);
        userList= userService.getUserList();
        ModelAndView mav = new ModelAndView(USERLIST);
        //将参数返回给页面
        mav.addObject(userList);
        return mav;
    }

    @RequestMapping(value = "/user_list",method = RequestMethod.GET)
    public String userlist(Model model){
        userList= userService.getUserList();
        model.addAttribute(userList);
        return USERLIST;
    }


    @RequestMapping(value = "/test",method = RequestMethod.GET)
    public String test(ModelMap model){
        user =new User();
        user.setId(1);
        user.setAge(23);
        userService.put(user);
        userService.test();
        model.addAttribute(user);
        return TEST;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


}

