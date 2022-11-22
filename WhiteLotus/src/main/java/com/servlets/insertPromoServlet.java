package com.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.dbConnect.promoDBUtil;
import com.javaClasses.promotion;

@MultipartConfig
public class insertPromoServlet extends HttpServlet {
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        //file upload part
        System.out.println("add image do post");
    	Part file = request.getPart("file");
    	
    	String imageFileName = file.getSubmittedFileName();
    	System.out.println("image name =" + imageFileName);
    	
    	String uploadPath = "C:/Users/DELL/eclipse-workspace-enterprise/HotelReservationSystem.v2/src/main/webapp/img/" + imageFileName;
    	System.out.println("upload path =" + uploadPath);
    	
    	try
    	{
    	FileOutputStream fos = new FileOutputStream(uploadPath);
    	InputStream is = file.getInputStream();
    	
    	byte[] data = new byte[is.available()];
    	is.read(data);
    	fos.write(data);
    	fos.close();
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	//getting parameters from createPromoJSP
        String pCode = request.getParameter("pCode");
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		String amountS = request.getParameter("amount");
		
		String capture[] = {pCode,name,description,amountS};
		request.setAttribute("capture", capture);
		
		//validation if pCode alredy exist
		String alreadyExist = promoDBUtil.validatePromo(pCode);
		
		if(alreadyExist.isBlank() == false) {
			request.setAttribute("alreadyExist", alreadyExist);
			RequestDispatcher dis = request.getRequestDispatcher("createPromotion.jsp");
			dis.forward(request, response);
			
		}else {
			
			boolean isTrue = promoDBUtil.insertPromo(pCode, name, description, amount, imageFileName, uploadPath);
			
			if(isTrue == true) {
				System.out.println("promo inserted " + isTrue);
				RequestDispatcher dis = request.getRequestDispatcher("displayPromo");
				dis.forward(request, response);
				
			}else {
				System.out.println("promo insertion failed " + isTrue);
				RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
				dis.forward(request, response);
				
			}
			
		} 
    }	
}
