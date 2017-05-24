
package com.ck.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.ck.entity.Result;

public class ResultDaoImpl extends SqlSessionDaoSupport implements ResultDao {

	@Override
	public List<Result> selectAllResults() {
		String statement="com.ck.mapper.ResultMapper.selectAllResults";
		return getSqlSession().selectList(statement);
	}

	@Override
	public int addResult(Result result) {
		String statement="com.ck.mapper.ResultMapper.addResult";
		return getSqlSession().insert(statement, result);
	}

	@Override
	public List<Result> selectResultsByMonth(String mread_month) {
		String statement="com.ck.mapper.ResultMapper.selectResultsByMonth";
		return getSqlSession().selectList(statement, mread_month);
	}

	@Override
	public Result selectResultByMonthAndDorm(Map<String, Object> map) {
		String statement="com.ck.mapper.ResultMapper.selectResultByMonthAndDorm";
		return getSqlSession().selectOne(statement, map);
	}

	@Override
	public Result selectResultById(Integer id) {
		String statement="com.ck.mapper.ResultMapper.selectResultById";
		return getSqlSession().selectOne(statement, id);
	}

	@Override
	public int updateResult(Result result) {
		String statement="com.ck.mapper.ResultMapper.updateResult";
		return getSqlSession().update(statement, result);
	}

	@Override
	public Integer getIdByMonthAndDorm(Map<String, Object> map) {
		String statement="com.ck.mapper.ResultMapper.getIdByMonthAndDorm";
		return getSqlSession().selectOne(statement, map);
	}

	@Override
	public Double getPowerReadById(Integer id) {
		String statement="com.ck.mapper.ResultMapper.getPowerReadById";
		return getSqlSession().selectOne(statement, id);
	}

}
