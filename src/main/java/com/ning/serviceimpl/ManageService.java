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
//userService 已经带有密码加密
    //        String algorithmName = "md5";
//        String salt1 = user.getUsername();
//        String salt2 = new SecureRandomNumberGenerator().nextBytes().toHex();
//        int hashIterations = 2;
//        SimpleHash hash = new SimpleHash(algorithmName, user.getPassword(), salt1 + salt2, hashIterations);
//        String encodedPassword = hash.toHex();
//        user.setPassword(encodedPassword);
//        user.setSalt(salt2);
}
