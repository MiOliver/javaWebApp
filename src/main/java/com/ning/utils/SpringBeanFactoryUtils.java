package com.ning.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * Created by oliver on 2017/2/16.
 * 普通类也可以使用此工具  获取bean 对象
 * 在applicationContext.xml文件中配置
 * <bean id="springBeanFactoryUtils" class="com.tooldin.portal.util.SpringBeanFactoryUtils"/>
 1

 */
public class SpringBeanFactoryUtils implements ApplicationContextAware {

    private static ApplicationContext appCtx;

    /**
     * 此方法可以把ApplicationContext对象inject到当前类中作为一个静态成员变量。
     *
     * @param applicationContext ApplicationContext 对象.
     * @throws BeansException
     * @author wangdf
     */
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        SpringBeanFactoryUtils.appCtx = applicationContext;
    }

    /**
     * 获取ApplicationContext
     *
     * @return
     * @author wangdf
     */
    public static ApplicationContext getApplicationContext() {
        return appCtx;
    }

    /**
     * 这是一个便利的方法，帮助我们快速得到一个BEAN
     *
     * @param beanName bean的名字
     * @return 返回一个bean对象
     * @author wangdf
     */
    public static Object getBean(String beanName) {
        return appCtx.getBean(beanName);
    }

}