package com.ck.entity;

public class Dorm {
	private String building;
	private Integer num_id;
	private String id;
	private String name;
	private String phone;
	private double remain_power=0;
	
	public String getBuilding() {
		return building;
	}
	public void setBuilding(String building) {
		this.building = building;
	}
	public Integer getNum_id() {
		return num_id;
	}
	public void setNum_id(Integer num_id) {
		this.num_id = num_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public double getRemain_power() {
		return remain_power;
	}
	public void setRemain_power(double remain_power) {
		this.remain_power = remain_power;
	}
	@Override
	public String toString() {
		return "Dorm [building=" + building + ", num_id=" + num_id + ", id="
				+ id + ", name=" + name + ", phone=" + phone
				+ ", remain_power=" + remain_power + "]";
	}
	
}
