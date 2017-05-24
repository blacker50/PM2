package com.ck.service;

import java.util.List;

import com.ck.entity.Admin;

public interface AdminService {
	public Admin login(Admin admin);
	public Admin getAdminById(Integer id);
	public int modifyAdminPassword(Admin admin);
}
