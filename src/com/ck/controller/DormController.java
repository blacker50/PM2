package com.ck.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ck.entity.Dorm;
import com.ck.entity.MeterReader;
import com.ck.service.DormService;

@Controller
public class DormController {
	@Autowired
	private DormService dormService;

	public DormService getDormService() {
		return dormService;
	}

	public void setDormService(DormService dormService) {
		this.dormService = dormService;
	}
	
	@RequestMapping("/showAllDorms")
	public String showDormList(Map<String, Object> map) {
		map.put("dorms", dormService.selectAllDorms());
		return "dormList";
	}
	
	@RequestMapping(value="dorm", method=RequestMethod.GET)
	public String inputDorm(Map<String, Object> map) {
		map.put("dorm", new Dorm());
		return "dorm_add";
	}
	
	@RequestMapping(value="dorm/add", method=RequestMethod.POST)
	public String addDorm(Dorm dorm) {
		int index = dormService.addDorm(dorm);
		if(index==0)
		   return "dorm_add";
		else
		   return "redirect:/showAllDorms";
	}
	
	@RequestMapping(value="dorm/{id}",method=RequestMethod.DELETE)
	public String deleteDorm(@PathVariable("id") String id,Map<String, Object> map){
		dormService.deleteDorm(id);
		return "redirect:/showAllDorms";
	}
	
	@RequestMapping(value="dorm/{id}",method=RequestMethod.GET)
	public String updateDorm(@PathVariable("id") String id,Map<String, Object> map){
		map.put("dorm", dormService.getDormById(id));
		return "dorm_modi";
	}
	
	@RequestMapping(value="dorm", method=RequestMethod.PUT)
	public String updateDorm(Dorm dorm){
		dormService.updateDorm(dorm);
		return "redirect:showAllDorms";
	}
	
	@RequestMapping(value="dorm", method=RequestMethod.POST)
	public String showDormById(@RequestParam(value="id", required=false) String id,
			Map<String, Object> map){
		if(id!=null&&id!="") {
				map.put("dormSelected", dormService.getDormById(id));
				map.put("dorms",null);
				return "dormList";
		}
		else return "redirect:showAllDorms";
	}
	
	@ModelAttribute("dorm")
	public void getDorm(@RequestParam(value="id", required=false) String id,
			Map<String,Object> map){
		System.out.println("modelAttribute");
		if(id!=null){
			System.out.println(id);
			Dorm dorm = dormService.getDormById(id);
			map.put("dorm", dorm);
		}else{
			map.put("dorm", new Dorm());			
		}
	}
}
	
