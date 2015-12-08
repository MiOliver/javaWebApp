package com.ning.serviceimpl;

import com.ning.domain.User;
import com.ning.services.BasicService;
import com.ning.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.Authentication;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

/**
 * Created by ning on 12/8/15.
 */

@Service("BasicService")
public class BasicServiceImpl implements BasicService{

    @Autowired
    private UserService userService;
    @Override
    public User getLoginAdmin() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null) { return null; }

        Object principal = authentication.getPrincipal();
        if (principal == null || !(principal instanceof User)) {
            return null;
        } else {
            return (User) principal;
        }
    }

    @Override
    public User getLoginByUserId(String name) {
        return userService.findByUsername(name);
    }
}
