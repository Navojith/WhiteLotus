//IT21237904
package com.servlets;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbConnect.paymentUtil;
import com.dbConnect.promoDBUtil;

/**
 * Servlet implementation class paymentStratServlet
 */
@WebServlet("/paymentStratServlet")
public class paymentStratServlet extends HttpServlet  {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cardName = request.getParameter("cardName");
		int cardNumber = Integer.parseInt(request.getParameter("cardNumber"));
		int cvv = Integer.parseInt(request.getParameter("cvv"));
		float amount = Float.parseFloat(request.getParameter("total"));
		
		boolean isTrue = paymentUtil.insertPayment(cardNumber, cardName, cvv, amount);
		
		if(isTrue == true) {
			System.out.println("payment inserted" + isTrue);
			RequestDispatcher dis = request.getRequestDispatcher("success.jsp");
			dis.forward(request, response);
		}
		else {
			System.out.println("payment insertion failed" + isTrue);
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}
	}

}
	
