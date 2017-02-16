package com.ning.test;

import com.ning.serviceimpl.TestServiceImp;
import com.ning.services.ICrawlerService;
import com.ning.test.thread.TestReadThread;
import com.ning.test.thread.TestWriteThread;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;


/**
 * 事务隔离级别测试
 * Created by ning on 2016-11-03.
 */


public class TransactionTest extends TestConfiguration{

    @Autowired
    private TestServiceImp testService;
    @Autowired
    private ICrawlerService crawlerService;

    @Test
    public void testUncommit(){
        TestReadThread readThread=new TestReadThread(testService);
        TestWriteThread writeThread=new TestWriteThread(testService);
        readThread.start();
        writeThread.start();
    }

    @Test
    public void testCrawler(){
        try {
            crawlerService.crawling();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
