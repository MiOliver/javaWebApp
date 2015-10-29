package com.ning.controller;

import com.ning.domain.BlogTag;
import com.ning.serviceimpl.BlogServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.List;

/**
 * Created by ning on 15-10-25.
 */


@Controller
public class BlogController {
    @Autowired
    private BlogServiceImpl blogService;

    private static final String ADDBLOG ="add_blog";
    private static final String BLOGTAGSLIST ="blog_tags_list";
    private List<BlogTag> tagsList;

    @RequestMapping(value = "/addblog", method = RequestMethod.GET)
    public String blogCategoryView(){
        return ADDBLOG;
    }
    @RequestMapping(value = "/tagslist", method = RequestMethod.GET)
    public String blogTagList(){
        tagsList=blogService.getTagList();
        return BLOGTAGSLIST;
    }


    public List<BlogTag> getTagsList() {
        return tagsList;
    }

    public void setTagsList(List<BlogTag> tagsList) {
        this.tagsList = tagsList;
    }
}
