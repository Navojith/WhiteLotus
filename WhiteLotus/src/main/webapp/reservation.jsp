<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <!-- Bootstrap CSS -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
            crossorigin="anonymous"
        />
        <link rel="stylesheet" href="css/reservationStyle.css" />
        <link rel="stylesheet" href="css/et-icons.css" />

        <title>Reservation</title>
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


        <!-- main body -->
        <section>

            <h1>Reservation</h1>
            <hr>
            
            <br><br>

            <!-- make reservation form -->
            <div style="padding-left: 100px; max-width: 600px;">
                <form action="reservation" method="post">
                    <div class="mb-3">
                        <label class="form-label">User Name</label>
                        <input type="text" class="form-control" name="userName" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Contact Number</label>
                        <input type="text" pattern="[0-9]*" class="form-control" name="contactNumber" maxlength="10" minlength="10" placeholder="numbers only" required> <!-- updated -->
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Select Package</label>
                        <select class="form-select" name="pkg">
                            <c:forEach items="${pkgList}" var="pkg">
                                <option value="${pkg.pkgID}">${pkg.pkgType}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Period Of Stay (days)</label>
                        <input type="number" min=1 class="form-control" name="stayLenght" placeholder="0" required>
                    </div>
                    <br>
                    <button type="submit" class="btn btn-primary" style="background-color: #008080; border-color: #008080;">Reserve</button>
                </form><br><br>
            </div>
            <br><br>

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
                        <p class="mb-0 py-3">
                            Copyright 2022 � Designed by
                            SE/OOP_MLB_WD_2022_S2_199. All rights reserved
                        </p>
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
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
