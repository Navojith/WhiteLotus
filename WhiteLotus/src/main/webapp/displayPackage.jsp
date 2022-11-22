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
  
<div class="content">

<section class="row">
<h1 class ="d-flex justify-content-center text-uppercase"> List of Packages</h1>
	<div class="col" style="margin-left:20px">
	
	<a href="insertPackage.jsp"><input type="button" class="btn btn-primary" name="insertPackage" value="Add Package"></a>
	
	</div>




	<div>
	<table class="table m-4">
	
		<thead>
		    <tr class="table-dark">
		      <th>Package ID</th>
		      <th>image</th>
		      <th>Name</th>
		      <th>Type</th>
		      <th>Description</th>
		      <th>No of guests</th>
		      <th>Price</th>
		      <th>Action</th>
		      <th></th>
		      <th></th>
		    </tr>
	    </thead>
	    
	    <tbody>
	    
		<c:forEach var ="pkg" items="${packageDetails}">
			<tr>
			<td>${pkg.pId}</td>
			<td><img alt="" src="img/${pkg.pImage}" width="50" height=50></td>
			<td>${pkg.name}</td>
			<td>${pkg.type}</td>
			<td>${pkg.description}</td>
			<td>${pkg.guests}</td>
			<td>${pkg.price}</td>
			
			<c:url value="updatePackage.jsp" var="updatePackage">
			<c:param name="pId" value="${pkg.pId}"/>
			<c:param name="name" value="${pkg.name}"/>
			<c:param name="type" value="${pkg.type}"/>
			<c:param name="description" value="${pkg.description}"/>
			<c:param name="guests" value="${pkg.guests}"/>
			<c:param name="price" value="${pkg.price}"/>
			<c:param name="pImage" value="${pkg.pImage}"/>
			</c:url>
			<td>
			<a href="${updatePackage}"><input type="button"  class="btn btn-success" name="update" value="update"></a>
			</td>
			
			<c:url value="deletePackage.jsp" var="deletePackage">
			<c:param name="pId" value="${pkg.pId}"/>
			<c:param name="name" value="${pkg.name}"/>
			<c:param name="type" value="${pkg.type}"/>
			<c:param name="description" value="${pkg.description}"/>
			<c:param name="guests" value="${pkg.guests}"/>
			<c:param name="price" value="${pkg.price}"/>
			<c:param name="pImage" value="${pkg.pImage}"/>
			</c:url>
			<td>
			<a href="${deletePackage}"><input type="button" class="btn btn-danger" name="delete" value="delete"></a>
			</td>
			
			</tr>
			
	        </c:forEach>
	        
		</tbody>
		
	</table>
	
   </div>
   
 </section>
 
 </div>

  </body>
  
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