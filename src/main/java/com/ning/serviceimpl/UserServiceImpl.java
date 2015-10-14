package com.ning.serviceimpl;

import com.ning.domain.User;
import com.ning.mapper.UserMapper;
import com.ning.services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by ning on 9/29/15.
 */

@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserMapper userDao;
    @Autowired
    RedisTemplate<String, User> redisTemplate;
    @Override
    public User getUserById(int userId) {
        // TODO Auto-generated method stub
        return this.userDao.selectByPrimaryKey(userId);
    }

    public void put(User user) {
        redisTemplate.opsForHash().put(user.getObjectKey(), user.getId(), user);
    }

    public void delete(User key) {
        redisTemplate.opsForHash().delete(key.getObjectKey(), key.getId());
    }

    public User get(User key) {
        return (User) redisTemplate.opsForHash().get(key.getObjectKey(), key.getId());
    }

}
