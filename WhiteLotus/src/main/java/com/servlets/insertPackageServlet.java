package com.servlets;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.dbConnect.packageDBUtil;

@MultipartConfig
public class insertPackageServlet extends HttpServlet {
 
    
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        
        //upload the file
    	Part file = request.getPart("pImage");
    	
    	String FName = file.getSubmittedFileName();
    	String Path = "C:/Users/DELL/eclipse-workspace-enterprise/WhiteLotus/src/main/webapp/img/" + FName;
    	
    	
    	try
    	{
    	  FileOutputStream fos = new FileOutputStream(Path);
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
    	
        String pId = request.getParameter("pId");
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String description = request.getParameter("description");
		int guests = Integer.parseInt(request.getParameter("guests"));
		double price = Double.parseDouble(request.getParameter("price"));
		
	    //package code validation
		String validation = packageDBUtil.validatePackage(pId);
		
		if(validation.isBlank() == false) {
			request.setAttribute("validation", validation);
			RequestDispatcher dis = request.getRequestDispatcher("insertPackage.jsp");
			dis.forward(request, response);
			
		}else {
		    boolean isTrue = packageDBUtil.insertPackage(pId, name,type, description, price,guests, FName, Path);
			
			if(isTrue == true) {
				response.sendRedirect(request.getContextPath() +"/package");
				
			}
			else
			{
				RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
				dis.forward(request, response);
			}
			
		} 
	}
}
