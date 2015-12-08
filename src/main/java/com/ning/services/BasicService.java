package com.ning.services;


import com.ning.domain.User;

/**
 * Created by ning on 12/8/15.
 */
public interface BasicService {

    public User getLoginAdmin();

    public User getLoginByUserId(String id);
}
