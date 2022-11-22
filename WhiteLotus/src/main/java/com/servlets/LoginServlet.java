package com.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.javaClasses.User;
import com.dbConnect.AdminsUtil;
import com.dbConnect.UserUtil;
import com.javaClasses.pwdHash;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		
		
		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		
		String hashedPwd = pwdHash.hashPassword(pwd);
		
		try {
			List<User> usrDetails = UserUtil.loginUser(email, hashedPwd);
			
			if (usrDetails.isEmpty() == false) {
				
				//setting session
				HttpSession session = req.getSession();
				session.setAttribute("usrDetails",usrDetails);
				session.setAttribute("email",email);
				
				if(AdminsUtil.validateAdmin(email) == true) {
					req.setAttribute("usrDetails", usrDetails);
					session.setAttribute("type", "admin");
					RequestDispatcher dis = req.getRequestDispatcher("adminView.jsp");
					dis.forward(req, res);
				}
				else {
					req.setAttribute("usrDetails", usrDetails);
					session.setAttribute("type", "user");
					RequestDispatcher dis = req.getRequestDispatcher("userProfileEdit.jsp");
					dis.forward(req, res);
				}
				
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

