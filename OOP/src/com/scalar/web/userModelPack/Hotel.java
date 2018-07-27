package com.scalar.web.userModelPack;

public class Hotel {
	private String pictureUrl;
	private String name;
	private String city;
	private String address;
	private String phone;
	private String web;
	private String type;
	private int id;
	
	public Hotel(int id,String pictureUrl, String name, String city, String address, String phone, String web, String type) {
		this.name = name;
		this.pictureUrl = pictureUrl;
		this.city = city;
		this.address = address;
		this.phone = phone;
		this.web = web;
		this.type = type;
		this.id = id;
	}
	
	public String getName() {
		return this.name;
	}
	
	public String getPictureUrl() {
		return this.pictureUrl;
	}
	public String getCity() {
		return this.city;
	}
	
	public String getAddress() {
		return this.address;
	}
	
	public String getPhone() {
		return this.phone;
	}
	public String getWeb() {
		return this.web;
	}
	
	public String gettype() {
		return type;
	}
	
	public int getID() {
		return this.id;
	}
	
	
	
}
