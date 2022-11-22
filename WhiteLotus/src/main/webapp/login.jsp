<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	  <link rel="stylesheet" href="css/regFormStyles.css">

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
			            <li><a class="dropdown-item" href="login.jsp">Log in</a></li>
			          </ul>
			        </li>
			      </ul> 
    </div>
  </div>
 
</nav>
	
	<!-- login content-->
	<section>
	<div class="container col-lg-5">
	  <form action="log" method="post" class="px-4 py-3">
	  	
	  	<span style="color:red;">${error}</span>
	  
	    <div class="form-group py-3">
	     <p class="reg-title">Log In</P>
	      <label for="email">Email address</label>
	      <input type="email" id="email" class="form-control" name="email" placeholder="email@example.com" required>
	    </div>
	    <div class="form-group">
	      <label for="password">Password</label>
	      <input type="password" class="form-control" id="password" name="pwd" placeholder="Password" required>
	    </div><br>
	    <input id="submit-btn" class="submit-btn disabled" type="submit" name="submit" value="Log in">
	  </form>
  <div class="dropdown-divider"></div>
 <label> New around here? </label><a style="font-size:1rem;" href="register.jsp"> Sign Up</a>
</div>
</section>


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
  

    <script src="js/registerPasswordValidation.js"></script>
    
  </body>
</html>