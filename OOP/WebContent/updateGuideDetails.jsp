<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/styleSheet.css" rel="stylesheet">
<link rel="stylesheet" href="css/animate.min.css">	
<link rel="stylesheet" href="css/templatemo-style.css">	
<link
	href="https://fonts.googleapis.com/css?family=Barrio|Berkshire+Swash|Finger+Paint|Flavors|Hanalei|Lobster|Nova+Mono|Poiret+One|Poppins|Yeon+Sung"
	rel="stylesheet">	
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<style>

.bg { 
    /* The image used */
    	background-image:url("images/1209-source-code-programming.jpg");

    /* Full height */
    height: 100%; 
	width:100%
    /* Center and scale the image nicely */
    
    background-repeat: no-repeat;
    background-size: cover;
	}
</style>
</head>

<body class="bg">


<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>

			</button>
			<a href="#" class="navbar-brand"><img
				src="images\tropical (2).png"></a> <a class="navbar-brand"
				href="#">Scalar Tour Guides</a>

			<div class="navbar-collapse collapse ">

				<c:choose>
					<c:when test="${not empty sessionScope.user}">
						<c:if test="${sessionScope.user eq 'Admin'}">
							<ul class="nav navbar-nav navbar-right">
								<li><a href="Home.jsp">Home</a></li>
								<li><a href="Registration.jsp">News</a></li>
								<li><a href="Gallery.html">Gallery</a></li>
								<li><a href="Contact_Us.jsp">Contact</a></li>
								<li><a href="About_Us.html">About Us</a></li>
								<a href="LogOut.jsp"><button
										class="btn btn-primary btn-sm  pull-right "
										style="margin-left: 10px">Sign Out</button></a>&nbsp;&nbsp;&nbsp;
								<a href="Admin_Dashboard.jsp"><button
										class="btn btn-success btn-sm pull-right" type="button">Hi,
										${sessionScope.user}</button></a>
								<button class="btn btn-warning btn-sm pull-left"
									onclick="myFunctions()">Weather Report</button>
							</ul>
						</c:if>
						<c:if test="${sessionScope.user != 'Admin'}">
							<ul class="nav navbar-nav navbar-right">
								<li><a href="Home.jsp">Home</a></li>
								<li><a href="Registration.jsp">News</a></li>
								<li><a href="Gallery.html">Gallery</a></li>
								<li><a href="Contact_Us.jsp">Contact</a></li>
								<li><a href="About_Us.jsp">About Us</a></li>
								<a href="LogOut.jsp"><button
										class=" btn btn-sm  btn-primary  pull-right "
										style="margin-left: 10px">Sign Out</button></a>&nbsp;&nbsp;&nbsp;
								<a href="WelcomeUser.jsp"><button
										class="btn btn-success btn-sm pull-right" type="button">
										Hi, ${sessionScope.user}</button></a>
								<button class="btn  btn-warning btn-sm pull-left"
									onclick="myFunctions()">Weather Report</button>
							</ul>
						</c:if>
					</c:when>
					<c:otherwise>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="Home.jsp">Home</a></li>
							<li><a href="Registration.jsp">Join Us</a></li>
							<li><a href="Gallery.html">Gallery</a></li>
							<li><a href="Contact_Us.jsp">Contact</a></li>
							<li><a href="About_Us.html">About Us</a></li>

							<button style="margin-left: 10px"
								class="btn btn-warning btn-sm pull-right"
								onclick="myFunctions()">Weather Report</button>
							<button class="btn btn-primary btn-sm pull-right "
								data-toggle="modal" data-target="#loginModal">Sign In</button>

						</ul>
					</c:otherwise>
				</c:choose>




			</div>




		</div>
		<div id="myDIV" style="display: none; width: 100%">
			<a class=" weatherwidget-io "
				href="https://forecast7.com/en/7d8780d77/sri-lanka/"
				data-label_1="SRI LANKA" data-label_2="WEATHER"
				data-theme="original">SRI LANKA WEATHER</a>
		</div>
	</nav>
<!---->

<br><br><br><br><br><br>
<div class="container">
	<div class="row">
		
		<center><p style="color: white; font-family: 'Finger Paint', cursive;font-size:40px">Tour Guide Details Update Portal</p></center>
		<div class="col-xs-4 col-xs-offset-4">
			
			<form  action="TourGuideControllerServlet" method="post">
			
					<input type="hidden" name="command" value="UPDATE"/>
					<input type="hidden" name="guide_id" value="${THE_GUIDE.id}"/>
					
					<div class="form-group">
						<label style="color:white">Guide ID</label>
						<input class="form-control" type="text" name="guide_id" value="${THE_GUIDE.id}" disabled="disabled">
					
					</div>
					<div class="form-group">
						<label style="color:white">Full Name</label>
						<input class="form-control" type="text" name="Name" value="${THE_GUIDE.firstName}">
					
					</div>
					<div class="form-group">
						<label style="color:white">Email Address</label>
						<input class="form-control" type="text" name="email" value="${THE_GUIDE.emailAddress}">
						
					</div>
					<div class="form-group">
						<label style="color:white">Telephone</label>
						<input class="form-control" type="text" name="telephone" value="${THE_GUIDE.telephone}">
						
					</div>
					<div class="form-group">
						<label style="color:white">Expiary Date</label>
						<input class="form-control" type="date" name="expdate" value="${THE_GUIDE.expDate}">
					
					</div>
					<div class="form-group">
						<label style="color:white">Languages</label>
						<input class="form-control" type="text" name="language_1" value="${THE_GUIDE.getLanguage_1()}">
						
					
					</div>
					<div class="form-group">
						<label style="color:white">Languages</label>
						<input class="form-control" type="text" name="language_2" value="${THE_GUIDE.getLanguage_2()}">
						
					
					</div>
					<div class="form-group">
						<label style="color:white">Languages</label>
						<input class="form-control" type="text" name="language_3" value="${THE_GUIDE.getLanguage_3()}">
						
					
					</div>
					<div class="form-group">
						<label style="color:white">Languages</label>
						<input class="form-control" type="text" name="language_4" value="${THE_GUIDE.getLanguage_4()}">
						
					
					</div>
					<div class="form-group">
						<label style="color:white">Languages</label>
						<input class="form-control" type="text" name="language_5" value="${THE_GUIDE.getLanguage_5()}">
						
					
					</div>
					
						
						
						
					<div class="form-group">
					
						<label style="color:white">Category</label>
						<select class="form-control"  name="category"  >
							
							
							<option value="${THE_GUIDE.category}" selected>${THE_GUIDE.category}</option>
							<option>National Guide</option>
							<option>Chauffeur</option>
							
						</select>
						
					</div>
					
					<div class="form-group">
						<label style="color:white">Address</label>
						<textarea class="form-control" type="text" name="address" >${THE_GUIDE.address}</textarea>
						
					</div>
					<div class="modal-footer">
							<button id="registerBtn" class="btn btn-success" type="submit">Submit</button>
							<button class="btn btn-danger" type="reset">Reset</button>
					</div>
					
				</form>
		</div>
	</div>
	</div>





 <div class="footer navbar-static-bottom ">
 	<div class="container">
 		<div class="row">
			<div class="col-md-3">
				<h3>Our Services</h3>
					
						<ul><a>Tour Planning</a></ul>
						<ul><a>Hotel Reservation</a></ul>
						<ul><a>Transportation Reservation</a></ul>
						<ul><a>Hire Tour Guide</a></ul>
					
						
			</div>
			<div class="col-md-3">
				<h3>Our Partners</h3>
					
						<ul><a>Tour Planning</a></ul>
						<ul><a>Hotel Reservation</a></ul>
						<ul><a>Transportation Reservation</a></ul>
						<ul><a>Hire Tour Guide</a></ul>
					
						
			</div>
			
			<div class="col-md-3">
			  <h3>About the site</h3>
					
						<ul><a>Terms of Use</a></ul>
						<ul><a>Site Map</a></ul>
						<ul><a>Subscribe</a></ul>
						<ul><a>Contact US</a></ul>
					
						
			</div>
			<div class="col-md-3">
				<div class="row">
					
						<h3>We are Social</h3>
					
				</div>
				<div class="row">
					<div class="navbar-text ">
						<a href="https://www.facebook.com/" style="color:Tomato"><i class="fab fa-facebook-square fa-2x"></i></a>
					</div>
					<div class="navbar-text">
						<a href="#" style="color:Tomato"><i class="fab fa-twitter-square fa-2x"></i></a>
					</div>
					<div class="navbar-text">
						<a href="#" style="color:Tomato"><i class="fab fa-instagram fa-2x"></i></a>
					</div>
					<div class="navbar-text">
						<a href="#" style="color:Tomato"><i class="fab fa-google-plus-square fa-2x"></i></a>
					</div>
				</div>
			</div>
		</div>
		<br>
 		
			
	</div>

 </div> 
 
<div style="width: 100%; background-color: brown; color: azure" align="center">

	<p >© 2018 All Rights Reserved by Scalar Industries</p>
	<p>Powered By:<a href="#">Scalar Tech</a></p>

</div>
	
	

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.js"></script>

<div class="modal" id="loginModal" >
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" style="color:black">Sign In</h4>
			</div>
			<div class="modal-body">
				<form action="UserValidate" method="post">
					<div class="form-group">
						<label for="InputUserName">Username</label>
						<input class="form-control" placeholder="Enter Username" type="text" name="user">
					</div>
					<div class="form-group">
						<label for="InputPassword">Username</label>
						<input class="form-control" placeholder="Enter Password" type="password" name="pass">
					</div>
					<div class="modal-footer">
							<button class="btn btn-primary" type="submit">Login</button>
							<button class="btn btn-primary" data-dismiss="modal">Close</button>
					</div>
				</form>
			
			
			</div>
			<div class="text-center" style="color:black">
				<p>Not Registered yet ?		<a href="Registration.html">Register</a></p>
			</div>
		</div>
	</div>
</div>



</body>
</html>