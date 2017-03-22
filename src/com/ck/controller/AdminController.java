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
	
	@RequestMapping(value="admin/add", method=RequestMethod.POST)
	public String addAdmin(Admin admin){
		setAdminService(MybatisUtils.getAdminService());
		int index=adminService.addAdmin(admin);
		if(index==0)
			return "admin_add";
		else 
			return "redirect:/showAllAdmins";
	}
	
	@RequestMapping(value="admin/{id}",method=RequestMethod.DELETE)
	public String deleteAdmin(@PathVariable("id") Integer id,Map<String, Object> map){
		adminService.deleteAdmin(id);
		return "redirect:/showAllAdmins";
	}
	
	@RequestMapping(value="admin/{id}",method=RequestMethod.GET)
	public String updateAdmin(@PathVariable("id") Integer id,Map<String, Object> map){
		map.put("admin", adminService.getAdminById(id));
		return "admin_modi";
	}
	
	@RequestMapping(value="admin", method=RequestMethod.PUT)
	public String updateAdmin(Admin admin){
		adminService.updateAdmin(admin);
		return "redirect:showAllAdmins";
	}
	
	@RequestMapping(value="admin", method=RequestMethod.POST)
	public String showAdminById(@RequestParam(value="id", required=false) Integer id,
			Map<String, Object> map){
		if(id!=null&&id>0) {
				map.put("adminSelected", adminService.getAdminById(id));
				map.put("admins",null);
				return "adminList";
		}
		else return "redirect:showAllAdmins";
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
