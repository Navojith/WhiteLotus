package com.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dbConnect.AdminsUtil;
import com.dbConnect.UserUtil;

import java.io.IOException;

public class deleteAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String email = req.getParameter("email");
		
		boolean result = AdminsUtil.deleteAdmin(id, email);
		
		if(result == true) {
			req.setAttribute("error", "Successfully revoked Privileges");
			RequestDispatcher dis = req.getRequestDispatcher("UserManagement");
			dis.include(req, res);
		} else {
			req.setAttribute("error", "Not an Admin");
			RequestDispatcher dis = req.getRequestDispatcher("UserManagement");
			dis.include(req, res);
		}
		
	}

}
