package com.ning.services;

import com.ning.dao.HouseRecord;
import com.xiaomi.platform.xmybatis.plugins.Pagination;

import java.util.List;

/**
 * Created by oliver on 2017/2/16.
 */
public interface ILjService {

    public List<HouseRecord> getHouseRecordListByPage(Pagination pagination, HouseRecord record);
}
