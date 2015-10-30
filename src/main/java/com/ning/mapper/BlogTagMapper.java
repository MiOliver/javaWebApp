package com.ning.mapper;

import com.ning.domain.BlogContent;
import com.ning.domain.BlogTag;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface BlogTagMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BlogTag record);

    int insertSelective(BlogTag record);

    BlogTag selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BlogTag record);

    int updateByPrimaryKey(BlogTag record);

    List<BlogTag> getListByPage();

}