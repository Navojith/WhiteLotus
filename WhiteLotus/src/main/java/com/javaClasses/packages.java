package com.javaClasses;

public class packages {
	private String pId;
	private String name;
	private String type;
	private String description;
	private int guests;
	private double price;
	private String pImage;
	private String path;
	
	public packages() {
		this.pId = "";
		this.name = "";
		this.type = "";
		this.description = "";
		this.guests = 0;
		this.price = 0;
		this.pImage = "";
		this.path = "";
	}
	
	public packages(String pId, String name,String type, String description, int guests,double price, String pImage,String path) {
		this.pId = pId;
		this.name = name;
		this.type = type;
		this.description = description;
		this.guests = guests;
		this.price = price;
		this.pImage = pImage;
		this.path = path;
	}
	public String getpId() {
		return pId;
	}
	public String getName() {
		return name;
	}
	public String getType() {
		return type;
	}
	public String getDescription() {
		return description;
	}
	public int getGuests() {
		return guests;
	}
	public double getPrice() {
		return price;
	}
	public String getpImage() {
		return pImage;
	}
	public String getPath() {
		return path;
	}
	
}
