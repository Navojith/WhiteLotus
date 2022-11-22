package com.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dbConnect.UserUtil;
import com.javaClasses.pwdHash;

import java.io.IOException;


public class changePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//retrieve data
		String currentPwd = req.getParameter("currentPwd");
		String email = req.getParameter("email");
		String newPwd = req.getParameter("newPwd");
		String confirmPwd = req.getParameter("confirmPwd");
		
		if(newPwd.equals(confirmPwd)) {
			
			//pwd hashing
			String currentHashedPwd = pwdHash.hashPassword(currentPwd);
			String newHashedPwd = pwdHash.hashPassword(newPwd);
			
			boolean result = UserUtil.changePwd(email, currentHashedPwd, newHashedPwd);
			
			if(result == true) {
				req.setAttribute("error", "Your Password has been changed");
				RequestDispatcher dis = req.getRequestDispatcher("login.jsp");
				dis.include(req, res);
			} else {
				req.setAttribute("error", "Current password is wrong");
				RequestDispatcher dis = req.getRequestDispatcher("Msg.jsp");
				dis.include(req, res);
			}
			
		} else {
			req.setAttribute("error", "Password Mismatch");
			RequestDispatcher dis = req.getRequestDispatcher("Msg.jsp");
			dis.include(req, res);
		}
	}

}
