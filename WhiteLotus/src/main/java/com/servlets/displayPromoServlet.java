package com.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbConnect.promoDBUtil;
import com.javaClasses.promotion;


@WebServlet("/displayPromoServlet")
public class displayPromoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//get method is same as hypertextlinks work in get
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<promotion> promoDetails = promoDBUtil.getPromotion();
			request.setAttribute("promoDetails", promoDetails);
			
			
			RequestDispatcher dis = request.getRequestDispatcher("displayPromo.jsp");
	    	dis.forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<promotion> promoDetails = promoDBUtil.getPromotion();
			request.setAttribute("promoDetails", promoDetails);
			
			
			RequestDispatcher dis = request.getRequestDispatcher("displayPromo.jsp");
	    	dis.forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		
	}
}
