package com.ck.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.ck.dao.ResultDao;
import com.ck.entity.Result;
import com.ck.utils.MonthPro;

public class ResultServiceImpl implements ResultService {

	private ResultDao resultDao;
	
	public ResultDao getResultDao() {
		return resultDao;
	}

	public void setResultDao(ResultDao resultDao) {
		this.resultDao = resultDao;
	}

	@Override
	public List<Result> selectAllResults() {
		List<Result> results = resultDao.selectAllResults();
        Iterator<Result> it1 = results.iterator();
        while(it1.hasNext()){
        	Map<String, Object>map2=new HashMap<String, Object>();
        	Result tmp = it1.next();
            String last_month=MonthPro.getLastMonth(tmp.getMread_month());
            String dorm_id=tmp.getDorm_id();
            map2.put("mread_month", last_month);
            map2.put("dorm_id", dorm_id);
            Double last_power_read = getPowerByMonthAndDorm(map2);
            Double power_read = tmp.getPower_read();
            
            tmp.setLast_power_read(last_power_read);    //上月读数可能为空
            if(last_power_read!=null) {
            	tmp.setPower_use(power_read-last_power_read);
            	
            }
            tmp.setRemain_power(1.0);
        }
		return results;
	}

	@Override
	public int addResult(Result result) {
		return resultDao.addResult(result);
	}

	@Override
	public List<Result> selectResultsByMonth(String mread_month) {
		List<Result> results = resultDao.selectResultsByMonth(mread_month);
        Iterator<Result> it1 = results.iterator();
        while(it1.hasNext()){
        	Map<String, Object>map2=new HashMap<String, Object>();
        	Result tmp = it1.next();
            String last_month=MonthPro.getLastMonth(tmp.getMread_month());
            String dorm_id=tmp.getDorm_id();
            map2.put("mread_month", last_month);
            map2.put("dorm_id", dorm_id);
            Double last_power_read = getPowerByMonthAndDorm(map2);
            Double power_read = tmp.getPower_read();
            
            tmp.setLast_power_read(last_power_read);    //上月读数可能为空
            if(last_power_read!=null)
            	tmp.setPower_use(power_read-last_power_read);
            tmp.setRemain_power(1.0);
        }
		return results;
	}

	@Override
	public Result selectResultByMonthAndDorm(Map<String, Object> map) {
		return resultDao.selectResultByMonthAndDorm(map);
	}

	@Override
	public Result selectResultById(Integer id) {
		return resultDao.selectResultById(id);
	}

	@Override
	public int updateResult(Result result) {
		return resultDao.updateResult(result);
	}

	@Override
	public Double getPowerByMonthAndDorm(Map<String, Object> map) {
		Integer id=resultDao.getIdByMonthAndDorm(map);
		Double power_read;
		if(id==null)
			power_read=null;
		else power_read=resultDao.getPowerReadById(id);
		return power_read;
	}


}
