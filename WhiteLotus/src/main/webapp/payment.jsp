<!--IT21237904-->
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
               <a class="navbar-brand" href="index"><img src="img/logo.png" width=150px></a>
                <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarNav"
                    aria-controls="navbarNav"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                >
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Home</a>
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
			            <li><a class="dropdown-item" href="out">Log out</a></li>
			            <li><a class="dropdown-item" href="userProfileEdit.jsp">Profile</a></li>
			          </ul>
			        </li>
			      </ul>
                </div>
            </div>
        </nav>
	
	<section style="padding:80px 0px;">
	<h2>Summary</h2>
            <hr>
            <h5>Reservation is made!</h5>
            <h5>Pay Online</h5>
		<div class="container col-lg-5">
		<form action="promoCode" method="post" class="px-4 py-3" >
		
		    <div class="form-group">
		    <label for="amount">Package</label> 
		      <input type="text" class="form-control" id="package" name="package" value="${pkgID}" readonly>
		    <label for="amount">Package Price</label> 
		      <input type="text" class="form-control" id="pprice" name="pprice" value="${pprice}"readonly>
		    	<label for="amount">Stay Nights</label> 
		      <input type="text" class="form-control" id="stayNights" name="stayNights" value="${stayLength}" readonly>
		      <label for="amount">Price</label> 
		      <input type="text" class="form-control" id="price" name="price"  value="${price}"readonly>
		      <label for="amount">Discount</label> 
		      <input type="text" class="form-control" id="discount" name="discount" value="${discount}%"readonly>
		      <label for="amount">Total</label> 
		      <input type="text" class="form-control" id="total" name="total" value="${total}"readonly>
		      <label for="amount">Promo Code</label> 
		      <input type="text" class="form-control" id="promoCode" name="promoCode">
		      <p>${noPromo}</p>
		    </div><br>
		    <input id="submit-btn" class="btn btn-warning" type="submit" name="apply" value="apply">
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
</body>
</html>
