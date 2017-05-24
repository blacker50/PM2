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
	public Admin login(Admin admin) {
		return adminDao.selectAdmin(admin);
	}

	@Override
	public Admin getAdminById(Integer id) {
		return adminDao.getAdminById(id);
	}

	@Override
	public int modifyAdminPassword(Admin admin) {
		return adminDao.modifyAdminPassword(admin);
	}



}
