package com.scalar.web.userModelPack;

public class Places {

	private String place_name;
	private String place_city;
	private String place_desc;
	private String P_category;
	private String P_caption;
	private String P_img_filename;
	private String P_img_path;
	private String[] P_img_files;
	private String P_image_ID;
	
	public Places(String place_name, String place_city, String place_desc, String p_category, String p_caption,
			String p_img_filename, String p_image_ID) {
		
		this.place_name = place_name;
		this.place_city = place_city;
		this.place_desc = place_desc;
		P_category = p_category;
		P_caption = p_caption;
		P_img_filename = p_img_filename;
		P_image_ID = p_image_ID;
	}

	public Places(String place_name, String place_city, String place_desc, String p_category, String p_caption,String p_img_filename, String p_img_path, String[] p_img_files) {
		
		this.place_name = place_name;
		this.place_city = place_city;
		this.place_desc = place_desc;
		P_category = p_category;
		P_caption = p_caption;
		P_img_filename = p_img_filename;
		P_img_path = p_img_path;
		P_img_files = p_img_files;
	}

	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	public String getP_caption() {
		return P_caption;
	}

	public void setP_caption(String p_caption) {
		P_caption = p_caption;
	}

	public String getP_img_path() {
		return P_img_path;
	}

	public void setP_img_path(String p_img_path) {
		P_img_path = p_img_path;
	}

	public String getP_img_filename() {
		return P_img_filename;
	}

	public void setP_img_filename(String p_img_filename) {
		P_img_filename = p_img_filename;
	}
	
	public String getPlace_id() {
		return P_image_ID;
	}

	public void setPlace_id(String place_id) {
		this.P_image_ID = place_id;
	}

	public String getPlace_desc() {
		return place_desc;
	}

	public void setPlace_desc(String place_desc) {
		this.place_desc = place_desc;
	}

	public String getP_category() {
		return P_category;
	}

	public void setP_category(String p_category) {
		P_category = p_category;
	}
	
	public String[] getP_img_files() {
		return P_img_files;
	}

	public String getPlace_city() {
		return place_city;
	}

	public void setPlace_city(String place_city) {
		this.place_city = place_city;
	}

	public void setP_img_files(String[] p_img_files) {
		P_img_files = p_img_files;
	}

	public String getP_image_ID() {
		return P_image_ID;
	}

	public void setP_image_ID(String p_image_ID) {
		P_image_ID = p_image_ID;
	}

	@Override
	public String toString() {
		return "Places [Name=" +place_name+", id=" + place_city + ", descrption =" + place_desc +",images =" + P_img_filename +",category="+P_category+"]" ;
		
	}

	

	
}
