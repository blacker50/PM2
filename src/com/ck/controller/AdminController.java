package com.ck.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ck.entity.Admin;
import com.ck.service.AdminService;
import com.ck.utils.MybatisUtils;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;

	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService() {
		this.adminService=MybatisUtils.getAdminService();
	}
	
	@RequestMapping("admin/login")
	public String login(Admin admin) {
		return String.valueOf(adminService.login(admin));
	}

	@ModelAttribute("admin")
	public void getAdmin(@RequestParam(value="id", required=false) Integer id,
			Map<String,Object> map){
		System.out.println("modelAttribute");
		if(id!=null&&id>0){
			System.out.println(id);
			Admin admin=adminService.getAdminById(id);
			map.put("admin", admin);
		}else{
			map.put("admin", new Admin());			
		}
	}
}
