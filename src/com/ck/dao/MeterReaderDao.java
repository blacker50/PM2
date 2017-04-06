package com.ck.dao;

import java.util.List;

import com.ck.entity.MeterReader;

public interface MeterReaderDao {
	public List<MeterReader> selectAllMeterReaders();
	public int addMeterReader(MeterReader meterReader);
	public int deleteMeterReader(Integer id);
	public int updateMeterReader(MeterReader meterReader);
	public MeterReader getMeterReaderById(Integer id);
}
