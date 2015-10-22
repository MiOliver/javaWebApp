package com.ning.services;

/**
 * Created by ning on 9/29/15.
 */

import com.ning.domain.User;
import org.springframework.stereotype.Service;


public interface IUserService {
    public User getUserById(int userId);
}
