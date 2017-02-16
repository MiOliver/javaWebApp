package com.ning.controller;

import com.alibaba.druid.util.StringUtils;
import com.ning.controller.base.BaseController;
import com.ning.dao.HouseRecord;
import com.ning.dao.Tool;
import com.ning.domain.*;
import com.ning.serviceimpl.BlogServiceImpl;
import com.ning.serviceimpl.ManageService;
import com.ning.serviceimpl.RedisService;
import com.ning.services.ILjService;
import com.ning.services.IToolService;
import com.ning.utils.CommonUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ning on 10/23/15.
 */
@Controller
public class ManageController extends BaseController {
    private static final Logger logger= LoggerFactory.getLogger(ManageController.class);

    @Autowired
    private BlogServiceImpl blogService;
    @Autowired
    private ManageService manageService;
    @Resource
    private IToolService toolService;
    @Resource
    private RedisService redisService;

    @Resource
    private ILjService ljService;


    private static final String PAGE_MANAGE="manage";
    private static final String LOGIN="login";
    private static final String UNAUTHORIZED="unauthorized";
    private static final String BLOGMANAGE="blog_manage";
    private static final String TOOLMANAGE="manage/tool_manage";
    private static final String TITLEMANAGE="manage/title_manage";
    private static final String LOGOUT="logoutsucc";
    private static final String ADDUSER="add_user";
    private static final String ADDSUBTITLE="manage/add_title";
    private static final String REDISMANAGE="manage/redis_manage";
    private static final String ADDTOOL="manage/add_tool";
    private static final String ADDBLOG = "add_blog";

    private static final String LJManage="manage/lianjia_manage";

    private Map<String, Object> map;
    private BlogContent blog;
    private Tool tool;
    private HouseRecord houseRecord;
    private BlogSubtype type;
    private List<BlogCategory> cateList;


    /**
     * Base string.
     *
     * @param model the model
     * @return the string
     */
    @RequiresRoles("admin")
    @RequestMapping(value = "/manage",method= RequestMethod.GET)
     public String base(Model model){
        return PAGE_MANAGE;
    }


    /**
     * Show login page string.
     *
     * @return the string
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLoginPage() {
        return "login";
    }


    /**
     * Submit login form string.
     *
     * @param request the request
     * @param model   the model
     * @return the string
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String submitLoginForm(HttpServletRequest request, Model model) {

        String errorClassName = (String) request.getAttribute("shiroLoginFailure");
        String authticationError = null;
        if (UnknownAccountException.class.getName().equals(errorClassName)) {
            authticationError = "用户名/密码错误";
        } else if (IncorrectCredentialsException.class.getName().equals(errorClassName)) {
            authticationError = "用户名/密码错误";
        } else if (errorClassName != null) {
            authticationError = "未知错误：" + errorClassName;
        }
        model.addAttribute("error", authticationError);
        return "login";
    }

    /**
     * Logout string.
     *
     * @param model the model
     * @return the string
     */
    @RequestMapping(value = "/logoutsucc",method= RequestMethod.GET)
    public String logout(Model model){
        return "redirect:/index";
    }

    /**
     * Unauthorized string.
     *
     * @param model the model
     * @return the string
     */
    @RequestMapping(value = "/unauthorized",method= RequestMethod.GET)
    public String unauthorized(Model model){
        return UNAUTHORIZED;
    }

    /**
     * Blog manage model and view.
     *
     * @param blogseach the blogseach
     * @return the model and view
     */
    @RequiresRoles("admin")
    @RequestMapping(value = "/blogManage",method= {RequestMethod.GET, RequestMethod.POST })
    public ModelAndView blogManage(String blogseach){
        ModelAndView mv=new ModelAndView(BLOGMANAGE);
        BlogSearchVO searchVO=new BlogSearchVO();
        List<BlogContent> blogList=null;
        if(!StringUtils.isEmpty(blogseach)){
            if(CommonUtils.isNumeric(blogseach)){
                searchVO.setId(Long.valueOf(blogseach));
            }else{
                searchVO.setTitle(blogseach);
            }
            blogList=blogService.getBlogList(page,searchVO);
        }else{
            blogList=blogService.getBlogList(page,searchVO);
        }

        if (blogList != null && blogList.size() > 0) {
            this.setDisplayPageBar(true);
        } else {
            blogList = null;
            this.setDisplayPageBar(false);
        }
        mv.addObject("displayPageBar",displayPageBar);
        mv.addObject("page",page);
        mv.addObject("blogList",blogList);
        mv.addObject("blogseach",blogseach);
        return mv;
    }


    /**
     * Blog category view model and view.
     *
     * @return the model and view
     */
    @RequiresRoles("admin")
    @RequestMapping(value = "/addblog", method = RequestMethod.GET)
    public ModelAndView blogCategoryView() {
        cateList = blogService.getCateList();
        ModelAndView modelAndView = new ModelAndView(ADDBLOG);
        modelAndView.addObject("cateList", cateList);
        modelAndView.addObject("update", false);
        return modelAndView;
    }


    /**
     * Create blog string.
     * ajax  方式提交blog
     * @param blog     the blog
     * @param request  the request
     * @param response the response
     * @return the string
     */
    @RequestMapping(value = "/createblog", method = RequestMethod.POST,  headers="Accept=application/json")
    public @ResponseBody Object createBlog(BlogContent blog, HttpServletRequest request, HttpServletResponse response) {
        map = new HashMap<String, Object>();
        System.out.println(blog.getBlogTitle());
        System.out.println(blog.getTags());
        if (blog != null) {
            if (blogService.createBlog(blog) > 0) {
                logger.debug("add blog success!");
                map.put("msg", "成功");
            } else {
                logger.debug("add blog fail!");
                map.put("msg", "失败");
            }
        }
        return map;
    }

    /**
     * Post object model and view.
     * 表单提交
     * @param blog     the blog
     * @param request  the request
     * @param response the response
     * @return the model and view
     */
    @RequiresRoles("admin")
    @RequestMapping(value = "/postblog", method = RequestMethod.POST)
    public ModelAndView postObject(@ModelAttribute("blog")BlogContent blog, HttpServletRequest request, HttpServletResponse response) {
        System.out.println(blog.getBlogTitle());
        System.out.println(blog.getTags());
        ModelAndView mv =new ModelAndView(ADDBLOG);
        if (blog != null) {
            if (blogService.createBlog(blog) > 0) {
                logger.debug("add blog success!");
            } else {
                logger.debug("add blog fail!");
            }
        }
        return mv;
    }


    /**
     * Detele blog object.
     *
     * @param blog     the blog
     * @param request  the request
     * @param response the response
     * @return the object
     */
    @RequiresRoles("admin")
    @RequestMapping(value = "/deleteblog", method = RequestMethod.POST,  headers="Accept=application/json")
    public  @ResponseBody Object deteleBlog(BlogContent blog, HttpServletRequest request, HttpServletResponse response) {
        String id =request.getParameter("id");
        map = new HashMap<String, Object>();
        if (blog != null) {
            if (blogService.deleteBlog(Long.valueOf(id)) > 0) {
                System.out.println("成功删除");
                map.put("msg", "成功删除");
            } else {
                System.out.println("失败");
                map.put("msg", "删除失败");
            }
        }
        return map;
    }


    /**
     * Gets blog.
     *
     * @param request the request
     * @return the blog
     */
   @RequestMapping(value = "/updateBlog", method = RequestMethod.GET)
   public ModelAndView getBlog(HttpServletRequest request) {
           String id = request.getParameter("id").toString();
           if (id != null && (!id.isEmpty())) {
                   blog = blogService.getBlogbyId(Long.valueOf(id));
               }
           cateList = blogService.getCateList();
           ModelAndView mv = new ModelAndView(ADDBLOG);
           mv.addObject("blog", blog);
           mv.addObject("cateList", cateList);
           mv.addObject("update", true);
           return mv;
       }

    /**
     * Update blog object.
     *
     * @param blog     the blog
     * @param request  the request
     * @param response the response
     * @return the object
     */
    @RequiresRoles("admin")
    @RequestMapping(value = "/updateBlog", method = RequestMethod.POST,  headers="Accept=application/json")
    public  @ResponseBody Object updateBlog(BlogContent blog, HttpServletRequest request, HttpServletResponse response) {
        map = new HashMap<String, Object>();
        if (blog != null) {
            if (blogService.updateBlog(blog) > 0) {
                map.put("msg", "成功");
            } else {
                System.out.println("失败");
                map.put("msg", "失败");
            }
        }
        return map;
    }


    /**
     * Get blog manage model and view.
     *
     * @return the model and view
     */
    @RequiresRoles("admin")
    @RequestMapping(value = "/toolManage",method= {RequestMethod.GET, RequestMethod.POST })
    public ModelAndView getBlogManage(String toolsearch){
        ModelAndView mv=new ModelAndView(TOOLMANAGE);
        Tool tool=new Tool();
        if(!StringUtils.isEmpty(toolsearch)) {
            if (CommonUtils.isNumeric(toolsearch)) {
                tool.setId(Integer.valueOf(toolsearch));
            } else {
                tool.setToolName(toolsearch);
            }
        }

        List<Tool> toolList= toolService.getToolsbyPage(page,tool);

        if (toolList != null && toolList.size() > 0) {
            this.setDisplayPageBar(true);
        } else {
            toolList = null;
            this.setDisplayPageBar(false);
        }

        mv.addObject("displayPageBar",displayPageBar);
        mv.addObject("page",page);
        mv.addObject("toolList",toolList);
        mv.addObject("toolsearch",toolsearch);
        return mv;
    }

    /**
     * Get blog manage model and view.
     *
     * @return the model and view
     */
    @RequiresRoles("admin")
    @RequestMapping(value = "/lianjiaManage",method= {RequestMethod.GET, RequestMethod.POST })
    public ModelAndView getLJManage(String toolsearch){
        ModelAndView mv=new ModelAndView(LJManage);
        HouseRecord houseRecord=new HouseRecord();
        if(!StringUtils.isEmpty(toolsearch)) {
            if (CommonUtils.isNumeric(toolsearch)) {
                houseRecord.setId(Integer.valueOf(toolsearch));
            } else {
                houseRecord.setTitle(toolsearch);
            }
        }

        List<HouseRecord> houseList= ljService.getHouseRecordListByPage(page,houseRecord);

        if (houseList != null && houseList.size() > 0) {
            this.setDisplayPageBar(true);
        } else {
            houseList = null;
            this.setDisplayPageBar(false);
        }

        mv.addObject("displayPageBar",displayPageBar);
        mv.addObject("page",page);
        mv.addObject("houseList",houseList);
        mv.addObject("toolsearch",toolsearch);
        return mv;
    }


    @RequiresRoles("admin")
    @RequestMapping(value = "/addTool", method = RequestMethod.GET)
    public ModelAndView addTool() {
        ModelAndView modelAndView = new ModelAndView(ADDTOOL);
        return modelAndView;
    }


    @RequiresRoles("admin")
    @RequestMapping(value = "/postTool", method = RequestMethod.POST)
    public String postObject(@ModelAttribute("tool")Tool tool, HttpServletRequest request, HttpServletResponse response) {
        System.out.println(tool.getToolName());
        System.out.println(tool.getType());
        if (tool != null) {
            try{
                toolService.insertTool(tool,"Oliver");
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return "redirect:/toolManage";
    }

    @RequiresRoles("admin")
    @RequestMapping(value = "/deleteTool", method = RequestMethod.POST,  headers="Accept=application/json")
    public  @ResponseBody Object deteleTool(Tool tool, HttpServletRequest request, HttpServletResponse response) {
        String id =request.getParameter("id");
        map = new HashMap<String, Object>();
        if (tool != null) {
            if(toolService.deleteTool(Integer.valueOf(id))>0) {
                System.out.println("成功删除");
                map.put("msg", "成功删除");
            } else {
                System.out.println("失败");
                map.put("msg", "删除失败");
            }
        }
        return map;
    }


    @RequestMapping(value = "/updateTool", method = RequestMethod.GET)
    public ModelAndView getTool(HttpServletRequest request) {
        String id = request.getParameter("id").toString();
        if (id != null && (!id.isEmpty())) {
            tool = toolService.getTool(Integer.valueOf(id));
        }
        cateList = blogService.getCateList();
        ModelAndView mv = new ModelAndView(ADDTOOL);
        mv.addObject("tool", tool);
        mv.addObject("update", true);
        return mv;
    }

    @RequiresRoles("admin")
    @RequestMapping(value = "/updateTool", method = RequestMethod.POST,  headers="Accept=application/json")
    public  @ResponseBody Object updateTool(Tool tool, HttpServletRequest request, HttpServletResponse response) {
        map = new HashMap<String, Object>();
        if (blog != null) {
            if (toolService.updateTool(tool)> 0) {
                map.put("msg", "成功");
            } else {
                System.out.println("失败");
                map.put("msg", "失败");
            }
        }
        return map;
    }



    /**
     * Add user string.
     *
     * @return the string
     */
    @RequiresRoles("admin")
    @RequestMapping(value = "/addUser",method= RequestMethod.GET)
    public String addUser(){
        return ADDUSER;
    }

    /**
     * Create user object.
     *
     * @param user     the user
     * @param request  the request
     * @param response the response
     * @return the object
     */
    @RequiresRoles("admin")
    @RequestMapping(value = "/createUser",method= RequestMethod.POST,  headers="Accept=application/json")
    public @ResponseBody Object createUser(User user, HttpServletRequest request, HttpServletResponse response) {
        Map map = new HashMap<String, Object>();
        if (user != null) {
            if (manageService.createUser(user) > 0) {
                map.put("msg", "成功");
            } else {
                map.put("msg", "失败");
            }
        }
        return map;
    }


    @RequiresRoles("admin")
    @RequestMapping(value = "/subTitleManage",method= {RequestMethod.GET, RequestMethod.POST })
    public ModelAndView subTitleManage(String search){
        ModelAndView mv=new ModelAndView(TITLEMANAGE);
        BlogSubtype subtype =new BlogSubtype();
        if(!StringUtils.isEmpty(search)) {
            if (CommonUtils.isNumeric(search)) {
                subtype.setId(Short.valueOf(search));
            } else {
                subtype.setSubTitle(search);
            }
        }

        List<BlogSubtype> typeList=blogService.getSubtypeListbyPage(page,subtype);

        if (typeList != null && typeList.size() > 0) {
            this.setDisplayPageBar(true);
        } else {
            typeList = null;
            this.setDisplayPageBar(false);
        }

        mv.addObject("displayPageBar",displayPageBar);
        mv.addObject("page",page);
        mv.addObject("typeList",typeList);
        mv.addObject("search",search);
        return mv;
    }

    @RequiresRoles("admin")
    @RequestMapping(value = "/addSubtitle",method= RequestMethod.GET)
    public String getSubTitlePage(){
        return ADDSUBTITLE;
    }


    @RequiresRoles("admin")
    @RequestMapping(value = "/postSubtitle", method = RequestMethod.POST)
    public String postObject(@ModelAttribute("subTitle")BlogSubtype subTitle, HttpServletRequest request, HttpServletResponse response) {
        if (subTitle != null) {
            try{
                toolService.insertSubType(subTitle,"Oliver");
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return "redirect:/subTitleManage";
    }



    @RequiresRoles("admin")
    @RequestMapping(value = "/deleteType", method = RequestMethod.POST,  headers="Accept=application/json")
    public  @ResponseBody Object deleteType(Tool tool, HttpServletRequest request, HttpServletResponse response) {
        String id =request.getParameter("id");
        map = new HashMap<String, Object>();
        if (tool != null) {
            if(toolService.deleteSubType(Short.valueOf(id))>0) {
                System.out.println("成功删除");
                map.put("msg", "成功删除");
            } else {
                System.out.println("失败");
                map.put("msg", "删除失败");
            }
        }
        return map;
    }


    @RequestMapping(value = "/updateType", method = RequestMethod.GET)
    public ModelAndView updateType(HttpServletRequest request) {
        String id = request.getParameter("id").toString();
        if (id != null && (!id.isEmpty())) {
            type = blogService.getSubtype(Short.valueOf(id));
        }
        ModelAndView mv = new ModelAndView(ADDSUBTITLE);
        mv.addObject("type", type);
        mv.addObject("update", true);
        return mv;
    }

    @RequiresRoles("admin")
    @RequestMapping(value = "/redisManage",method= RequestMethod.GET)
    public ModelAndView redisManage(){
        ModelAndView mv = new ModelAndView(REDISMANAGE);
        return mv;
    }

    @RequiresRoles("admin")
    @RequestMapping(value = "/cleanTags", method = RequestMethod.GET)
    public String cleanTags(HttpServletRequest request, HttpServletResponse response) {
        redisService.cleanTags();
        return "redirect:/redisManage";
    }



}
