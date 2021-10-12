package com.model;

public class ScreenVO {
	private int screen_id;
	private String name;
	private String address;
	private String tel;
	private String company;
	
	public int getScreen_id() {
		return screen_id;
	}
	public String getName() {
		return name;
	}
	public String getAddress() {
		return address;
	}
	public String getTel() {
		return tel;
	}
	public String getCompany() {
		return company;
	}
	
	public ScreenVO(int screen_id, String name, String address, String tel, String company) {
		super();
		this.screen_id = screen_id;
		this.name = name;
		this.address = address;
		this.tel = tel;
		this.company = company;
	}
	
}
