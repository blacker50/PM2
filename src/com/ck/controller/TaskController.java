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
import com.ck.entity.Task;
import com.ck.service.TaskService;
import com.ck.utils.MybatisUtils;


@Controller
public class TaskController {
	@Autowired
	private TaskService taskService;

	public TaskService getTaskService() {
		return taskService;
	}

	public void setTaskService(TaskService taskService) {
		this.taskService = MybatisUtils.getTaskService();
	}
	
	@RequestMapping("/showAllTasks")
	public String list(Map<String, Object> map) {
		map.put("tasks", taskService.selectAllTasks());
		return "taskList";
	}
	
	@RequestMapping(value="task", method=RequestMethod.GET)
	public String inputTask(Map<String, Object> map) {
		map.put("task", new Task());
		return "task_add";
	}
	
	@RequestMapping(value="task/add", method=RequestMethod.POST)
	public String addTask(Task task) {
		int index=taskService.addTask(task);
		if(index==0)
			return "task_add";
		else 
			return "redirect:/showAllTasks";
	}
	
	@RequestMapping(value="task", method=RequestMethod.POST)
	public String showTasksByMonth(@RequestParam(value="mread_month", required=false) String mread_month,
			Map<String, Object> map){
		if(mread_month!=null&&mread_month!="") {
				map.put("tasks", taskService.getTasksByMonth(mread_month));
				return "taskList";
		}
	    return "redirect:showAllTasks";
	}
		
	@RequestMapping("/showTasksByMRId")
	public String showTasksByMeterReaderId(Map<String, Object> map,HttpServletRequest request) {
		HttpSession session=request.getSession();
		map.put("tasksByMRId", taskService.getTasksByMRId((Integer)session.getAttribute("userId")));
		return "mr_taskList";
	}
	
	@RequestMapping(value="mr/task", method=RequestMethod.POST)
	public String showTasksByMRIdAndMonth(@RequestParam(value="mread_month", required=false) String mread_month,
			Map<String, Object> map,HttpServletRequest request){
		if(mread_month!=null&&mread_month!="") {
			HttpSession session=request.getSession();
			Integer mreader_id=(Integer)session.getAttribute("userId");
			Map<String, Object> map2=new HashMap<String, Object>();
			map2.put("mreader_id", mreader_id);
			map2.put("mread_month", mread_month);
			map.put("tasksByMRId", taskService.getTasksByMRIdAndMonth(map2));
			return "mr_taskList";
		}
	    return "redirect:../showTasksByMRId";
	}
	
	
	@ModelAttribute("task")
	public void getTask(@RequestParam(value="id", required=false)Integer id,
			Map<String,Object> map){
		System.out.println("modelAttribute");
		if(id!=null&&id>0){
			System.out.println(id);
			map.put("task", taskService.getTaskById(id));
		}else{
			map.put("task", new Task());			
		}
	}
}
