package com.postoffice.web.dto;

import java.util.Date;

public class PackageDTO {
	private String package_id;
	private String village;
	private int package_weghit;
	private String state_id;
	private Date arrival_date;
	public String getPackage_id() {
		return package_id;
	}
	public void setPackage_id(String package_id) {
		this.package_id = package_id;
	}
	public String getVillage() {
		return village;
	}
	public void setVillage(String village) {
		this.village = village;
	}
	public int getPackage_weghit() {
		return package_weghit;
	}
	public void setPackage_weghit(int package_weghit) {
		this.package_weghit = package_weghit;
	}
	public String getState_id() {
		return state_id;
	}
	public void setState_id(String state_id) {
		this.state_id = state_id;
	}
	public Date getArrival_date() {
		return arrival_date;
	}
	public void setArrival_date(Date arrival_date) {
		this.arrival_date = arrival_date;
	}
		
}
