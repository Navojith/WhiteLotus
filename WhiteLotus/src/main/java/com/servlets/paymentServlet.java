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

/**
 * Servlet implementation class paymentServlet
 */
@WebServlet("/paymentServlet")
public class paymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
		String userName = request.getParameter("userName");
        String pkgID =request.getParameter("pkg");
        int stayLength = Integer.parseInt(request.getParameter("stayLenght"));
        String promoCode = request.getParameter("promoCode");
        
        int discount = 0;
        float pprice = paymentUtil.getPPrice(pkgID);
        System.out.println("package price" + pprice);
        
        float price = paymentUtil.getPrice(pprice,stayLength);
        System.out.println("price" + price);
        
        float total = paymentUtil.getTotal(price, discount);
        System.out.println("total price with no discount" + total);
        
        request.setAttribute("pprice", pprice);
        request.setAttribute("price", price);
        request.setAttribute("total", total);
    	
        RequestDispatcher dis = request.getRequestDispatcher("payment.jsp");
		dis.forward(request, response);

	}
}
