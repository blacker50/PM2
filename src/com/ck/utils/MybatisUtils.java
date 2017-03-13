package com.ck.utils;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ck.service.AdminService;


public class MybatisUtils {
    /**
     * ��ȡuserservice����
     */
    public static AdminService getAdminService() {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        return (AdminService) context.getBean("adminService");
    }
}
