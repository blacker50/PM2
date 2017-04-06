package com.ck.dao;

import java.util.List;

import com.ck.entity.Admin;

public interface AdminDao {
	public Admin selectAdmin(Admin admin);
	public int modifyPasswordById(Admin admin);
	public Admin getAdminById(Integer id);
}
