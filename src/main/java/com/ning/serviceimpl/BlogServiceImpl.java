package com.ning.serviceimpl;

import com.ning.domain.*;
import com.ning.mapper.BlogCategoryMapper;
import com.ning.mapper.BlogContentMapper;
import com.ning.mapper.BlogSubtypeMapper;
import com.ning.mapper.BlogTagMapper;
import com.xiaomi.platform.xmybatis.plugins.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
    @Autowired
    private BlogSubtypeMapper blogSubtypeMapper;

    public List<BlogTag> getTagList(){
        return blogTagMapper.getListByPage();
    }

    public List<BlogContent> getBlogList(Pagination page,BlogSearchVO searchVO){
        return blogContentMapper.getBlogListByPage(page,searchVO);
    }
    public List<BlogContent> getBestList(){
        return blogContentMapper.getBestList();
    }

    public List<BlogSubtype> getSubtypeList(int type){
        return blogSubtypeMapper.getsublist(type);
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



    public int deleteBlog(Long id){
        return blogContentMapper.deleteByPrimaryKey(id);
    }

    public BlogContent getBlogbyId(Long id){
        BlogContent blog=blogContentMapper.selectByPrimaryKey(id);
        return blog;
    }

    public int updateBlog(BlogContent blog){
        if(blog!=null){
            return blogContentMapper.updateByPrimaryKeySelective(blog);
        }
        return 0;
    }
    public List<BlogContent> getSimilarList(Long id,String tags){
        List<BlogContent> allList = new ArrayList<BlogContent>();
        List<BlogContent> filterList = new ArrayList<BlogContent>();
        if(tags !=null){
            String[] tagList=tags.split(" ");
            String tag=tagList[0];
            allList=blogContentMapper.getBlogListbyTag(id,tag);
            boolean findtag=false;
            for(BlogContent item:allList){
                String[] itemTaglist = item.getTags().split(" ");
                for(int i=1;(i<tagList.length&& !findtag);i++){
                    for(String temitem:itemTaglist){
                        if (temitem.equals(tagList[i])){
                            findtag=true;
                            break;
                        }
                    }
                }
                if(findtag){
                    filterList.add(item);
                }
            }
            if(filterList.size()==0){
                return allList.subList(0,allList.size()>=5?5:allList.size());
            }
            return filterList.subList(0,filterList.size()>=5?5:filterList.size());
        }
        return allList;

    }

}
