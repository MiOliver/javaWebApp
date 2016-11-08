package com.ning.test.thread;

import com.ning.services.TestService;

/**
 * Created by ning on 2016-11-03.
 */
public class TestWriteThread extends Thread{

    public TestWriteThread(TestService testService) {
        this.testService = testService;
    }

    private TestService testService;
    @Override
    public void run() {
        for(int i=0;i<10;i++){
            testService.uncommitUserUpdate();
        }

    }
}
