<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<   <!-- Required meta tags -->
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
   <%
		//allow access only if session exists
		if(session.getAttribute("usrDetails") == null){
			response.sendRedirect("login.jsp");
		}
   %>
  <%
   		String s = (String)session.getAttribute("type");
   		if(s.equals("user")){
   			%> 	<jsp:include page= "navUser.jsp" />
  <% 		}
   		else{
  %> 
			<jsp:include page= "navAdmin.jsp" />
  <%     } 
  %>
	
	<!-- reg content-->
<section>
	<div class="container col-lg-5">
	  	<div style="color:red;" class="text-center py-1">${error}</div>
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
  
</body>
</html>