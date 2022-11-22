package com.servlets;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbConnect.packageDBUtil;
import com.javaClasses.packages;


@WebServlet("/displayPackageServlet")
public class displayPackageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<packages> packageDetails = packageDBUtil.getPackages();
			System.out.println(Arrays.toString(packageDetails.toArray()));
			
			request.setAttribute("packageDetails", packageDetails);
			
			
			RequestDispatcher dis = request.getRequestDispatcher("displayPackage.jsp");
	    	dis.forward(request, response);
	    	
			}catch(Exception e) {
				e.printStackTrace();
			}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<packages> packageDetails = packageDBUtil.getPackages();
			request.setAttribute("packageDetails", packageDetails);
			
			
			RequestDispatcher dis = request.getRequestDispatcher("displayPackage.jsp");
	    	dis.forward(request, response);
	    	
			}catch(Exception e) {
				e.printStackTrace();
			}
		
	}
}
