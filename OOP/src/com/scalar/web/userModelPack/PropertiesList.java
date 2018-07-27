package com.scalar.web.userModelPack;

import java.util.*;

public class PropertiesList {
	List<Hotel> properties = new ArrayList<>();
	
	public void addProperty(Hotel hotel) {
		this.properties.add(hotel);
	}
	
	public int getPropertyCount() {
		return this.properties.size();
	}
	
	public Hotel getProperty(int index) {
		return this.properties.get(index);
	}
}
