package com.ck.dao;

import java.util.List;

import com.ck.entity.Dorm;

public interface DormDao {
	public List<Dorm> selectAllDorms();
	public int addDorm(Dorm dorm);
	public int deleteDorm(String id);
	public int updateDorm(Dorm dorm);
	public Dorm getDormById(String id);
	public int updateRemainPowerById(Dorm dorm);
}
