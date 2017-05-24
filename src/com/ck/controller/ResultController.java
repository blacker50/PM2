package com.ck.controller;

import java.util.HashMap;
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

import com.ck.entity.Result;
import com.ck.service.ResultService;
import com.ck.service.TaskService;
import com.ck.utils.MybatisUtils;

@Controller
public class ResultController {
	@Autowired
	private ResultService resultService;
	@Autowired
	private TaskService taskService;

	public TaskService getTaskService() {
		return taskService;
	}

	public void setTaskService(TaskService taskService) {
		this.taskService = MybatisUtils.getTaskService();
	}
	
	public ResultService getResultService() {
		return resultService;
	}

	public void setResultService(ResultService resultService) {
		this.resultService = MybatisUtils.getResultService();
	}
	
	@RequestMapping("showAllResults")
	public String list(Map<String, Object> map) {
        map.put("results", resultService.selectAllResults());
		return "power_used_list";
	}
	
	@RequestMapping(value="resultByMonth", method=RequestMethod.POST)
	public String selectResultsByMonth(@RequestParam(value="mread_month", required=false) String mread_month, 
			Map<String, Object> map) {
		if(mread_month!=null&&mread_month!="") {
			map.put("results",resultService.selectResultsByMonth(mread_month));
			return "power_used_list";
		}
		return "redirect:showAllResults";
	}
	
	@RequestMapping(value="mr/task/{id}", method=RequestMethod.GET)
	public String mr_selectResultByTaskId(@PathVariable("id") Integer id,
			Map<String,Object> map) {
		Integer task_id=id;
		String dorm_id=taskService.getTaskById(id).getDorm_id();
		String mread_month=taskService.getTaskById(id).getMread_month();
		Integer mreader_id = taskService.getTaskById(id).getMreader_id();
		Map<String, Object> map2=new HashMap<String, Object>();
		map2.put("dorm_id", dorm_id);
		map2.put("mread_month", mread_month);
		map2.put("mreader_id", mreader_id);
		Result result=resultService.selectResultByMonthAndDorm(map2);
		if(result==null) {
			map.put("result", new Result(dorm_id, mread_month, mreader_id, task_id));	
		}else {
			map.put("result", result);
		}
		return "mr_input_result";
	}
	
	@RequestMapping(value="task/{id}", method=RequestMethod.GET)
	public String selectResultByTaskId(@PathVariable("id") Integer id,
			Map<String,Object> map) {
		String dorm_id=taskService.getTaskById(id).getDorm_id();
		String mread_month=taskService.getTaskById(id).getMread_month();
		Integer mreader_id = taskService.getTaskById(id).getMreader_id();
		Map<String, Object> map2=new HashMap<String, Object>();
		map2.put("dorm_id", dorm_id);
		map2.put("mread_month", mread_month);
		map2.put("mreader_id", mreader_id);
		Result result=resultService.selectResultByMonthAndDorm(map2);
		map.put("result", result);
		return "taskResult_see";
	}
	
	@RequestMapping(value="result", method=RequestMethod.POST)
	public String addResult(Result result,Map<String,Object> map,HttpServletRequest request) {
		HttpSession session=request.getSession();
		Integer mreader_id=(Integer)session.getAttribute("userId");
		result.setMreader_id(mreader_id);
		int index=resultService.addResult(result);
		if(index==0)
			return "mr_input_result";
		else {
			taskService.setTaskRead(result.getTask_id());
			return "redirect:showTasksByMRId";
		}
	}
	
	@RequestMapping(value="result", method=RequestMethod.PUT)
	public String updateResult(Result result) {
		int index=resultService.updateResult(result);
		if(index==0)
			return "mr_input_result";
		else {
			return "redirect:showTasksByMRId";
		}
	}
	
	@ModelAttribute("result")
	public void getResult(@RequestParam(value="id", required=false)Integer id,
			Map<String,Object> map){
		if(id!=null&&id>0){
			map.put("result", resultService.selectResultById(id));
		}else{
			map.put("result", new Result());			
		}
	}
	
}
