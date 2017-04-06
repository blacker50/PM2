package com.ck.controller;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.ck.entity.MeterReader;
import com.ck.service.MeterReaderService;
import com.ck.utils.MybatisUtils;

public class MeterReaderControllerTest {
	private MeterReaderService meterReaderService;
	@Before
	public void setUp() throws Exception {
		meterReaderService = MybatisUtils.getMeterReaderService();
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testSelectList() {
		List<MeterReader> list = meterReaderService.selectAllMeterReaders();
		System.out.println(list.size());
	}

}
