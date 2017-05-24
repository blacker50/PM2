package com.ck.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.ck.entity.Admin;

public class AdminDaoImpl extends SqlSessionDaoSupport implements AdminDao {

	@Override
	public Admin selectAdmin(Admin admin) {
		String statement = "com.ck.mapper.AdminMapper.selectAdmin";
		return getSqlSession().selectOne(statement, admin);
	}

	@Override
	public Admin getAdminById(Integer id) {
		String statement = "com.ck.mapper.AdminMapper.getAdminById";
		return getSqlSession().selectOne(statement, id);
	}

	@Override
	public int modifyAdminPassword(Admin admin) {
		String statement = "com.ck.mapper.AdminMapper.modifyAdminPassword";
		return getSqlSession().update(statement, admin);
	}



}
