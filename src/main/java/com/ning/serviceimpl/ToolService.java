package com.ning.serviceimpl;

import com.ning.dao.Tool;
import com.ning.dao.ToolExample;
import com.ning.mapper.ToolMapper;
import com.ning.services.BasicService;
import com.ning.services.IToolService;
import com.xiaomi.platform.xmybatis.plugins.Pagination;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by ning on 2016-11-10.
 */

@Service("toolService")
public class ToolService implements IToolService {

    private static final Logger logger = LoggerFactory.getLogger(ToolService.class);

    @Autowired
    protected ToolMapper toolMapper;

    @Resource
    private BasicService basicService;

    @Override
    public List<Tool> getToolsbyPage(Pagination page,Tool tool) {
        ToolExample toolExample=null;
        if(tool!=null){
            toolExample= _buildExampleByWhere(tool.getId(),tool.getToolName(),tool.getType());
        }
        return toolMapper.selectByExample(toolExample);
    }

    @Override
    public List<Tool> getTools() {
        return null;
    }


    @Override
    public void insertTool(Tool tool,String user) throws Exception{
        Assert.notNull(tool);
        Date now=new Date();
        tool.setCreateTime(now);
        tool.setUpdateTime(now);
        tool.setCreatePerson(user);
        ToolExample toolExample= _buildExampleByWhere(tool.getId(),tool.getToolName(),tool.getType());
        if(toolMapper.countByExample(toolExample)>0)
        {
            logger.debug("insert tool exception:this tool is exsit.");
            return ;
        }

        toolMapper.insertSelective(tool);
    }

    @Override
    public int deleteTool(Integer id) {
       return toolMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Integer updateTool(Tool tool) {
        return toolMapper.updateByPrimaryKeySelective(tool);
    }

    @Override
    public Tool getTool(Integer id) {
       return toolMapper.selectByPrimaryKey(id);
    }

    private ToolExample _buildExampleByWhere(Integer id, String title, String type){
        ToolExample example=new ToolExample();
        ToolExample.Criteria criteria=example.createCriteria();
        if(id!=null && id>0){
            criteria.andToolNameEqualTo(title);
        }
        if(StringUtils.isNotEmpty(title)){
            criteria.andToolNameEqualTo(title);
        }
        if(StringUtils.isNotEmpty(type)){
            criteria.andTypeEqualTo(type);
        }
        return example;
    }
}
