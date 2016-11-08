package com.ning.test;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by ning on 2016-11-08.
 */


@RunWith(SpringJUnit4ClassRunner.class)
//@ComponentScan(basePackages={"com.ning.serviceimpl"})
@ContextConfiguration({"classpath:config/spring/applicationContext-dao.xml",
        "classpath:config/spring/applicationContext-redis.xml",
        "classpath:config/spring/applicationContext-service.xml"})
public class TestConfiguration{ }