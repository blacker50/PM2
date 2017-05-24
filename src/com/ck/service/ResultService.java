package com.ck.service;

import java.util.List;
import java.util.Map;

import com.ck.entity.Result;

public interface ResultService {
	public List<Result> selectAllResults();
	public int addResult(Result result);
	public List<Result> selectResultsByMonth(String mread_month);
	public Result selectResultByMonthAndDorm(Map<String, Object> map);
	public Result selectResultById(Integer id);
	public int updateResult(Result result);
	public Double getPowerByMonthAndDorm(Map<String, Object> map);
}
