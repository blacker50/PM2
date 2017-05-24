package com.ck.dao;

import com.ck.entity.Admin;

public interface AdminDao {
	public Admin selectAdmin(Admin admin);
	public Admin getAdminById(Integer id);
	public int modifyAdminPassword(Admin admin);
}
