package com.ning.serviceimpl;

import com.ning.domain.BlogTag;
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

    public List<BlogTag> getTagList(){
        return blogTagMapper.getListByPage();
    }

}
