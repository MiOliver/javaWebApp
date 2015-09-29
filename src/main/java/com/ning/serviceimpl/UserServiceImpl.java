package com.ning.serviceimpl;

import com.ning.domain.User;
import com.ning.mapper.UserMapper;
import com.ning.services.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by ning on 9/29/15.
 */

@Service("userService")
public class UserServiceImpl implements IUserService {
    @Resource
    private UserMapper userDao;
    @Override
    public User getUserById(int userId) {
        // TODO Auto-generated method stub
        return this.userDao.selectByPrimaryKey(userId);
    }

}
