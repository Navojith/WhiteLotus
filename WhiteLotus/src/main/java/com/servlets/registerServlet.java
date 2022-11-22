package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbConnect.AdminsUtil;
import com.dbConnect.UserUtil;
import com.javaClasses.User;
import com.javaClasses.pwdHash;


public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 2L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String username = req.getParameter("username");
		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		String pwdRepeat = req.getParameter("pwdRepeat");

		//Validate password
		if(pwd.equals(pwdRepeat)) { //if valid
			
			String hashedPwd = pwdHash.hashPassword(pwd);
			//check email and username 
			String errors = UserUtil.validateRequirements(email, username);
			if(errors.isEmpty() == false) {
				req.setAttribute("error", errors);
				RequestDispatcher dis = req.getRequestDispatcher("register.jsp");
				dis.include(req, res);
			}
			else {
				boolean isSuccess = UserUtil.regUser(fname, lname, username, email, hashedPwd);
			
				if(isSuccess ==true) {
					try {
						List<User> usrDetails = UserUtil.loginUser(email, hashedPwd);
						
						if (usrDetails.isEmpty() == false) {
							
							//setting session
							HttpSession session = req.getSession();
							session.setAttribute("usrDetails",usrDetails);
							
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
							req.setAttribute("error", "Unknown error occurred");
							RequestDispatcher dis = req.getRequestDispatcher("login.jsp");
							dis.forward(req, res);
						}
						
					} catch(Exception e) {
						res.getWriter().println(e);
					}
					
					
				
				
				}
			}
		} 
		else if(pwd.equals(pwdRepeat) == false) { //if invalid
			req.setAttribute("error", "Password Mismatch");
			RequestDispatcher dis = req.getRequestDispatcher("register.jsp");
			dis.include(req, res);
		}
		
	}

}
