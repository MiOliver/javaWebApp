package com.ning.serviceimpl;

import com.ning.domain.BlogCategory;
import com.ning.domain.BlogTag;
import com.ning.mapper.BlogCategoryMapper;
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

    public List<BlogTag> getTagList(){
        return blogTagMapper.getListByPage();
    }

    public List<BlogCategory> getCateList(){
        return blogCategoryMapper.getCateList();
    }

}
