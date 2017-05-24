package com.ck.utils;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ck.entity.Result;
import com.ck.service.AdminService;
import com.ck.service.DormService;
import com.ck.service.MeterReaderService;
import com.ck.service.ResultService;
import com.ck.service.TaskService;
import com.ck.service.TraiffParamService;


public class MybatisUtils {
    /**
     *	userservice
     */
	private  static ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
    public static AdminService getAdminService() {
        return (AdminService) context.getBean("adminService");
    }
    
    public static MeterReaderService getMeterReaderService() {
    	return (MeterReaderService) context.getBean("meterReaderService");
    }
    
    public static DormService getDormService(){
    	return (DormService) context.getBean("dormService");
    }
    
    public static TaskService getTaskService(){
    	return (TaskService) context.getBean("taskService");
    }
    
    public static ResultService getResultService() {
    	return (ResultService) context.getBean("resultService");
    }
    
    public static TraiffParamService getTraiffParamService() {
    	return (TraiffParamService) context.getBean("traiffParamService");
    }
}
