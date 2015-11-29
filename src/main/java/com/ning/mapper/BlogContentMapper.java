package com.ning.mapper;


import com.ning.domain.BlogContent;
import com.xiaomi.platform.xmybatis.plugins.Pagination;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BlogContentMapper {
    int deleteByPrimaryKey(Long id);

    int insert(BlogContent record);

    int insertSelective(BlogContent record);

    BlogContent selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(BlogContent record);

    int updateByPrimaryKey(BlogContent record);

    List<BlogContent> getBlogListByPage(Pagination pagination,@Param("type") Integer type);

    List<BlogContent> getBlogListbyTag(@Param("param") String param);


//    @Select("select * from blog_content order by visit_count desc limit 10;")
    List<BlogContent> getBestList();
}