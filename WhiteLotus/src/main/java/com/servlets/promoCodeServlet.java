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
 * Servlet implementation class promoCodeServlet
 */
@WebServlet("/promoCodeServlet")
public class promoCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   String pack = request.getParameter("package");
	       String pprice = request.getParameter("pprice");
	       String stayNights = request.getParameter("stayNights");
	       float price = Float.parseFloat(request.getParameter("price"));
	       float total = Float.parseFloat(request.getParameter("total")); 
	       String promoCode = request.getParameter("promoCode"); 
	       
	        
	        
	        
	       boolean validPromo = paymentUtil.validatePromo(promoCode);
	       if(validPromo == true) {
	    	   System.out.println("promocode is valid "+validPromo);
	    	   
	           int discount = paymentUtil.getDiscount(promoCode);
	           System.out.println("promo discount " + discount);
	           
	    	   total = paymentUtil.getTotal(price, discount);
	    	   System.out.println("total " + total);
	    	   
	    	   float fTotal = price - total; 
	          
	    	   
	    	   request.setAttribute("pack2", pack);
	    	   request.setAttribute("pprice2", pprice);	    	   
	    	   request.setAttribute("stayNights2", stayNights);
	    	   request.setAttribute("price2", price);
	    	   request.setAttribute("discount2", discount);
	    	   request.setAttribute("total2", total);
	    	   request.setAttribute("fTotal2", fTotal);
	           
	           
	           
	    	   RequestDispatcher dis = request.getRequestDispatcher("paymentStep2.jsp");
			   dis.forward(request, response);    
	           
	    	   
	       }
	       else {
	    	   
	    	   request.setAttribute("pack2", pack);
	    	   request.setAttribute("pprice2", pprice);	    	   
	    	   request.setAttribute("stayNights2", stayNights);
	    	   request.setAttribute("price2", price);
	    	   request.setAttribute("total2", 0);
	    	   request.setAttribute("fTotal2", price);
	    	   request.setAttribute("noPromo", "invalid promo code, go back to apply again");
	    	   
	    	   RequestDispatcher dis = request.getRequestDispatcher("paymentStep2.jsp");
			   dis.forward(request, response);
	       }
	       
	       
	       
	       
	       
	       
		
	}

}
