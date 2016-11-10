package com.ning.controller;


import com.ning.controller.base.BaseController;
import com.ning.dao.Tool;
import com.ning.domain.BlogContent;
import com.ning.domain.BlogSearchVO;
import com.ning.domain.User;
import com.ning.serviceimpl.BlogServiceImpl;
import com.ning.serviceimpl.RedisService;
import com.ning.serviceimpl.ToolService;
import com.ning.services.IToolService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.*;

/**
 * The type Main controller.
 */
/*There must be a Controller annotation or the application will doesn't work .*/
@Controller
public class MainController extends BaseController {


    @Autowired
    private BlogServiceImpl blogService;
    @Autowired
    private RedisService redisService;
    @Resource
    private IToolService toolService;

    private static int COUNTER = 0;
    private static final String VIEW_INDEX = "index";
    private static final String LIFE_INDEX = "life";
    private static final String ADDVIEW = "add";
    private static final String USERLIST = "user_list";
    private static final String TEST = "test";
    private static final String TIME_LINE = "timeline";
    private static final String ABOUT = "about";
    private static final String TOOLS = "tools";
    private static final Logger logger = LoggerFactory.getLogger(MainController.class);

    private List<User> userList;
    private List<BlogContent> blogList;
    private List<BlogContent> bestVisitBlogList;
    private List<String> tags;

    /**
     * Welcome string.
     *
     * @param model the model
     * @return the string
     */
    @RequestMapping(value = "/dd", method = RequestMethod.GET)
    public String welcome(ModelMap model) {
        model.addAttribute("message", "Welcome");
        model.addAttribute("counter", ++COUNTER);
        logger.debug("[Welcome counter :{}", COUNTER);
        return VIEW_INDEX;//返回index.jsp
    }

    /**
     * Indexpage model and view.
     *
     * @param model     the model
     * @param request   the request
     * @param principal the principal
     * @return the model and view
     */
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
        mv.addObject("tagList", redisService.getTags());
        return mv;
    }

    /**
     * Lifepage model and view.
     *
     * @param model the model
     * @return the model and view
     */
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
        mv.addObject("tagList", redisService.getTags());
        return mv;
    }


    /**
     * Addview string.
     *
     * @return the string
     */
    @RequestMapping(value = "/addview",method = RequestMethod.GET)
    public String addview(){
        return ADDVIEW;
    }

    /**
     * Add model and view.
     *
     * @param request the request
     * @return the model and view
     */
    @RequestMapping(value = "/adduser",method = RequestMethod.POST)
    public ModelAndView add(HttpServletRequest request){

        ModelAndView mav = new ModelAndView(USERLIST);
        //将参数返回给页面
        mav.addObject(userList);
        return mav;
    }

    /**
     * Userlist string.
     *
     * @param model the model
     * @return the string
     */
    @RequestMapping(value = "/user_list",method = RequestMethod.GET)
    public String userlist(Model model){

        return USERLIST;
    }

    /**
     * Test string.
     *
     * @param model the model
     * @return the string
     */
    @RequestMapping(value = "/test",method = RequestMethod.GET)
    public String test(Model model){
        return TEST;
    }


    /**
     * Time line model and view.
     *
     * @param request the request
     * @return the model and view
     */
    @RequestMapping(value = "/timeline",method = RequestMethod.GET)
    public ModelAndView timeLine(HttpServletRequest request){
        String tag=request.getParameter("tag")==null?"":request.getParameter("tag");
        ModelAndView mv=new ModelAndView(TIME_LINE);
        BlogSearchVO searchVO=new BlogSearchVO();
        if(tag.length()>0){
            searchVO.setTag(tag);
        }
        blogList=blogService.getBlogList(page,searchVO);
        blogList=blogService.getFixBlogList(blogList);
        if (blogList != null && blogList.size() > 0) {
            this.setDisplayPageBar(true);
        } else {
            blogList = null;
            this.setDisplayPageBar(false);
        }
        mv.addObject("blogList",blogList);
        return mv ;
    }

    /**
     * About model and view.
     *
     * @return the model and view
     */
    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public ModelAndView about() {
        ModelAndView mv=new ModelAndView(ABOUT);
        return mv;
    }

    /**
     * Tool model and view.
     *
     * @return the model and view
     */
    @RequestMapping(value = "/tools", method = RequestMethod.GET)
    public ModelAndView tool() {
        Tool tool=new Tool();
        List<Tool> toolList= toolService.getToolsbyPage(page,tool);
        ModelAndView mv=new ModelAndView(TOOLS);
        mv.addObject("toolList",toolList);
        return mv;
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

