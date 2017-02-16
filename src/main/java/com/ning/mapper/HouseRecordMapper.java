package com.ning.mapper;

import com.ning.dao.HouseRecord;
import com.xiaomi.platform.xmybatis.plugins.Pagination;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HouseRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(HouseRecord record);

    int insertSelective(HouseRecord record);

    HouseRecord selectByPrimaryKey(Integer id);

    int countByTitle(@Param("title") String title);

    int updateByPrimaryKeySelective(HouseRecord record);

    int updateByPrimaryKey(HouseRecord record);

    List<HouseRecord> getBlogListByPage(Pagination pagination,@Param("record") HouseRecord record);
}