package com.ck.entity;

public class Result {
	private Integer id;
	private String dorm_id;
	private Integer mreader_id;
	private String mread_month;
	private Integer task_id;
	private Double last_power_read;   
	private Double power_read;
	private Double power_use;  
	private Double remain_power; 
	private Double unit_price;
	private Integer is_exception;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDorm_id() {
		return dorm_id;
	}
	public void setDorm_id(String dorm_id) {
		this.dorm_id = dorm_id;
	}
	public Integer getMreader_id() {
		return mreader_id;
	}
	public void setMreader_id(Integer mreader_id) {
		this.mreader_id = mreader_id;
	}

	public String getMread_month() {
		return mread_month;
	}
	public void setMread_month(String mread_month) {
		this.mread_month = mread_month;
	}
	public Integer getTask_id() {
		return task_id;
	}
	public void setTask_id(Integer task_id) {
		this.task_id = task_id;
	}
	public Double getPower_read() {
		return power_read;
	}
	public void setPower_read(Double power_read) {
		this.power_read = power_read;
	}
	public Integer getIs_exception() {
		return is_exception;
	}
	public void setIs_exception(Integer is_exception) {
		this.is_exception = is_exception;
	}
	
	public Double getLast_power_read() {
		return last_power_read;
	}
	public void setLast_power_read(Double last_power_read) {
		this.last_power_read = last_power_read;
	}
	public Double getRemain_power() {
		return remain_power;
	}
	public void setRemain_power(Double remain_power) {
		this.remain_power = remain_power;
	}
	public Double getPower_use() {
		return power_use;
	}
	public void setPower_use(Double power_use) {
		this.power_use = power_use;
	}
	public Double getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(Double unit_price) {
		this.unit_price = unit_price;
	}
	public Result() {
		super();
	}
	public Result(String dorm_id, String mread_month, Integer mreader_id, Integer task_id) {
		super();
		this.dorm_id = dorm_id;
		this.mreader_id = mreader_id;
		this.mread_month = mread_month;
		this.task_id = task_id;
	}
	
}
