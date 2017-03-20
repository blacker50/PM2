package com.ck.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.ck.entity.Admin;

public class AdminDaoImpl extends SqlSessionDaoSupport implements AdminDao {

	@Override
	public List<Admin> selectAllAdmins() {
		String statement = "com.ck.mapper.AdminMapper.selectAll";
		return getSqlSession().selectList(statement);
	}

	@Override
	public int addAdmin(Admin admin) {
		String statement = "com.ck.mapper.AdminMapper.addAdmin";
		return getSqlSession().insert(statement, admin);
	}

	@Override
	public int deleteAdmin(Integer id) {
		String statement = "com.ck.mapper.AdminMapper.deleteAdmin";
		return getSqlSession().delete(statement, id);
	}

	@Override
	public int updateAdmin(Admin admin) {
		String statement = "com.ck.mapper.AdminMapper.updateAdminMess";
		return getSqlSession().update(statement, admin);
	}

	@Override
	public int modifyPasswordById(Admin admin) {
		String statement = "com.ck.mapper.AdminMapper.modifyAdminPassword";
		return getSqlSession().update(statement,admin);
	}

	@Override
	public Admin getAdminById(Integer id) {
		String statement = "com.ck.mapper.AdminMapper.getAdminById";
		return getSqlSession().selectOne(statement, id);
	}


}
