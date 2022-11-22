package com.dbConnect;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.javaClasses.Admins;



public class AdminsUtil {
	public static boolean addAdmin(String id,String username,String email,String pwd) {
		
		boolean isSuccess = false;
		
		//connect db
		Connection conn = dbConnect.getConnection();
		
		try {
			Statement stmt = conn.createStatement();
			
			String sql = "insert into admins(ID, username, email, password) values('"+id+"','"+username+"','"+email+"','"+pwd+"')";
		
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) 
				isSuccess = true;
				
		}catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static List<Admins> getAllAdmins() throws SQLException {
		
		Connection conn = dbConnect.getConnection();
		
		List<Admins> admins = new ArrayList<>();
		
		try {
			String sql = "Select * from admins";
			Statement stmt =  conn.createStatement();
			
			ResultSet rs = stmt.executeQuery(sql);
			
			
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String username = rs.getString(2);
				String Email = rs.getString(3);
				String password = rs.getString(4);
				String privilege = rs.getString(5);
				
				Admins u = new Admins(id, username, Email, password, privilege);
				admins.add(u);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return admins;
	}
	
	public static boolean deleteAdmin(int id, String email) {
		
		Connection conn = dbConnect.getConnection();
		
		boolean isSuccessful = false;
		
		try { 
			Statement stmt = conn.createStatement();
			String sql = "Delete from admins where email = '"+email+"' and ID = '"+id+"'";
			int result = stmt.executeUpdate(sql);
			
			if(result > 0) 
				isSuccessful = true;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccessful;
		
	}
	
	public static boolean validateAdmin(String email) {
		 
		boolean adminExist = false;
		Connection conn = dbConnect.getConnection();
	
		 try {
			 conn = dbConnect.getConnection();
			Statement stmt = conn.createStatement();
			 String sql = "select * from admins where email = '"+email+"'";
			 ResultSet rs = stmt.executeQuery(sql);
			 
			 if(rs.next()) {
				 adminExist = true;
			 }
			 conn.close();
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		 return adminExist;
	 }
}

