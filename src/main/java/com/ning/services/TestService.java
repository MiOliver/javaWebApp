package com.ning.services;

/**
 * 事务隔离级别测试
 * Created by ning on 2016-11-03.
 */
public interface TestService {

    /**
     * Uncommit user read.
     */
    public void uncommitUserRead();

    /**
     * Uncommit user update.
     */
    public void uncommitUserUpdate();

    /**
     * Commit user read.
     */
    public void commitUserRead();

    /**
     * Commit user update.
     */
    public void commitUserUpdate();

    /**
     * Repeat user read.
     */
    public void repeatUserRead();

    /**
     * Repeat user update.
     */
    public void repeatUserUpdate();

    /**
     * Serial user update.
     */
    public void serialUserUpdate();

    /**
     * Commit user insert.
     */
    public void commitUserInsert();

}
