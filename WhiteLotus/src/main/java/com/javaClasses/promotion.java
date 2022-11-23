//IT21237904
package com.javaClasses;
public class promotion {
	private String pCode;
	private String name;
	private String description;
	private int amount;
	private String imageName;
	
	public promotion() {
		this.pCode = "";
		this.name = "";
		this.description = "";
		this.amount = 0;
		this.imageName = "";
	}
	
	public promotion(String pCode, String name, String description, int amount, String imageName) {
		this.pCode = pCode;
		this.name = name;
		this.description = description;
		this.amount = amount;
		this.imageName = imageName;
	}
	public String getpCode() {
		return pCode;
	}
	public String getName() {
		return name;
	}
	public String getDescription() {
		return description;
	}
	public int getAmount() {
		return amount;
	}
	public String getImageName() {
		return imageName;
	}
	
}
