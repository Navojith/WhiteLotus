package com.servlets;

import com.javaClasses.User;
import com.dbConnect.UserUtil;
import com.javaClasses.pwdHash;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class uProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String email = req.getParameter("email");
		
		
		try {
			List<User> usrDetails = UserUtil.uProfile(email);
			
			if (usrDetails.isEmpty() == false) {
				HttpSession session = req.getSession();
				session.setAttribute("usrDetails", usrDetails);
				RequestDispatcher dis = req.getRequestDispatcher("userProfileEdit.jsp");
				dis.forward(req, res);
			}
			else
			{
				req.setAttribute("error", "Invalid Email or Password");
				RequestDispatcher dis = req.getRequestDispatcher("login.jsp");
				dis.forward(req, res);
			}
			
		} catch(Exception e) {
			res.getWriter().println(e);
		}
	}

}
