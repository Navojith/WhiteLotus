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
<section>
	<div>
	<table class="table">
		<thead>
		    <tr class="table-dark">
		      <th scope="col">Promo code</th>
		      <th scope="col">Name</th>
		      <th scope="col">Description</th>
		      <th scope="col">Amount in %</th>
		      <th scope="col"><a href="createPromotion.jsp"><input type="button" class="btn btn-success" name="createPromo" value="Create Promo"></a></th>
		      <th scope="col"></th>
		      <th scope="col"></th>
		      <th scope="col"></th>
		    </tr>
	    </thead>
	    <tbody>
		<c:forEach var ="promo" items="${promoDetails}">
			<tr>
			<td>${promo.pCode}</td>
			<td>${promo.name}</td>
			<td>${promo.description}</td>
			<td>${promo.amount}</td>
			<td><img alt="" src="img/${promo.imageName}" width="200" height=auto></td>
			
			<c:url value="updatePromo.jsp" var="updatePromo">
			<c:param name="pCode" value="${promo.pCode}"/>
			<c:param name="name" value="${promo.name}"/>
			<c:param name="description" value="${promo.description}"/>
			<c:param name="amount" value="${promo.amount}"/>
			<c:param name="imageName" value="${promo.imageName}"/>
			</c:url>
			<td><a href="${updatePromo}"><input type="button"  class="btn btn-warning" name="update" value="update"></a></td>
			
			<c:url value="deletePromo.jsp" var="deletePromo">
			<c:param name="pCode" value="${promo.pCode}"/>
			<c:param name="name" value="${promo.name}"/>
			<c:param name="description" value="${promo.description}"/>
			<c:param name="amount" value="${promo.amount}"/>
			<c:param name="imageName" value="${promo.imageName}"/>
			</c:url>
			<td><a href="${deletePromo}"><input type="button" class="btn btn-danger" name="delete" value="delete"></a></td>
			
			</tr>
		
		</c:forEach>
		</tbody>
	</table>
   </div>
    </section>
 </div>

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