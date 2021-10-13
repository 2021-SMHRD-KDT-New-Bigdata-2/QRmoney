package com.model;

public class FieldVO {
	private int field_id;
	private String name;
	private String membership;
	private String hole;
	private String address;
	private String tel;
	private String caddyfee;
	private String cartfee;
	private String weekfee;
	private String weekendfee;
	private String sitelink;
	
	public int getField_id() {
		return field_id;
	}
	public String getName() {
		return name;
	}
	public String getMembership() {
		return membership;
	}
	public String getHole() {
		return hole;
	}
	public String getAddress() {
		return address;
	}
	public String getTel() {
		return tel;
	}
	public String getCaddyfee() {
		return caddyfee;
	}
	public String getCartfee() {
		return cartfee;
	}
	public String getWeekfee() {
		return weekfee;
	}
	public String getWeekendfee() {
		return weekendfee;
	}
	public String getSitelink() {
		return sitelink;
	}
	
	public FieldVO(int field_id, String name, String membership, String hole, String address, String tel,
			String caddyfee, String cartfee, String weekfee, String weekendfee, String sitelink) {
		super();
		this.field_id = field_id;
		this.name = name;
		this.membership = membership;
		this.hole = hole;
		this.address = address;
		this.tel = tel;
		this.caddyfee = caddyfee;
		this.cartfee = cartfee;
		this.weekfee = weekfee;
		this.weekendfee = weekendfee;
		this.sitelink = sitelink;
	}
	
	public FieldVO() {
		super();
	}
	
}
