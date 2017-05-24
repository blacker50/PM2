package com.ck.controller;


import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.ck.entity.Dorm;
import com.ck.service.DormService;
import com.ck.utils.MybatisUtils;

public class DormControllerTest {
	private DormService dormService;
	@Before
	public void setUp() throws Exception {
		dormService = MybatisUtils.getDormService();
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testSelectList() {
		Dorm dorm = dormService.getDormById("A311");
		System.out.println(dorm);
	}

}
