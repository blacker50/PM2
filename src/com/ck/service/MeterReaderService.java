package com.ck.service;

import java.util.List;

import com.ck.entity.MeterReader;

public interface MeterReaderService {
	public List<MeterReader> selectAllMeterReaders();
	public int addMeterReader(MeterReader meterReader);
	public int deleteMeterReader(Integer id);
	public int updateMeterReader(MeterReader meterReader);
	public MeterReader getMeterReaderById(Integer id);
}
