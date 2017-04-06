package com.ck.utils;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ck.entity.MeterReader;
import com.ck.service.AdminService;
import com.ck.service.MeterReaderService;


public class MybatisUtils {
    /**
     * ��ȡuserservice����
     */
	private  static ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
    public static AdminService getAdminService() {
        return (AdminService) context.getBean("adminService");
    }
    
    public static MeterReaderService getMeterReaderService() {
    	return (MeterReaderService) context.getBean("meterReaderService");
    }
}
