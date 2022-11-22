package com.servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbConnect.promoDBUtil;


@WebServlet("/deletePromoServlet")
public class deletePromoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pCode = request.getParameter("promoCode");
		System.out.println(pCode);
		boolean isTrue;
		isTrue = promoDBUtil.deletePromo(pCode); 
		
		if(isTrue == true) {
			System.out.println("promo deleted"+isTrue);
			RequestDispatcher dis = request.getRequestDispatcher("displayPromo");
			dis.forward(request, response);
			
		}else {
			System.out.println("promo deletion failed"+isTrue);
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
			
		}
	}

}
