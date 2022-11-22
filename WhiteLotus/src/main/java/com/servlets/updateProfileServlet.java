package com.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbConnect.UserUtil;
import com.javaClasses.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;



public class updateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		//retrieve data 
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String contactNo = req.getParameter("tpNo");
		String email = req.getParameter("email");
		String street = req.getParameter("street");
		String city = req.getParameter("city");
		String country = req.getParameter("country");
		
		//update Account
		boolean isSuccess = UserUtil.updateAccount(email, fname, lname, contactNo, city, street, country);
		
		//redirect
		if(isSuccess ==true) {
			List<User> usrDetails = UserUtil.uProfile(email);
			HttpSession session = req.getSession();
			session.setAttribute("usrDetails", usrDetails);
			
			req.setAttribute("error", "Profile Updated Successfully");
			RequestDispatcher dis = req.getRequestDispatcher("Msg.jsp");
			dis.forward(req, res);
		}else {
			PrintWriter out = res.getWriter();
			out.println(isSuccess);
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	

}
