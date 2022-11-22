<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
   
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/et-icons.css">
	
    <title>White Lotus</title>
  </head>
  <body>
  <%
		//allow access only if session exists
		if(session.getAttribute("usrDetails") == null){
			response.sendRedirect("login.jsp");
		}
   %>
  
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
  <div class="container">
    <a class="navbar-brand" href="adminView.jsp"><img src="img/logo.png" width=150px></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="package">Packages</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="table">Reservations</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="UserManagement">Users</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="displayPromo">Promotions</a>
        </li>
      </ul> 
      <ul class="navbar-nav">
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			           <img alt="" src="img/default.png" width=25px height=auto>
			          </a>
			          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
			            <li><a class="dropdown-item" href="out">Log out</a></li>
			            <li><a class="dropdown-item" href="userProfileEdit.jsp">Profile</a></li>
			          </ul>
			        </li>
			      </ul>
    </div>
  </div>
</nav>
	
	<%
		String pId = request.getParameter("pId");
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String description = request.getParameter("description");
		String guests = request.getParameter("guests");
		String price = request.getParameter("price");
		String pImage = request.getParameter("pImage");
	%>
    
    <section style="padding:70px 0px;">
		<div class="container col-lg-5">
		
		  <form action="deletePackage" method="post" class="px-4 py-3" >
		  
		  <fieldset>
		  
		    <div class="form-group py-4">
		    
		     <h3><b>Delete Package</b></h3>
		     
		    </div>
		    
		    <div class="form-group">
		      
		      <label for="pId">Package ID</label>
		      <input type="text" id="pId" class="form-control" name="pId" size="10" pattern="[a-zA-Z0-9-]+"  value="<%=pId%>" readonly><br>
		      
		      <label for="name">Name</label>
		      <input type="text" class="form-control" id="name" name="name" required value="<%=name%>"><br>
		      
		      <label for="name">Type</label>
		      <input type="text" class="form-control" id="type" name="type" required value="<%=type%>"><br>
		      
		      <label for="description">Description</label>
		      <textarea class="form-control" id="description" name="description" rows="4"required><%=description%></textarea><br>
		      
		      <label for="guests">No of guests</label> 
		      <input type="number" class="form-control" id="guests" name="guests" pattern="[0-9]{1,3}" required value="<%=guests%>" placeholder="xxx"><br>
		      
		      <label for="price">Price</label> 
		      <input type="number" class="form-control" id="price" name="price" required value="<%=price%>"><br>
		      
		      <label for="pImage">Image</label><br>
		      <input type="file" class="form-control" accept="image/*" id="pImage" name="pImage">
		      <img alt="" src="img/<%=pImage%>" width="600" height=auto> 
		      
		    </div>
		    <br>
		    <input class="btn btn-danger btn-lg" type="submit" name="delete" value="Delete">
		    </fieldset>
		  </form>
		  
		  </div>
		  
	</section>
   
  <!-- Footer -->
	<footer class="text-center py-5 bg-dark text-white">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<p class="mb-0 py-3">Copyright 2022 © Designed by SE/OOP_MLB_WD_2022_S2_199. All rights reserved</p>
				</div>
			</div>
		</div>
	</footer>

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- temporary <script src="js/index.js"></script> -->
  </body>
</html>