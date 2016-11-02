package com.ning.test;

import com.ning.web.LongRunningServlet;
import org.junit.Before;
import org.junit.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;


/**
 * Created by ning on 10/12/16.
 */
public class ServletTest {
    private LongRunningServlet servlet;
    private MockHttpServletRequest request;
    private MockHttpServletResponse response;


    @Before
    public void setUp() {
        servlet = new LongRunningServlet();
        request = new MockHttpServletRequest();
        response = new MockHttpServletResponse();
    }

    @Test
    public void correctUsernameInRequest() throws ServletException, IOException {
        request.addParameter("time", "8000");
        request.addParameter("username", "scott");
        request.addParameter("password", "tiger");
        for(int i=0;i<1000;i++){
            servlet.doGet(request, response);
        }

    }

    @Test
    /**
     * 测试servlet请求
     */
    public void testServeletRequest(){

    }
}
