package com.ning.services;

import com.ning.dao.HouseRecord;
import com.ning.mapper.HouseRecordMapper;
import com.xiaomi.platform.xmybatis.plugins.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by oliver on 2017/2/16.
 */
@Service("ljService")
public class LjService implements ILjService {

    @Autowired
    private HouseRecordMapper houseRecordMapper;

    public List<HouseRecord> getHouseRecordListByPage(Pagination pagination,HouseRecord record) {
       return houseRecordMapper.getBlogListByPage(pagination,record);
    }
}
