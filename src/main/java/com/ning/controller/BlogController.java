package com.ning.controller;

import com.ning.domain.BlogCategory;
import com.ning.domain.BlogContent;
import com.ning.domain.BlogTag;
import com.ning.serviceimpl.BlogServiceImpl;
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
 * Created by ning on 15-10-25.
 */


@Controller
public class BlogController {
    @Autowired
    private BlogServiceImpl blogService;

    private BlogContent blog;

    private static final String ADDBLOG = "add_blog";
    private static final String BLOGTAGSLIST = "blog_tags_list";
    private static final String BLOGDETAIL = "blog_detail";
    private static final String ABOUT = "about";
    private List<BlogTag> tagsList;
    private List<BlogCategory> cateList;
    private Map<String, Object> map;

    @RequestMapping(value = "/addblog", method = RequestMethod.GET)
    public ModelAndView blogCategoryView() {
        cateList = blogService.getCateList();
        ModelAndView modelAndView = new ModelAndView(ADDBLOG);
        modelAndView.addObject("cateList", cateList);
        return modelAndView;
    }

    @RequestMapping(value = "/tagslist", method = RequestMethod.GET)
    public String blogTagList() {
        tagsList = blogService.getTagList();
        return BLOGTAGSLIST;
    }

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String about() {
        return ABOUT;
    }

    @RequestMapping(value = "/createblog", method = RequestMethod.POST,  headers="Accept=application/json")
    public  @ResponseBody Object createBlog(BlogContent blog, HttpServletRequest request, HttpServletResponse response) {
        map = new HashMap<String, Object>();
        if (blog != null) {
            if (blogService.createBlog(blog) > 0) {
                map.put("msg", "成功");
            } else {
                System.out.println("失败");
                map.put("msg", "失败");
            }
        }
        return map;
    }
//    @RequestMapping(value = "/createblog", method = RequestMethod.POST, produces = "application/json")
//    public @ResponseBody String createBlog(BlogContent blog, HttpServletResponse response) {
//        String result="";
//        if (blog != null) {
//            if (blogService.createBlog(blog) > 0) {
//                result = "添加成功";
//            } else {
//                System.out.println("失败");
//                result = "添加失败";
//            }
//        }
//        return result;
//    }


    @RequestMapping(value = "/blogdetail", method = RequestMethod.GET)
    public ModelAndView blogDetail(HttpServletRequest request) {
        String id = request.getParameter("id").toString();
        if (id != null && (!id.isEmpty())) {
            blog = blogService.getBlogbyId(Long.valueOf(id));
        }
        blog.setVisitCount(blog.getVisitCount() + 1);
        blogService.updateBlog(blog);
        ModelAndView mv = new ModelAndView(BLOGDETAIL);
        mv.addObject("blog", blog);
        return mv;
    }


    public List<BlogTag> getTagsList() {
        return tagsList;
    }

    public void setTagsList(List<BlogTag> tagsList) {
        this.tagsList = tagsList;
    }

    public List<BlogCategory> getCateList() {
        return cateList;
    }

    public void setCateList(List<BlogCategory> cateList) {
        this.cateList = cateList;
    }

    public BlogContent getBlog() {
        return blog;
    }

    public void setBlog(BlogContent blog) {
        this.blog = blog;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }
}
