package com.servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbConnect.packageDBUtil;


@WebServlet("/deletePackageServlet")
public class deletePackageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get the package code and then pass it to the query
		String pId = request.getParameter("pId");
		System.out.println(pId);
		boolean isTrue;
		isTrue = packageDBUtil.deletePackage(pId); 
		
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
