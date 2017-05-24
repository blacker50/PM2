package com.ck.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.ck.entity.Task;

public class TaskDaoImpl extends SqlSessionDaoSupport implements TaskDao {

	@Override
	public List<Task> selectAllTasks() {
		String statement="com.ck.mapper.TaskMapper.selectAllTasks";
		return getSqlSession().selectList(statement);
	}

	@Override
	public int addTask(Task task) {
		String statement="com.ck.mapper.TaskMapper.addTask";	
		return getSqlSession().insert(statement,task);
	}

	@Override
	public List<Task> getTasksByMonth(String mread_month) {
		String statement="com.ck.mapper.TaskMapper.getTasksByMonth";		
		return getSqlSession().selectList(statement, mread_month);
	}

	@Override
	public List<Task> getTasksByDormId(String dorm_id) {
		String statement="com.ck.mapper.TaskMapper.getTasksByDormId";	
		return getSqlSession().selectList(statement, dorm_id);
	}

	@Override
	public Task getTaskById(Integer id) {
		String statement="com.ck.mapper.TaskMapper.getTaskById";
		return getSqlSession().selectOne(statement, id);
	}

	@Override
	public List<Task> getTasksByMRId(Integer mreader_id) {
		String statement="com.ck.mapper.TaskMapper.getTasksByMRId";
		return getSqlSession().selectList(statement, mreader_id);
	}

	@Override
	public List<Task> getTasksByMRIdAndMonth(Map<String, Object> map) {
		String statement="com.ck.mapper.TaskMapper.getTasksByMRIdAndMread_month";
		return getSqlSession().selectList(statement,map);
	}

	@Override
	public int setTaskRead(Integer id) {
		String statement="com.ck.mapper.TaskMapper.setTaskRead";
		return getSqlSession().update(statement, id);
	}

}
