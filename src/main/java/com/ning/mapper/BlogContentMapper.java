package com.ning.mapper;


import com.ning.domain.BlogContent;
import com.xiaomi.platform.xmybatis.plugins.Pagination;

import java.util.List;

public interface BlogContentMapper {
    int deleteByPrimaryKey(Long id);

    int insert(BlogContent record);

    int insertSelective(BlogContent record);

    BlogContent selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(BlogContent record);

    int updateByPrimaryKey(BlogContent record);

    List<BlogContent> getBlogListByPage(Pagination pagination);
}