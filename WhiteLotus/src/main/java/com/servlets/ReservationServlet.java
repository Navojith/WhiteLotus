package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaClasses.Reservation;
import com.dbConnect.ReservationDBUtil;



@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
        String phNumber = request.getParameter("contactNumber");
        String pkgID =request.getParameter("pkg");
        //String promocode = request.getParameter("promocode");
        int stayLenght = Integer.parseInt(request.getParameter("stayLenght"));
        String stayLength = request.getParameter("stayLenght");

        ReservationDBUtil resDBUtil = new ReservationDBUtil();

       
        
        if (resDBUtil.checkAvailablity() == true){
        	
        	// reserve
            boolean issuccess = resDBUtil.reserve(userName, pkgID, stayLenght);
            // update phone number
            resDBUtil.updatePhNumber(userName, phNumber);
			
            if(issuccess == true) {
            	
            	request.setAttribute("userName", userName);
            	request.setAttribute("pkgID", pkgID);
            	request.setAttribute("stayLength", stayLength);
            	
            	RequestDispatcher dis = request.getRequestDispatcher("payment");
    			dis.forward(request, response);
            }
			
			
		}else {
				
				RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
				dis.forward(request, response);
				
			}
        

    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
    throws ServletException, IOException {
        ReservationDBUtil resUtil = new ReservationDBUtil();

        try {
            List<Reservation> pkgList = resUtil.getPkgs();
            request.setAttribute("pkgList", pkgList);

            RequestDispatcher dispatcher = request.getRequestDispatcher("reservation.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }
}
