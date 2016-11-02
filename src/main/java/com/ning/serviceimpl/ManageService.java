package com.ning.serviceimpl;

import com.ning.domain.User;
import com.ning.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * Created by ning on 11/27/15.
 * 账户管理类
 */
@Service
public class ManageService {

    @Autowired
    private UserService userService;

    public int createUser(User user){
        userService.createUser(user);
        return 1;
    }

}
