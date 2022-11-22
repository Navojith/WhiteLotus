package com.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbConnect.ReservationDBUtil;
import com.javaClasses.ReservationTable;


@WebServlet("/RemoveReservationServlet")
public class RemoveReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int resID = Integer.parseInt(request.getParameter("resID"));
		ReservationDBUtil removeRes = new ReservationDBUtil();
		
		// delete reservation
		boolean isSuccess = removeRes.deleteReservation(resID);
		
		if(isSuccess == true) {
			ReservationDBUtil resTable = new ReservationDBUtil();

			try {
				List<ReservationTable> resList = resTable.getResTable();
				System.out.println(resList.toString());
				request.setAttribute("resList", resList);

				RequestDispatcher dispatcher = request.getRequestDispatcher("removeReservation.jsp");
				dispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }else {
        	RequestDispatcher dispatcher = request.getRequestDispatcher("unsuccess.jsp");
			dispatcher.forward(request, response);
        }
		
		
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
    throws ServletException, IOException {
		ReservationDBUtil resTable = new ReservationDBUtil();

		try {
			List<ReservationTable> resList = resTable.getResTable();
			System.out.println(resList.toString());
			request.setAttribute("resList", resList);

			RequestDispatcher dispatcher = request.getRequestDispatcher("removeReservation.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
