package com.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javaClasses.User;
import com.dbConnect.UserUtil;
import com.javaClasses.pwdHash;

import java.io.IOException;


public class deleteAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//retrieve data
		String currentPwd = req.getParameter("currentPwd");
		String email = req.getParameter("email");
		
		String hashedPwd = pwdHash.hashPassword(currentPwd);
		
		boolean result = UserUtil.deleteAccount(email, hashedPwd);
		
		if(result == true) {
			req.setAttribute("error", "Your account has been permanently deleted");
			RequestDispatcher dis = req.getRequestDispatcher("register.jsp");
			dis.include(req, res);
		} else {
			req.setAttribute("error", "Password Mismatch. Account couldn't be deleted");
			RequestDispatcher dis = req.getRequestDispatcher("Msg.jsp");
			dis.include(req, res);
		}
		
		
			
	}

}
