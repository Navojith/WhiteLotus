package com.dbConnect;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import com.javaClasses.User;

public class UserUtil {

	public static boolean regUser(String fname,String lname,String username,String email,String pwd) {
		
		boolean isSuccess = false;
		
		//connect db
		Connection conn = dbConnect.getConnection();
		
		try {
			Statement stmt = conn.createStatement();
			
			String sql = "insert into users(username, email, password, firstName, lastName) values('"+username+"','"+email+"','"+pwd+"','"+fname+"','"+lname+"')";
		
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) 
				isSuccess = true;
				
		}catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static boolean updateAccount(String email,String fname,String lname,String tpNo,String city,String street, String country) {
		
		boolean isSuccess = false;
		
		//connect db
		Connection conn = dbConnect.getConnection();
		
		try {
			Statement stmt = conn.createStatement();
			
			String sql = "Update users set firstName = '"+fname+"', lastName = '"+lname+"', contactNumber = '"+tpNo+"', street = '"+street+"', city = '"+city+"', country = '"+country+"' where email = '"+email+"'";
		
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) 
				isSuccess = true;
				
		}catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static String validateRequirements(String email, String username) {
		String status = "";
		
		Connection conn = dbConnect.getConnection();
		
		try {
			Statement stmt = conn.createStatement();
			
			//check email
			String sqlCheckEmail = "select * from users where email = '"+email+"'";
			ResultSet rs1 = stmt.executeQuery(sqlCheckEmail);
			
			if(rs1.next()) { 
				status += " Email is Already Registered "; 
			}
			
			//check username
			String sqlCheckUsername = "select * from users where username = '"+username+"'";
			ResultSet rs2 = stmt.executeQuery(sqlCheckUsername);
			
			if(rs2.next()) { 
				status += " Username is Already taken "; 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return status;
		
	}
	
	public static List<User> loginUser(String email, String pwd) {
		
		Connection conn = dbConnect.getConnection();
		
		ArrayList<User> usr = new ArrayList<>();
		
		try {
			Statement stmt = conn.createStatement();
			String sql = "select * from users where email = '"+email+"' and password = '"+pwd+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				int id = rs.getInt(1);
				String username = rs.getString(2);
				String Email = rs.getString(3);
				String password = rs.getString(4);
				String fname = rs.getString(5);
				String lname = rs.getString(6);
				String contactNumber = rs.getString(7);
				String street = rs.getString(8);
				String city = rs.getString(9);
				String country = rs.getString(10);
				
				User u = new User(id, username, Email, password, fname, lname, contactNumber, street, city, country);
				usr.add(u);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return usr;
	}
	
	public static boolean deleteAccount(String email, String password) {
		
		Connection conn = dbConnect.getConnection();
		
		boolean isSuccessful = false;
		
		try { 
			Statement stmt = conn.createStatement();
			String sql = "Delete from users where email = '"+email+"' and password = '"+password+"'";
			int result = stmt.executeUpdate(sql);
			
			if(result > 0) 
				isSuccessful = true;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccessful;
		
	}
	
	public static boolean changePwd(String email, String currentPwd, String newPwd) {
		
		Connection conn = dbConnect.getConnection();
		
		boolean isSuccessful = false;
		
		try { 
			Statement stmt = conn.createStatement();
			String sql = "Update users set password = '"+newPwd+"' where email = '"+email+"' and password = '"+currentPwd+"'";
			int result = stmt.executeUpdate(sql);
			
			if(result > 0) 
				isSuccessful = true;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccessful;
		
	}
	
	public static List<User> getAllUsers() throws SQLException {
		
		Connection conn = dbConnect.getConnection();
		
		List<User> list = new ArrayList<User>();
		
		try {
			String sql = "Select * from users";
			Statement stmt =  conn.createStatement();
			
			ResultSet rs = stmt.executeQuery(sql);
			
			
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String username = rs.getString(2);
				String Email = rs.getString(3);
				String password = rs.getString(4);
				String fname = rs.getString(5);
				String lname = rs.getString(6);
				String contactNumber = rs.getString(7);
				String street = rs.getString(8);
				String city = rs.getString(9);
				String country = rs.getString(10);
				
				User u = new User(id, username, Email, password, fname, lname, contactNumber, street, city, country);
				list.add(u);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	public static List<User> uProfile(String email) {
		
		Connection conn = dbConnect.getConnection();
		
		ArrayList<User> usr = new ArrayList<>();
		
		try {
			Statement stmt = conn.createStatement();
			String sql = "select * from users where email = '"+email+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				int id = rs.getInt(1);
				String username = rs.getString(2);
				String Email = rs.getString(3);
				String password = rs.getString(4);
				String fname = rs.getString(5);
				String lname = rs.getString(6);
				String contactNumber = rs.getString(7);
				String street = rs.getString(8);
				String city = rs.getString(9);
				String country = rs.getString(10);
				
				User u = new User(id, username, Email, password, fname, lname, contactNumber, street, city, country);
				usr.add(u);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return usr;
	}
}
