package com.ning.mapper;


import com.ning.domain.BlogSubtype;

public interface BlogSubtypeMapper {
    int deleteByPrimaryKey(Short id);

    int insert(BlogSubtype record);

    int insertSelective(BlogSubtype record);

    BlogSubtype selectByPrimaryKey(Short id);

    int updateByPrimaryKeySelective(BlogSubtype record);

    int updateByPrimaryKey(BlogSubtype record);
}