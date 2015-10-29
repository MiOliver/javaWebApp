package com.ning.controller;

import com.ning.domain.BlogCategory;
import com.ning.domain.BlogContent;
import com.ning.domain.BlogTag;
import com.ning.serviceimpl.BlogServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by ning on 15-10-25.
 */


@Controller
public class BlogController {
    @Autowired
    private BlogServiceImpl blogService;

    private BlogContent blog;

    private static final String ADDBLOG ="add_blog";
    private static final String BLOGTAGSLIST ="blog_tags_list";
    private List<BlogTag> tagsList;
    private List<BlogCategory> cateList;

    @RequestMapping(value = "/addblog", method = RequestMethod.GET)
    public ModelAndView blogCategoryView(){
        cateList=blogService.getCateList();
        ModelAndView modelAndView = new ModelAndView(ADDBLOG);
        modelAndView.addObject("cateList",cateList);
        return modelAndView;
    }
    @RequestMapping(value = "/tagslist", method = RequestMethod.GET)
    public String blogTagList(){
        tagsList=blogService.getTagList();
        return BLOGTAGSLIST;
    }
    @RequestMapping(value = "/createBlog", method = RequestMethod.GET)
    public String createBlog(BlogContent blog){
        System.out.println(blog.getBlogCategory());
        System.out.println(blog.getBlogTitle());
        tagsList=blogService.getTagList();
        return "index";
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
}
