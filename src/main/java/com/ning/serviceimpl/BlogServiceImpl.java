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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

    public List<BlogContent> getFixBlogList(List<BlogContent> list){
        for(BlogContent blogContent:list){
            String regex="(<p.*?>.*?</p>)";
            Pattern p = Pattern.compile(regex);
            Matcher m=p.matcher(blogContent.getBlogContent());
            if(m.find()){
                System.out.println(m.group(1));
                blogContent.setBlogContent(m.group(1));
            }
        }
        return list;
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
