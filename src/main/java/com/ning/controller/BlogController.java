package com.ning.controller;

import com.ning.controller.base.BaseController;
import com.ning.domain.BlogCategory;
import com.ning.domain.BlogContent;
import com.ning.domain.BlogSubtype;
import com.ning.domain.BlogTag;
import com.ning.serviceimpl.BlogServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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


    private static final String BLOGTAGSLIST = "blog_tags_list";
    private static final String BLOGDETAIL = "blog_detail";
    private static final String BLOGSTATISTICS = "blog_statistics";



    private List<BlogTag> tagsList;
    private List<BlogCategory> cateList;
    private List<BlogContent> similarBlogList;
    private Map<String, Object> map;
    private BlogContent blog;


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
