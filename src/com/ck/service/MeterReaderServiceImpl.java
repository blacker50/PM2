package com.ck.service;

import java.util.List;

import com.ck.dao.MeterReaderDao;
import com.ck.entity.MeterReader;

public class MeterReaderServiceImpl implements MeterReaderService {

	private MeterReaderDao meterReaderDao;
	

	public MeterReaderDao getMeterReaderDao() {
		return meterReaderDao;
	}

	public void setMeterReaderDao(MeterReaderDao meterReaderDao) {
		this.meterReaderDao = meterReaderDao;
	}

	@Override
	public MeterReader login(MeterReader meterReader) {
		return meterReaderDao.selectMeterReader(meterReader);
	}

	@Override
	public List<MeterReader> selectAllMeterReaders() {
		return meterReaderDao.selectAllMeterReaders();
	}

	@Override
	public int addMeterReader(MeterReader meterReader) {
		return meterReaderDao.addMeterReader(meterReader);
	}

	@Override
	public int deleteMeterReader(Integer id) {
		return meterReaderDao.deleteMeterReader(id);
	}

	@Override
	public int updateMeterReader(MeterReader meterReader) {
		return meterReaderDao.updateMeterReader(meterReader);
	}

	@Override
	public MeterReader getMeterReaderById(Integer id) {
		return meterReaderDao.getMeterReaderById(id);
	}

	@Override
	public int modifyMRPassword(MeterReader meterReader) {
		return meterReaderDao.modifyMRPassword(meterReader);
	}

}
