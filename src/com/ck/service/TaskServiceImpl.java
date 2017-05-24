package com.ck.service;

import java.util.List;
import java.util.Map;

import com.ck.dao.TaskDao;
import com.ck.entity.Task;

public class TaskServiceImpl implements TaskService{

	private TaskDao taskDao;
	
	public TaskDao getTaskDao() {
		return taskDao;
	}

	public void setTaskDao(TaskDao taskDao) {
		this.taskDao = taskDao;
	}

	@Override
	public List<Task> selectAllTasks() {
		return taskDao.selectAllTasks();
	}

	@Override
	public int addTask(Task task) {
		return taskDao.addTask(task);
	}

	@Override
	public List<Task> getTasksByMonth(String mread_month) {
		return taskDao.getTasksByMonth(mread_month);
	}

	@Override
	public List<Task> getTasksByDormId(String dorm_id) {
		return taskDao.getTasksByDormId(dorm_id);
	}

	@Override
	public Task getTaskById(Integer id) {
		return taskDao.getTaskById(id);
	}

	@Override
	public List<Task> getTasksByMRId(Integer mreader_id) {
		return taskDao.getTasksByMRId(mreader_id);
	}

	@Override
	public List<Task> getTasksByMRIdAndMonth(Map<String, Object> map) {
		return taskDao.getTasksByMRIdAndMonth(map);
	}

	@Override
	public int setTaskRead(Integer id) {
		return taskDao.setTaskRead(id);
	}

}
