package com.postoffice.web.dto;

import java.sql.Date;

public class PackageDTO {
	private int package_id;
	private String village;
	private int package_weight;
	private String state_id;
	private Date arrival_date;
	private String package_division;
	
	public int getPackage_id() {
		return package_id;
	}
	public void setPackage_id(int package_id) {
		this.package_id = package_id;
	}
	public String getVillage() {
		return village;
	}
	public void setVillage(String village) {
		this.village = village;
	}
	
	public int getPackage_weight() {
		return package_weight;
	}
	public void setPackage_weight(int package_weight) {
		this.package_weight = package_weight;
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
	public String getPackage_division() {
		return package_division;
	}
	public void setPackage_division(String package_division) {
		this.package_division = package_division;
	}	
}
