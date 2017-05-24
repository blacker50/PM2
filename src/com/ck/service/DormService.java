package com.ck.service;

import java.util.List;

import com.ck.entity.Dorm;

public interface DormService {
	public List<Dorm> selectAllDorms();
	public int addDorm(Dorm dorm);
	public int deleteDorm(String id);
	public int updateDorm(Dorm dorm);
	public Dorm getDormById(String id);
	public int updateRemainPowerById(Dorm dorm);
}
