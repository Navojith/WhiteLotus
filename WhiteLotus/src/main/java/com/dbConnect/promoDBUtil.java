//IT21237904
package com.dbConnect;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.javaClasses.promotion;

public class promoDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static List<promotion> getPromotion(){
		ArrayList<promotion> promo = new ArrayList<>();
		
		try {
			 con = dbConnect.getConnection();
			 stmt = con.createStatement();
			 String sql = "select * from promotion";
			 rs = stmt.executeQuery(sql);
			 
			 while(rs.next()) {
				 String pCode = rs.getString(1);
				 String name = rs.getString(2);
				 String description = rs.getString(3);
				 int amount = rs.getInt(4);
				 String imageFileName = rs.getString(5);
				 String path = rs.getString(6);
				 
				 promotion p = new promotion(pCode,name,description,amount,imageFileName);
				 promo.add(p);
				 
				 
			 }
			 
			 con.close();
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		
		return promo;
	}
	
	public static String validatePromo(String promoCode) {
		 
		 String alreadyExist =""; 
		 
		 try {
			 con = dbConnect.getConnection();
			 stmt = con.createStatement();
			 String sql = "select * from promotion where promoCode = '"+promoCode+"'";
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
	
	 public static boolean insertPromo(String promoCode, String name, String description, int amount, String dbFileName, String savePath) {
		 
		 boolean isSuccess = false;
		 
		 try {
			 con = dbConnect.getConnection();
			 stmt = con.createStatement();
			 String sql = "insert into promotion values('"+promoCode+"','"+name+"','"+description+"','"+amount+"','"+dbFileName+"','"+savePath+"')";
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
	 
	 public static boolean updatePromo(String promoCode, String name, String description, int amount, String imageFileName, String uploadPath) {
		 
		 try {
			 con = dbConnect.getConnection();
			 stmt = con.createStatement();
			 String sql = "update promotion set name='"+name+"',description='"+description+"',amount='"+amount+"',imageName='"+imageFileName+"',path='"+uploadPath+"'" 
					 + "where promoCode ='"+promoCode+"'";
			 
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
	 
	 public static boolean deletePromo(String promoCode) {
		 try {
			 con = dbConnect.getConnection();
			 stmt = con.createStatement();
			 String sql = "delete from promotion where promoCode = '"+promoCode+"'";
			 
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
