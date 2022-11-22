package com.dbConnect;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.javaClasses.packages;

public class packageDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//empty array of list packages
	public static List<packages> getPackages(){
		ArrayList<packages> pkg = new ArrayList<>();
		
		try {
			 con = dbConnect.getConnection();
			 stmt = con.createStatement();
			 String sql = "select * from packages";
			 rs = stmt.executeQuery(sql);
			 
			 while(rs.next()) {
				 String pId = rs.getString("id");
				 String name = rs.getString("name");
				 String type = rs.getString("accomadation_type");
				 String description = rs.getString("description");
				 int guests = rs.getInt("no_of_guests");
				 int price = rs.getInt("price");
				 String FName = rs.getString("imageName");
				 String path = rs.getString("path");
				 packages p = new packages(pId,name,type,description,guests,price,FName,path);
				 pkg.add(p);
				 
				}
			 
			 con.close();
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		
		return pkg;
	}
	
	//validate package
	public static String validatePackage(String packageId) {
		 
		 String alreadyExist =""; 
		 
		 try {
			 con = dbConnect.getConnection();
			 stmt = con.createStatement();
			 String sql = "select * from packages where id = '"+packageId+"'";
			  rs = stmt.executeQuery(sql);
			 
			 if(rs.next()) {
				 alreadyExist = "already exist";
			 }
			 con.close();
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		 return alreadyExist;
	 }
	
	//check the insert query
	 public static boolean insertPackage(String packageId, String name,String type, String description, double price,int guests, String FileName, String IPath) {
		 boolean isSuccess = false;
		 
		 try {
			 con = dbConnect.getConnection();
			 stmt = con.createStatement();
			 String sql = "insert into packages(id,name,accomadation_type,description,no_of_guests,price,imageName,path) values('"+packageId+"','"+name+"','"+type+"','"+description+"',"+guests+","+price+",'"+FileName+"','"+IPath+"')";
			 int rs = stmt.executeUpdate(sql);
			 
			 if(rs > 0) {
				 isSuccess = true;
			 }else {
				 isSuccess = false;
			 }
			 con.close();
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		 return isSuccess;
	 }
	 
	
	 //check the update query
	 public static boolean updatePackage(String packageId, String name,String type, String description,double price,int guests, String FName, String Path) {
		 
		 try {
			 con = dbConnect.getConnection();
			 stmt = con.createStatement();
			 String sql = "update packages set name='"+name+"',accomadation_type='"+type+"',description='"+description+"',no_of_guests="+guests+",price="+price+",imageName='"+FName+"',path='"+Path+"'" 
					 + "where id ='"+packageId+"'";
			 
			 int rs = stmt.executeUpdate(sql);
			 
			 if(rs > 0) {
				 isSuccess = true;
			 }else {
				 isSuccess = false;
			 }
			 con.close();
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		 return isSuccess;
		 
	 }
	 
	//check the delete query
	 public static boolean deletePackage(String packageId) {
		 try {
			 con = dbConnect.getConnection();
			 stmt = con.createStatement();
			 String sql = "delete from packages where id = '"+packageId+"'";
			 
			 int rs = stmt.executeUpdate(sql);
			 
			 if(rs > 0) {
				 isSuccess = true;
			 }else {
				 isSuccess = false;
			 }
			 con.close();
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		 return isSuccess;
		 
	 }
}
