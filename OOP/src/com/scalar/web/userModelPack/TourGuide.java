package com.scalar.web.userModelPack;

import java.sql.Date;

public class TourGuide extends User {

	private String category;
	private String telephone;
	private String address;
	private Date expDate;
	private String language_1;
	private String language_2;
	private String language_3;
	private String language_4;
	private String language_5;
	
	

	public TourGuide(String id, String firstName, String lastName, String emailAddress, String country, String username,
			String category, String telephone, String address, Date expDate, String language_1, String language_2,
			String language_3, String language_4, String language_5) {
		super(id, firstName, lastName, emailAddress, country, username);
		this.category = category;
		this.telephone = telephone;
		this.address = address;
		this.expDate = expDate;
		this.language_1 = language_1;
		this.language_2 = language_2;
		this.language_3 = language_3;
		this.language_4 = language_4;
		this.language_5 = language_5;
	}

	public String getLanguage_1() {
		return language_1;
	}

	public void setLanguage_1(String language_1) {
		this.language_1 = language_1;
	}

	public String getLanguage_2() {
		return language_2;
	}

	public void setLanguage_2(String language_2) {
		this.language_2 = language_2;
	}

	public String getLanguage_3() {
		return language_3;
	}

	public void setLanguage_3(String language_3) {
		this.language_3 = language_3;
	}

	public String getLanguage_4() {
		return language_4;
	}

	public void setLanguage_4(String language_4) {
		this.language_4 = language_4;
	}

	public String getLanguage_5() {
		return language_5;
	}

	public void setLanguage_5(String language_5) {
		this.language_5 = language_5;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getExpDate() {
		return expDate;
	}

	public void setExpDate(Date expDate) {
		this.expDate = expDate;
	}

	@Override
	public String toString() {
		return "TourGuide [category=" +category+", languages=" + language_1 + ", telephone =" + telephone +",address =" + address +",expDate="+expDate+"]" ;
		
	}

	/*@Override
	public void send(String msg) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void receive(String msg) {
		// TODO Auto-generated method stub
		
	}*/
	
}
