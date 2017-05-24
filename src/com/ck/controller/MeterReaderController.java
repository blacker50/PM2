package com.ck.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ck.entity.MeterReader;
import com.ck.service.MeterReaderService;
import com.ck.utils.MybatisUtils;

@Controller
public class MeterReaderController {
	@Autowired
	private MeterReaderService meterReaderService;
	
	public MeterReaderService getMeterReaderService() {
		return meterReaderService;
	}

	public void setMeterReaderService() {
		this.meterReaderService =MybatisUtils.getMeterReaderService();
	}
	
	@ResponseBody
	@RequestMapping(value="meterReader/login")
	public String login(MeterReader meterReader, HttpServletRequest request) {
		MeterReader loginMeterReader = meterReaderService.login(meterReader);
		String loginState;
		if(loginMeterReader==null)
			loginState="false";
		else {
			loginState="true";
			HttpSession session=request.getSession();
			session.setAttribute("user", loginMeterReader);
			session.setAttribute("userName", loginMeterReader.getName());
			session.setAttribute("password", loginMeterReader.getPassword());
			session.setAttribute("userId", loginMeterReader.getId());
		}
		return loginState;
	}
	
	@ResponseBody
	@RequestMapping(value="meterReader/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session=request.getSession();
		session.removeAttribute("user");
		session.removeAttribute("userName");
		session.removeAttribute("password");
		session.removeAttribute("userId");
		return "logout";
	}
	@RequestMapping("/showAllMeterReaders")
	public String list(Map<String, Object> map) {
		map.put("meterReaders", meterReaderService.selectAllMeterReaders());
		return "meterReaderList";
	}
	
	@RequestMapping(value="meterReader", method=RequestMethod.GET)
	public String inputMeterReader(Map<String, Object> map) {
		map.put("meterReader", new MeterReader());
		return "meterReader_add";
	}
	
	@RequestMapping(value="meterReader/add", method=RequestMethod.POST)
	public String addMeterReader(MeterReader meterReader) {
		int index = meterReaderService.addMeterReader(meterReader);
		if(index==0)
		   return "meterReader_add";
		else
		   return "redirect:/showAllMeterReaders";
	}
	
	@RequestMapping(value="meterReader/{id}",method=RequestMethod.DELETE)
	public String deleteMeterReader(@PathVariable("id") Integer id,Map<String, Object> map){
		meterReaderService.deleteMeterReader(id);
		return "redirect:/showAllMeterReaders";
	}
	
	@RequestMapping(value="meterReader/{id}",method=RequestMethod.GET)
	public String updateMeterReader(@PathVariable("id") Integer id,Map<String, Object> map){
		map.put("meterReader", meterReaderService.getMeterReaderById(id));
		return "meterReader_modi";
	}
	
	@RequestMapping(value="meterReader", method=RequestMethod.PUT)
	public String updateMeterReader(MeterReader meterReader){
		meterReaderService.updateMeterReader(meterReader);
		return "redirect:showAllMeterReaders";
	}
	
	@RequestMapping(value="mr/pwd_modi", method=RequestMethod.GET) 
	public String modifyMRPassword(Map<String, Object> map,HttpServletRequest request) {
		HttpSession session=request.getSession();
		map.put("meterReader", meterReaderService.getMeterReaderById((Integer)session.getAttribute("userId")));
		return "mr_pwd_modi";
	}
	
	@RequestMapping(value="mr/meterReader", method=RequestMethod.PUT)
	public String modifyMRPassword(MeterReader meterReader) {
		meterReaderService.modifyMRPassword(meterReader);
		return "redirect:../showTasksByMRId";
	}
	
	@RequestMapping(value="meterReader", method=RequestMethod.POST)
	public String showMeterReaderById(@RequestParam(value="id", required=false) Integer id,
			Map<String, Object> map){
		if(id!=null&&id>0) {
				map.put("meterReaderSelected", meterReaderService.getMeterReaderById(id));
				map.put("meterReaders",null);
				return "meterReaderList";
		}
		else return "redirect:showAllMeterReaders";
	}
	
	@ModelAttribute("meterReader")
	public void getMeterReader(@RequestParam(value="id", required=false) Integer id,
			Map<String,Object> map){
		if(id!=null&&id>0){
			MeterReader meterReader = meterReaderService.getMeterReaderById(id);
			map.put("meterReader", meterReader);
		}else{
			map.put("meterReader", new MeterReader());			
		}
	}
}
