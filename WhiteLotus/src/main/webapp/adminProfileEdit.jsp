<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
    <title>User Profile Edit</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/regFormStyles.css">
    <link rel="stylesheet" href="css/gridFormat.css">
    <link rel="stylesheet" href="css/profileStyling.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@500&display=swap" rel="stylesheet">   
    
     <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/et-icons.css">
    
      
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
	       	 	<li class="nav-item">
          			<a class="nav-link" href="out">Log Out</a>
        		</li>
			</ul>
	    </div>
    </div>
	</nav>

  <c:forEach var="usr" items="${usrDetails}">


    <section>
    <div id="profileCardOutter" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" class="container my-3 p-5 col-lg-6 overflow-auto">




			<span style="color:red;">${error}</span>

                        <form id="profile" action="updateProfile" method="POST">
                           
                            
                            <h2 class="text-center text-primary" >Hello ${usr.username} !</h2><br>

                            
                            

                            <label class="accountDetailsTitle" for="email"><div>Email<span style="color:red;"> (Cannot Be changed)</span></div></label>
                            <input class="accountDetailsInput  accountDetailsInputReadOnly" id="email" type="email" name="email" value="${usr.email}" readonly><br><br>
                            
                            <label class="accountDetailsTitle" for="username"><div>Username<span style="color:red;"> (Cannot Be changed)</span></div></label>
                            <input class="accountDetailsInput  accountDetailsInputReadOnly" id="username" type="text" name="username" value="${usr.username}" readonly><br><br>

                            <label class="accountDetailsTitle" for="fname"><div>First Name</div></label>
                            <input class="accountDetailsInput  accountDetailsInputFocus" id="fname" type="text" name="fname" value="${usr.firstName}"><br><br>

                            <label class="accountDetailsTitle" for="lname"><div>Last Name</div></label>
                            <input class="accountDetailsInput accountDetailsInputFocus" id="lname" type="text" name="lname" value="${usr.lastName}"><br><br>

                            <label class="accountDetailsTitle" for="tpNo"><div>Phone Number</div></label>
                            <input class="accountDetailsInput accountDetailsInputFocus" id="tpNo" type="text" name="tpNo" value="${usr.contactNumber}"><br><br>
                            
                            <br><br>
                            <fieldset>
                                <legend>Address</legend>
                                <label class="accountDetailsTitle" for="street"><div>Street</div></label>
                                <input class="accountDetailsInput accountDetailsInputFocus" id="street" type="text" name="street" value="${usr.street}"><br><br>

                                <label class="accountDetailsTitle" for="city"><div>City</div></label>
                                <input class="accountDetailsInput  accountDetailsInputFocus" id="city" type="text" name="city" value="${usr.city}"><br><br>

                                <label class="accountDetailsTitle" for="Country"><div>Country</div></label>
                                <input class="accountDetailsInput accountDetailsInputFocus" id="Country" type="text" name="country" value="${usr.country}"><br><br>
                            </fieldset>

                            <br>
					
                            <button id="saveChangesbtn" type="submit" name="save">Save changes</button>
                            <button id="cancelSaveChangesbtn" type="reset" name="cancel">Cancel</button>
                        </form>

                            

                            <fieldset class="text-center overflow-auto" id="advancedOptions">
                                <div class="text-center my-2" style="color:white; font-size:1.2rem;"><b>Advanced Options</b></div>
                               
                                <button class="advancedOptionsbtn"  onclick="togglePwdChange()" id="pwdChangeRequestBtn">Change Account Password</button>
                                <button class="advancedOptionsbtn" onclick="toggleDeleteAccount()" id="deleteAccountRequestBtn">Delete Account</button>
                                
                            </fieldset>
    </div>    
    <div  id="hiddenCompartmentAdvancedOptions" class="container my-3 p-5 col-lg-6">
    	<!-- changePassword -->
    	<div class="changePwd" id="changePwd" style="display:none;">
    		<form action="changePwd" method="post">
    		
				<input class="accountDetailsInput  accountDetailsInputReadOnly" id="email" type="hidden" name="email" value="${usr.email}" ><br><br>
				
				<h2>Change Password</h2>
				<label class="accountDetailsTitle" for="currentPwd"><div>Current Password</div></label>
            	<input class="accountDetailsInput  accountDetailsInputFocus" id="currentPwd" type="password" name="currentPwd" required><br><br>
 
                <div class="pwd">
                	<label class="accountDetailsTitle" for="newpwd"><div>New Password</div></label>
                    <input id="newpwd" class="form-control accountDetailsInput accountDetailsInputFocus" type="password" name="newPwd"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                    <div id="pwdHiddenValidation" style="display:none; position:static;" class="pwdValidation">
                        <p id="lowercase2">A lowercase letter</p>
                        <p id="uppercase2">An uppercase letter</p>
                        <p id="number2">A number</p>
                        <p id="letterCount2">Minimum 8 characters</p>
                    </div>
                </div><br>
            	
            	<label class="accountDetailsTitle" for="confirmPwd"><div>Confirm Password</div></label>
            	<input class="accountDetailsInput accountDetailsInputFocus" id="confirmPwd" type="password" name="confirmPwd" required><br><br>
            	<button id="saveChangesbtn" type="submit" name="save">Save changes</button>
            	<button id="cancelSaveChangesbtn" type="reset" name="cancel">Cancel</button>
			</form>
		</div>
		
		<br><br><br>
		<!-- Delete Account -->
		<div class="deleteAccount" id="deleteAccount" style="display:none;">
    		<form action="deleteAccount" method="post">
   				
				<h2>Enter your password to delete the Account</h2>
				
                <input class="accountDetailsInput  accountDetailsInputReadOnly" id="email" type="hidden" name="email" value="${usr.email}" ><br><br>
                            
				
				<label class="accountDetailsTitle" for="currentPwd"><div>Password</div></label>
            	<input class="accountDetailsInput  accountDetailsInputFocus" id="currentPwd" type="password" name="currentPwd" required><br><br>
 				<div><span style="color:red;">(This cannot be undone) </span></div>
 				<button id="saveChangesbtn" type="reset" name="cancel">cancel</button>
 				<button id="cancelSaveChangesbtn" type="submit" name="confirmDelete">Confirm</button>
 				
			</form>
		</div>
		
		
    </div>
</section>
     </c:forEach>
 
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
     
<script src="js/pwdChange.js"></script>
<script src="js/advancedAccountOptions.js"></script>
</body>


</html>