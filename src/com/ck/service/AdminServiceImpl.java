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

	public List<Admin> selectAllAdmins() {
		return adminDao.selectAllAdmins();
	}

	@Override
	public int addAdmin(Admin admin) {
		return adminDao.addAdmin(admin);
	}

	@Override
	public int deleteAdmin(Integer id) {
		return adminDao.deleteAdmin(id);
	}

	@Override
	public int updateAdmin(Admin admin) {
		return adminDao.updateAdmin(admin);
	}

	@Override
	public int modifyPasswordById(Admin admin) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Admin getAdminById(Integer id) {
		return adminDao.getAdminById(id);
	}

}
