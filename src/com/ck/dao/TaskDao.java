package com.ck.dao;

import java.util.List;
import java.util.Map;

import com.ck.entity.Task;

public interface TaskDao {
	public List<Task> selectAllTasks();
	public int addTask(Task task);
	public Task getTaskById(Integer id);
	public List<Task> getTasksByMonth(String mread_month);
	public List<Task> getTasksByDormId(String dorm_id);
	public List<Task> getTasksByMRId(Integer mreader_id);
	public List<Task> getTasksByMRIdAndMonth(Map<String, Object> map);
	public int setTaskRead(Integer id);
}
