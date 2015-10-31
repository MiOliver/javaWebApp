package com.ning.serviceimpl;

import com.ning.domain.BlogCategory;
import com.ning.domain.BlogContent;
import com.ning.domain.BlogTag;
import com.ning.mapper.BlogCategoryMapper;
import com.ning.mapper.BlogContentMapper;
import com.ning.mapper.BlogTagMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * Created by ning on 10/29/15.
 */

@Service
public class BlogServiceImpl {
    @Autowired
    private BlogTagMapper blogTagMapper;
    @Autowired
    private BlogCategoryMapper blogCategoryMapper;
    @Autowired
    private BlogContentMapper blogContentMapper;

    public List<BlogTag> getTagList(){
        return blogTagMapper.getListByPage();
    }

    public List<BlogContent> getBlogList(){
        return blogContentMapper.getBlogListByPage();
    }

    public List<BlogCategory> getCateList(){
        return blogCategoryMapper.getCateList();
    }

    public int createBlog(BlogContent blog){
        return blogContentMapper.insertSelective(blog);
    }
    public BlogContent getBlogbyId(Long id){
        BlogContent blog=blogContentMapper.selectByPrimaryKey(id);
        return blog;
    }

    public void updateBlog(BlogContent blog){
        if(blog!=null){
            blogContentMapper.updateByPrimaryKey(blog);
        }
    }

}
