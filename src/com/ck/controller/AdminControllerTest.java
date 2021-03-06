package com.ck.controller;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.ck.entity.Admin;
import com.ck.service.AdminService;
import com.ck.utils.MybatisUtils;

public class AdminControllerTest {

	private AdminService adminService;
	@Before
	public void setUp() throws Exception {
		adminService=MybatisUtils.getAdminService();
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testLogin(Admin admin) {
		System.out.println(adminService.login(admin));
	}

}
