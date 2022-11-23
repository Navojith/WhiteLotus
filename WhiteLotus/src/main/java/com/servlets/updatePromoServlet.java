//IT21237904
package com.servlets;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.dbConnect.promoDBUtil;

@WebServlet("/updatePromoServlet")
@MultipartConfig

public class updatePromoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//file upload part
		System.out.println("add image do post");
    	Part file = request.getPart("file");
    	
    	String imageFileName = file.getSubmittedFileName();
    	System.out.println("image name =" + imageFileName);
    	
    	String uploadPath = "C:/Users/DELL/eclipse-workspace-enterprise/HotelReservationSystem.v2/src/main/webapp/img/" + imageFileName;
    	System.out.println("upload path =" + uploadPath);
    	
    	try
    	{
    	FileOutputStream fos = new FileOutputStream(uploadPath);
    	InputStream is = file.getInputStream();
    	
    	byte[] data = new byte[is.available()];
    	is.read(data);
    	fos.write(data);
    	fos.close();
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}

        

        
        //getting values from displayPromoJSP via c:param
        String pCode = request.getParameter("promoCode");
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		boolean isTrue;
		isTrue = promoDBUtil.updatePromo(pCode, name, description, amount, imageFileName, uploadPath);
		
		
		if(isTrue == true) {
			System.out.println("promo updated"+isTrue);
			RequestDispatcher dis = request.getRequestDispatcher("displayPromo");
			dis.forward(request, response);
			
		}else {
			System.out.println("promo update failed"+isTrue);
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
			
		}
	}
}
