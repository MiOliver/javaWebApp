package com.ning.mapper;


import com.ning.domain.BlogCategory;
import com.ning.domain.BlogTag;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BlogCategoryMapper {
    int deleteByPrimaryKey(Long categoryId);

    int insert(BlogCategory record);

    int insertSelective(BlogCategory record);

    BlogCategory selectByPrimaryKey(Long categoryId);

    int updateByPrimaryKeySelective(BlogCategory record);

    int updateByPrimaryKey(BlogCategory record);

    List<BlogCategory> getCateList();
}