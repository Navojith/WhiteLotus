<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.List" %>
<%@ page import="com.javaClasses.User" %>
<%@ page import="com.javaClasses.Admins" %>

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
	<link rel="stylesheet" href="css/UserManager.css">
	
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

<section>
<div class="container">
<div style="color:red;" class="text-center py-1">${error}</div>
<table>
	<thead>
	<tr>
		<th>ID</th>
		<th>UserName</th>
		<th>Email</th>
		<th>FirstName</th>
		<th>LastName</th>
		<th colspan="2">Privilege</th>
		
	</tr>
	</thead>
		<% 
			List<User> list = (List<User>)request.getAttribute("list");
		%>
		
		<%
		String uEmail = (String)session.getAttribute("email");
		try {
			for (User u : list) {
				int id = u.getId();
				String username =u.getUsername();
				String email= u.getEmail();
				String pwd = u.getPassword();
				
				if(email.equals(uEmail)){
					continue;
				}
				else{
					request.setAttribute("id",id);
					request.setAttribute("username",username);
					request.setAttribute("email",email);
					request.setAttribute("pwd",pwd);
				}		 
		%>
		<tbody>
		
	<tr>
		<td><%=u.getId()%></td>
		<td><%=u.getUsername()%></td>
		<td><%=u.getEmail()%></td>
		<td><%=u.getFirstName()%></td>
		<td><%=u.getLastName()%></td>
		<td><form method="get" action="addAdmin">
			<input name="id" value="${id}" type="hidden">
			<input name="username" value="${username}" type="hidden">
			<input name="email" value="${email}" type="hidden">
			<input name="pwd" value="${pwd}" type="hidden">
			<button class="btn btn-success" id="mkAdminBtn"type="submit">Give Admin Privileges </button></form>
		</td>
		<td><form method="get" action="deleteAdmin">
			<input name="id" value="${id}" type="hidden">
			<input name="username" value="${username}" type="hidden">
			<input name="email" value="${email}" type="hidden">
			<input name="pwd" value="${pwd}" type="hidden">
			<button class="btn btn-danger" id="mkAdminBtn"type="submit">revoke Admin Privileges </button></form>
		</td>
		
	</tr>
	</tbody>
	
	
	<%	
		}
	} catch(Exception e) {
		e.printStackTrace();
	} %>
	<caption><span style="color:red;" class="align-right">${MSG}</span></caption>
</table>
<form method="get" action="viewAdmin">	
<div class="container col-md-3">
		<button class="btn btn-info text-right" id="shAdminBtn"type="submit">Show the List of Admin</button>
</div> 
</form>
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