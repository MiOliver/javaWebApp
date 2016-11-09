package com.ning.controller;

import com.ning.domain.BlogCategory;
import com.ning.domain.BlogContent;
import com.ning.domain.BlogSubtype;
import com.ning.domain.BlogTag;
import com.ning.serviceimpl.BlogServiceImpl;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ning on 15-10-25.
 */


@Controller
public class BlogController extends BaseController {
    @Autowired
    private BlogServiceImpl blogService;

    private static final Logger logger= LoggerFactory.getLogger(BlogController.class);

    private static final String ADDBLOG = "add_blog";
    private static final String BLOGTAGSLIST = "blog_tags_list";
    private static final String BLOGDETAIL = "blog_detail";
    private static final String BLOGSTATISTICS = "blog_statistics";



    private List<BlogTag> tagsList;
    private List<BlogCategory> cateList;
    private List<BlogContent> similarBlogList;
    private Map<String, Object> map;
    private BlogContent blog;

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
     * Blog tag list model and view.
     *
     * @return the model and view
     */
    @RequestMapping(value = "/tagslist", method = RequestMethod.GET)
    public ModelAndView blogTagList() {
        tagsList = blogService.getTagList();
        ModelAndView modelAndView = new ModelAndView(BLOGTAGSLIST);
        modelAndView.addObject("tagsList", tagsList);
        return modelAndView;
    }

    /**
     * Blog trend model and view.
     *
     * @return the model and view
     */
    @RequestMapping(value = "/blogTrend", method = RequestMethod.GET)
    public ModelAndView blogTrend(){
        List<BlogContent> list = blogService.getBestList();
        Long[] idList =new Long[5];
        Long[] countList =new Long[5];
        for(int i=0;i<list.size();i++){
            idList[i]=list.get(i).getId();
            countList[i]=list.get(i).getVisitCount();
        }
        ModelAndView modelAndView = new ModelAndView(BLOGSTATISTICS);
        modelAndView.addObject("idList", idList);
        modelAndView.addObject("countList", countList);
        return modelAndView;
    }


    /**
     * Gets sublist.
     *
     * @param request  the request
     * @param response the response
     */
    @RequestMapping(value = "/getSublist", method = RequestMethod.GET)
    public void getSublist(HttpServletRequest request,HttpServletResponse response) {
        Integer cateId =Integer.valueOf(request.getParameter("cateId").toString());
        List<BlogSubtype> list = blogService.getSubtypeList(cateId);
        ajax(response,Status.success,list);
        return;
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
     * Blog detail model and view.
     *
     * @param request the request
     * @return the model and view
     */
    @RequestMapping(value = "/blogdetail", method = RequestMethod.GET)
    public ModelAndView blogDetail(HttpServletRequest request) {
        String id = request.getParameter("id").toString();
        if (id != null && (!id.isEmpty())) {
            blog = blogService.getBlogbyId(Long.valueOf(id));
        }
        blog.setVisitCount(blog.getVisitCount() + 1);
        blogService.updateBlog(blog);
        similarBlogList=blogService.getSimilarList(blog.getId(),blog.getTags());
        ModelAndView mv = new ModelAndView(BLOGDETAIL);
        mv.addObject("blog", blog);
        mv.addObject("similarBlogList", similarBlogList);
        return mv;
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
     * Gets tags list.
     *
     * @return the tags list
     */
    public List<BlogTag> getTagsList() {
        return tagsList;
    }

    /**
     * Sets tags list.
     *
     * @param tagsList the tags list
     */
    public void setTagsList(List<BlogTag> tagsList) {
        this.tagsList = tagsList;
    }

    /**
     * Gets cate list.
     *
     * @return the cate list
     */
    public List<BlogCategory> getCateList() {
        return cateList;
    }

    /**
     * Sets cate list.
     *
     * @param cateList the cate list
     */
    public void setCateList(List<BlogCategory> cateList) {
        this.cateList = cateList;
    }

    /**
     * Gets blog.
     *
     * @return the blog
     */
    public BlogContent getBlog() {
        return blog;
    }

    /**
     * Sets blog.
     *
     * @param blog the blog
     */
    public void setBlog(BlogContent blog) {
        this.blog = blog;
    }

    /**
     * Gets map.
     *
     * @return the map
     */
    public Map<String, Object> getMap() {
        return map;
    }

    /**
     * Sets map.
     *
     * @param map the map
     */
    public void setMap(Map<String, Object> map) {
        this.map = map;
    }
}
