package com.servlets;


import com.javaClasses.Admins;
import com.dbConnect.AdminsUtil;
import com.dbConnect.UserUtil;
import com.javaClasses.pwdHash;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class addAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		//retrieve data
		String id = req.getParameter("id");
		String email = req.getParameter("email");
		String username = req.getParameter("username");
		String pwd = req.getParameter("pwd");
		
		//pwd hashing
		String hashedPwd = pwdHash.hashPassword(pwd);
		boolean isSuccess = AdminsUtil.addAdmin(id,username, email, hashedPwd);
		
		
		
		if(isSuccess ==true) {
			req.setAttribute("error", "Admin privileges Given");
			RequestDispatcher dis = req.getRequestDispatcher("UserManagement");
			dis.forward(req, res);
		} else {
			req.setAttribute("error", "Already an Admin");
			RequestDispatcher dis = req.getRequestDispatcher("UserManagement");
			dis.forward(req, res);
		}
		
	}

}
