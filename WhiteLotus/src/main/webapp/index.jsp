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
	

    
   	<!-- banner -->
	  <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
	  </div>
	  <div class="carousel-inner">
	    <div class="carousel-item drk active">
	      <img src="img/slide1.jpg" class="d-block w-100" alt="...">
	      <div class="carousel-caption d-none d-md-block">
	        <h1>Welcome to White Lotus</h1>
	        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts</p>
	      </div>
	    </div>
	    <div class="carousel-item drk">
	      <img src="img/slide2.jpg" class="d-block w-100" alt="...">
	      <div class="carousel-caption d-none d-md-block">
	        <h1>Enjoy Luxury Experience</h1>
	        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts</p>
	      </div>
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
   
   
    <!-- HomeBody -->
    <section id="homebody" class="text-center bg-light">
    	<div class="container">
    		<div class="row">
    			<div class="col-md-8 intro mx-auto">
    				<h1>Explore Our Services</h1>
    				<div class="divider">
    				</div>
    			</div>
    		</div> 
    		
    </section>
    <!-- cards -->
    <div class="card mb-3  bg-light bg-gradient" >
  		<div class="row g-0">
   			 <div class="col">
     		 <img src="img/card1.jpg" class="img-fluid rounded-start" alt="...">
   		 </div>
    	<div class="col">
	      <div class="card-body">
	        <h3 class="card-title">Choose The Perfect Accommodation</h3>
	        <p class="card-text"><small class="text-muted">Lavishly complementing the luxury accommodation at White Lotus, our 
	        hospitality hosts an array of modern facilities including two swimming pools, in-house 
	        boutiques, a spa, and a ballroom that holds up to 800 people</small></p>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- card2 -->
	 <div class="card mb-3  bg-light bg-gradient"" >
	  <div class="row g-0">
	    
	    <div class="col">
	      <div class="card-body">
	        <h3 class="card-title">Wine And Dine By The Northwestern Seas</h3>
	        <p class="card-text"><small class="text-muted"> Moving onto the sandy shores, the Centre Point Grill & Bar serves up a selection 
	        of light snacks and refreshing beverages amidst the 
	        welcoming sea breeze, in a casual dining space that puts you in the heart of our coastal landscapes. For a specialty 
	        dining experience however, White Lotus also features a Sushi Bar with a variety of Japanese culinary delights prepared 
	        with a combination of fresh island produce, along with some of the finest seafood caught from our neighbourhood seas</small></p>
	      </div>
	    </div>
	    <div class="col">
	      <img src="img/card2.jpg" class="img-fluid rounded-start" alt="...">
	    </div>
	  </div>
	</div>
	<!-- card3 -->
	<div class="card mb-3  bg-light bg-gradient"" >
	  <div class="row g-0">
	  <div class="col">
	      <div class="card-body">
	        <h3 class="card-title">Special Offers</h3>
	      </div>
	    <div class="col">
	      <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
	  </div>
	  <div class="carousel-inner">
			<div class="carousel-item active">
	      <img src="img/angle-banner-Hotel.jpg" class="d-block w-100" alt="...">
	    </div>
	    
	  <c:forEach var ="banner" items="${banner}">
	    <div class="carousel-item">
	      <img src="img/${banner.imageName}" class="d-block w-100" alt="...">
	    </div>
	   </c:forEach>
	   </div> 
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
	  
	    </div>
	  </div>
	</div>


    
  
  
 
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>
