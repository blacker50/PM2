package com.ck.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.ck.entity.MeterReader;

public class MeterReaderDaoImpl extends SqlSessionDaoSupport implements MeterReaderDao {

	@Override
	public MeterReader selectMeterReader(MeterReader meterReader) {
		String statement = "com.ck.mapper.MeterReaderMapper.selectMeterReader";
		return getSqlSession().selectOne(statement, meterReader);
	}
	
	@Override
	public List<MeterReader> selectAllMeterReaders() {
		String statement = "com.ck.mapper.MeterReaderMapper.selectAllMeterReaders";
		return getSqlSession().selectList(statement);
	}

	@Override
	public int addMeterReader(MeterReader meterReader) {
		String statement = "com.ck.mapper.MeterReaderMapper.addMeterReader";
		return getSqlSession().insert(statement,meterReader);
	}

	@Override
	public int deleteMeterReader(Integer id) {
		String statement = "com.ck.mapper.MeterReaderMapper.deleteMeterReader";
		return getSqlSession().delete(statement, id);
	}

	@Override
	public int updateMeterReader(MeterReader meterReader) {
		String statement = "com.ck.mapper.MeterReaderMapper.updateMeterReaderMess";
		return getSqlSession().update(statement,meterReader);
	}

	@Override
	public MeterReader getMeterReaderById(Integer id) {
		String statement = "com.ck.mapper.MeterReaderMapper.getMeterReaderById";
		return getSqlSession().selectOne(statement, id);
	}

	@Override
	public int modifyMRPassword(MeterReader meterReader) {
		String statement = "com.ck.mapper.MeterReaderMapper.modifyMRPassword";
		return getSqlSession().update(statement, meterReader);
	}

}
