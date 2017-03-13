package com.ck.dao;

import java.util.List;

import com.ck.entity.Admin;

public interface AdminDao {
	public List<Admin> selectAllAdmins();
	public int addAdmin(Admin admin);
	public int deleteAdmin(Integer id);
	public int updateAdmin(Admin admin);
	public int modifyPasswordById(Integer id, String password);
	public Admin getAdminById(Integer id);
	public int getMaxAdminId();
}
