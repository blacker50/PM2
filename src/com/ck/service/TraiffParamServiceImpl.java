package com.ck.service;

import com.ck.dao.TraiffParamDao;
import com.ck.entity.TraiffParam;

public class TraiffParamServiceImpl implements TraiffParamService{

	private TraiffParamDao traiffParamDao;
	
	public TraiffParamDao getTraiffParamDao() {
		return traiffParamDao;
	}

	public void setTraiffParamDao(TraiffParamDao traiffParamDao) {
		this.traiffParamDao = traiffParamDao;
	}

	@Override
	public TraiffParam selectTraiffParam() {
		return traiffParamDao.selectTraiffParam();
	}
	
}
