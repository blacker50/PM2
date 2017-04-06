package com.ck.service;

import java.util.List;

import com.ck.entity.Admin;

public interface AdminService {
	public boolean login(Admin admin);
	public int modifyPasswordById(Admin admin);
	public Admin getAdminById(Integer id);
}
