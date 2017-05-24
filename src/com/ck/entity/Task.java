package com.ck.entity;
//抄表任务表
public class Task {
	private Integer id;
	private String dorm_id;
	private String mread_month;
	private Integer mreader_id;
	private Integer is_read;   //是否已抄表，1是0否
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
	public String getMread_month() {
		return mread_month;
	}
	public void setMread_month(String mread_month) {
		this.mread_month = mread_month;
	}
	public Integer getMreader_id() {
		return mreader_id;
	}
	public void setMreader_id(Integer mreader_id) {
		this.mreader_id = mreader_id;
	}
	public Integer getIs_read() {
		return is_read;
	}
	public void setIs_read(Integer is_read) {
		this.is_read = is_read;
	}
	
}
