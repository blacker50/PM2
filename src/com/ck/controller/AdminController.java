package com.ck.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@ResponseBody
	@RequestMapping("/test")
	public String test() {
		return "hello";
	}
	
	
	@ResponseBody
	@RequestMapping(value="admin/login")
	public String login(Admin admin,HttpServletRequest request) {
		Admin loginAdmin = adminService.login(admin);
		String loginState;
		if(loginAdmin==null)
			loginState="false";
		else {
			loginState="true";
			HttpSession session=request.getSession();
			session.setAttribute("user", loginAdmin);
			session.setAttribute("userName", loginAdmin.getName());
			session.setAttribute("password", loginAdmin.getPassword());
			session.setAttribute("userId", loginAdmin.getId());
			System.out.println("haha");
		}
		return loginState;
	}
	
	@ResponseBody
	@RequestMapping(value="admin/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session=request.getSession();
		session.removeAttribute("user");
		session.removeAttribute("userName");
		session.removeAttribute("password");
		session.removeAttribute("userId");
		return "logout";
	}
	
	
	@RequestMapping(value="admin/pwd_modi", method=RequestMethod.GET) 
	public String modifyAdminPassword(Map<String, Object> map,HttpServletRequest request) {
		HttpSession session=request.getSession();
		map.put("admin", adminService.getAdminById(((Integer)session.getAttribute("userId"))));
		return "admin_pwd_modi";
	}

	@RequestMapping(value="admin", method=RequestMethod.PUT)
	public String modifyAdminPassword(Admin admin) {
		adminService.modifyAdminPassword(admin);
		return "hello";
	}
	
	@ModelAttribute("admin")
	public void getAdmin(@RequestParam(value="id", required=false) Integer id,
			Map<String,Object> map){
		if(id!=null&&id>0){
			Admin admin=adminService.getAdminById(id);
			map.put("admin", admin);
		}else{
			map.put("admin", new Admin());			
		}
	}
}
