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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyPasswordById(Integer id, String password) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Admin getAdminById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getMaxAdminId() {
		String statement = "com.ck.mapper.AdminMapper.getMaxAdminId";
		return getSqlSession().selectOne(statement);
	}

}
