package com.ck.service;

import java.util.List;

import com.ck.dao.DormDao;
import com.ck.entity.Dorm;

public class DormServiceImpl implements DormService {

	private DormDao dormDao;
	
	public DormDao getDormDao() {
		return dormDao;
	}

	public void setDormDao(DormDao dormDao) {
		this.dormDao = dormDao;
	}

	@Override
	public List<Dorm> selectAllDorms() {
		return dormDao.selectAllDorms();
	}

	@Override
	public int addDorm(Dorm dorm) {
		return dormDao.addDorm(dorm);
	}

	@Override
	public int deleteDorm(String id) {
		return dormDao.deleteDorm(id);
	}

	@Override
	public int updateDorm(Dorm dorm) {
		return dormDao.updateDorm(dorm);
	}

	@Override
	public Dorm getDormById(String id) {
		return dormDao.getDormById(id);
	}

	@Override
	public int updateRemainPowerById(Dorm dorm) {
		return dormDao.updateRemainPowerById(dorm);
	}

}
