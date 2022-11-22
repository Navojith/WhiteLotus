package com.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javaClasses.Admins;
import com.dbConnect.AdminsUtil;
import com.javaClasses.User;
import com.dbConnect.UserUtil;

import java.io.IOException;
import java.util.List;


public class viewAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//get admin list
			List<Admins> list = AdminsUtil.getAllAdmins();
			String msg = "No data";
			
			if(list.size() > 0 ) {
				//print record count
				msg = list.size() + (list.size() > 1 ? " records available" : " record available");
			}
			
			request.setAttribute("MSG", msg);
			request.setAttribute("list", list);
			request.getRequestDispatcher("viewAdminList.jsp").forward(request, response);
		
	}catch(Exception e) {
		request.setAttribute("error", "System error:" + e.getMessage());
		request.getRequestDispatcher("error.jsp").forward(request, response);
	}
	}


}
