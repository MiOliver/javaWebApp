package com.ning.mapper;


import com.ning.domain.BlogContent;
import com.ning.domain.BlogSearchVO;
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

    List<BlogContent> getBlogListByPage(Pagination pagination,@Param("searchVO") BlogSearchVO searchVO);

    List<BlogContent> getBlogListbyTag(@Param("id") Long id,@Param("tag") String tag);


//    @Select("select * from blog_content order by visit_count desc limit 10;")
    List<BlogContent> getBestList();


    @Select("select tags from blog_content")
    List<String> getTags();
}