package com.ning.test;

import com.ning.serviceimpl.KafkaServiceImpl;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by ning on 10/18/16.
 */
public class KafkaPruducerTest {

    protected Logger logger= LoggerFactory.getLogger(KafkaPruducerTest.class);

    @Autowired
    private KafkaServiceImpl kafkaService;

    @Test
    public void produce(){
        kafkaService=new KafkaServiceImpl();
        kafkaService.sendUserInfo("mytopic","test");
        kafkaService.sendUserInfo("mytopic","123");
    }
}
