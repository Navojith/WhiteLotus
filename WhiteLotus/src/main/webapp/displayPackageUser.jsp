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
	<link rel="stylesheet" href="css/packages.css">

    <title>White Lotus</title>
  </head>
  	<body>
    
    <!-- Navigation -->
    	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
  			<div class="container">
    			<a class="navbar-brand" href="index"><img src="img/logo.png" width=150px></a>
    			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      				<span class="navbar-toggler-icon"></span>
    			</button>
   			 <div class="collapse navbar-collapse" id="navbarNav">
     			 <ul class="navbar-nav ms-auto">
        			<li class="nav-item">
          				<a class="nav-link" href="index">Home</a>
        			</li>
        			<li class="nav-item">
         				 <a class="nav-link" href="#">About</a>
        			</li>
       				 <li class="nav-item">
         				 <a class="nav-link" href="displayPackageUser">Our Packages</a>
        			</li>
        			<li class="nav-item">
         				 <a class="nav-link" href="reservation">Make Reservation</a>
        			</li>
       				 <li class="nav-item">
         				 <a class="nav-link" href="#">Contact</a>
       				 </li>
      			 </ul>
      			 <ul class="navbar-nav">
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			           <img alt="" src="img/default.png" width=25px height=auto>
			          </a>
			          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
			          
			  			<c:set var = "ses"  value = '${sessionScope["usrDetails"]}'/>
			  			<c:choose>
			  				<c:when test = "${ses == null}">
			  				 <li><a class="dropdown-item" href="login.jsp" >Log in</a></li>
			  				</c:when>
			  				<c:otherwise>
			  				<li><a class="dropdown-item" href="out">Log out</a></li>
			  				<li><a class="dropdown-item" href="userProfileEdit.jsp">Profile</a></li>
			  				</c:otherwise>
			  			</c:choose>
			          </ul>
			        </li>
			      </ul>
			    </div>
			  </div>
			</nav>
			
			<section id="homebody" class="text-center bg-light">
    	<div class="container">
    		<div class="row">
    			<div class="col-md-8 intro mx-auto">
    				<h1>Our Packages</h1>
    				<div class="divider">
    				</div>
    			</div>
    		</div> 
    	</div>
    	 <div class="input-group mb-3">
  		<input id="searchbar" onkeyup="search_package()" type="text" class="form-control" placeholder="Search package" aria-label="Recipient's username" aria-describedby="basic-addon2">
	</div>
    		
    </section>

 

	<!-- display packages to user -->

	<section>
	
	<ul id='list' style="list-style-type:none;">
	<div class="row row-cols-1 row-cols-md-3 g-4">
		<c:forEach var ="pkg" items="${packageDetails}">
			<li class="package">
			  	<div class="col">
					<div class="card h-100" >
			  			<img src="img/${pkg.pImage}" alt="Card image cap" class="card-img-top" >
			  			<div class="card-body">
			   				 <h5 class="card-title">${pkg.name}</h5>
			   		 		<p class="card-text">${pkg.description}</p>
			 	 		</div>
			  			<ul class="list-group list-group-flush">
			    			<li class="list-group-item">${pkg.type}</li>
			    			<li class="list-group-item">Can accommodate for ${pkg.guests} guests</li>
			   				<li class="list-group-item">${pkg.price}</li>
			 	 		</ul>
			  			<div class="card-body">
			    			<a href ="reservation" class = "btn btn-primary stretched-link"> Reserve </a>
			 	 		</div>
					</div>
			 	</div>
    		</li>
		</c:forEach>
		</div>
		</ul>
		
		</section>
 


  </body>
<!-- Footer -->
	<footer class="text-center py-5 bg-dark text-white">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div>
						<a href="#">Home</a>
						<a href="#">About</a>
						<a href="#">Our Rooms</a>
						<a href="#">Contact</a>
					</div>
					<p class="mb-0 py-3">Copyright 2022 © Designed by SE/OOP_MLB_WD_2022_S2_199. All rights reserved</p>
					<div>
						<a href="#">Facebook</a>
						<a href="#">Instagram</a>
						<a href="#">Twitter</a>
					</div>
				</div>
			</div>
		</div>
	</footer>

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="js/search.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>