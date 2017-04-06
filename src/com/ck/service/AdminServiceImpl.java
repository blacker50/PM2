package com.ck.service;

import java.util.List;

import com.ck.dao.AdminDao;
import com.ck.entity.Admin;

public class AdminServiceImpl implements AdminService {
	private AdminDao adminDao;
	
	public AdminDao getAdminDao() {
		return adminDao;
	}

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	@Override
	public boolean login(Admin admin) {
		return adminDao.selectAdmin(admin)==null?false:true;
	}

	@Override
	public int modifyPasswordById(Admin admin) {
		return 0;
	}

	@Override
	public Admin getAdminById(Integer id) {
		return adminDao.getAdminById(id);
	}



}
