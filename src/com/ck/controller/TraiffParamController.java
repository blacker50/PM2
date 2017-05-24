package com.ck.controller;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ck.service.TraiffParamService;
import com.ck.utils.MybatisUtils;

@Controller
public class TraiffParamController {
	@Autowired
	private TraiffParamService traiffParamService;
	
	public TraiffParamService getTraiffParamService() {
		return traiffParamService;
	}

	public void setTraiffParamService(TraiffParamService traiffParamService) {
		this.traiffParamService = MybatisUtils.getTraiffParamService();
	}

	@RequestMapping("showTraiffParam")
	public String selectTraiffParam(Map<String, Object> map) {
		System.out.println("haha");
		map.put("traiffParam", traiffParamService.selectTraiffParam());
		return "set_traiff_param";
	}

}