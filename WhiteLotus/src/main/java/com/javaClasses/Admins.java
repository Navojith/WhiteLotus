package com.javaClasses;

public class Admins {
	private int ID;
	private String email;
	private String password;
	private String username;
	private String privilege;
	
	public Admins() {
		this.ID = 0;
		this.email = "";
		this.password = "";
		this.username = "";
		this.privilege = "";
	}
	
	public Admins(int iD, String username,  String email, String password, String privilege) {
		this.ID = iD;
		this.email = email;
		this.password = password;
		this.username = username;
		this.privilege = privilege;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPrivilege() {
		return privilege;
	}

	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}
	
	
}

