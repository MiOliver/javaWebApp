package com.ning.serviceimpl;

import com.ning.domain.User;
import com.ning.mapper.UserMapper;
import com.ning.services.TestService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

/**
 * Created by ning on 2016-11-03.
 */
@Service
public class TestServiceImp implements TestService {

    private static final Logger logger = LoggerFactory.getLogger(TestServiceImp.class);

    @Autowired
    private UserMapper userMapper;

    @Override
    public void uncommitUserRead() {
        try {
            Thread.sleep(200);
        }catch (Exception e){
            e.printStackTrace();
        }
        User user=userMapper.selectByPrimaryKey(2);
        Assert.notNull(user);
        logger.info("user info:"+user.getId()+user.getUsername());
    }

    @Override
    public void uncommitUserUpdate() {
        User user=new User();
        user.setId(2L);
        user.setUsername("newTest");
        userMapper.updateByPrimaryKeySelective(user);
        logger.info("update user info:"+user.getId()+user.getUsername());
        try {
            Thread.sleep(200);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void commitUserRead() {

    }

    @Override
    public void commitUserUpdate() {

    }

    @Override
    public void repeatUserRead() {

    }

    @Override
    public void repeatUserUpdate() {

    }

    @Override
    public void serialUserUpdate() {

    }

    @Override
    public void commitUserInsert() {

    }
}
