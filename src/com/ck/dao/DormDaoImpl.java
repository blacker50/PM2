package com.ck.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.ck.entity.Dorm;

public class DormDaoImpl extends SqlSessionDaoSupport implements DormDao {

	@Override
	public List<Dorm> selectAllDorms() {
		String statement = "com.ck.mapper.DormMapper.selectAllDorms";
		return getSqlSession().selectList(statement);
	}

	@Override
	public int addDorm(Dorm dorm) {
		String statement = "com.ck.mapper.DormMapper.addDorm";
		return getSqlSession().insert(statement, dorm);
	}

	@Override
	public int deleteDorm(String id) {
		String statement = "com.ck.mapper.DormMapper.deleteDorm";
		return getSqlSession().delete(statement, id);
	}

	@Override
	public int updateDorm(Dorm dorm) {
		String statement = "com.ck.mapper.DormMapper.updateDormMess";
		return getSqlSession().update(statement,dorm);
	}

	@Override
	public Dorm getDormById(String id) {
		String statement = "com.ck.mapper.DormMapper.getDormById";
		return getSqlSession().selectOne(statement,id);
	}

	@Override
	public int updateRemainPowerById(Dorm dorm) {
		String statement = "com.ck.mapper.DormMapper.updateRemainPowerById";
		return getSqlSession().update(statement, dorm);
	}

}
