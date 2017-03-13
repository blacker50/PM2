package com.ck.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ck.entity.Admin;
import com.ck.service.AdminService;
import com.ck.utils.MybatisUtils;

@Controller
public class AdminController {
	private AdminService adminService;
	@Autowired
	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	@RequestMapping("showAllAdmins")
	public String list(Map<String, Object> maps) {
		setAdminService(MybatisUtils.getAdminService());
		maps.put("admins",adminService.selectAllAdmins());
		return "adminList";
	}
	
	@RequestMapping(value="admin",method=RequestMethod.GET)
	public String inputAdmin(Map<String, Object> maps){
		setAdminService(MybatisUtils.getAdminService());
		maps.put("admin",new Admin());
		return "admin_add";
	}
	
	@RequestMapping(value="admin", method=RequestMethod.POST)
	public String addAdmin(Admin admin){
		setAdminService(MybatisUtils.getAdminService());
		admin.setId(adminService.getMaxAdminId()+1);
		int index=adminService.addAdmin(admin);
		if(index==0)
			return "admin_add";
		else 
			return "redirect:showAllAdmins";
	}
}
