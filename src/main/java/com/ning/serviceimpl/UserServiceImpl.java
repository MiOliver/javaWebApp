package com.ning.serviceimpl;

import com.ning.domain.User;
import com.ning.mapper.UserMapper;
import com.ning.services.IUserService;
import org.codehaus.jackson.node.ObjectNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.BoundValueOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import java.util.*;

import javax.annotation.Resource;

/**
 * Created by ning on 9/29/15.
 */

@Service
//public class UserServiceImpl implements IUserService {
public class UserServiceImpl{
    @Autowired
    private UserMapper userDao;
    @Autowired
    RedisTemplate<String, Object> redisTemplate;

    private static final String KEY="TEST";

//    @Override
    public User getUserById(int userId) {
        // TODO Auto-generated method stub
        return this.userDao.selectByPrimaryKey(userId);
    }

    public void put(User user) {
//        redisTemplate.opsForHash().put(user.getObjectKey(), user.getId(), user);
        BoundValueOperations<String,Object> opt = redisTemplate.boundValueOps(KEY);
        opt.set(user);
    }

    public void test(){
        BoundValueOperations<String,Object> opt = redisTemplate.boundValueOps(KEY);
        opt.set("test");
    }
    public void delete(User key) {
        redisTemplate.opsForHash().delete(key.getObjectKey(), key.getId());
    }

    public User get(User key) {
        return (User) redisTemplate.opsForHash().get(key.getObjectKey(), key.getId());
    }

    public void addUser(User user){
        userDao.insertSelective(user);
    }

    public List<User> getUserList(){
        return userDao.getUserList();
    }

}
