<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/styleSheet.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/animate.min.css">	
<link rel="stylesheet" href="css/templatemo-style.css">		
<link
	href="https://fonts.googleapis.com/css?family=Barrio|Berkshire+Swash|Finger+Paint|Flavors|Hanalei|Lobster|Nova+Mono|Poiret+One|Poppins|Yeon+Sung"
	rel="stylesheet">
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Scalar Tour Guide Services</title>

<style>
body{

	background-attachment: fixed;
}
.bg {
	/* The image used */
	background-image:
		url("images/TurboCollage-Exported-Image.jpg");
	/* Full height */
	height: 550px;
	/* Center and scale the image nicely */
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<script>
	function openNav() {
		document.getElementById("mySidenav").style.width = "250px";
		document.getElementById("main").style.marginLeft = "250px";
		document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
	}

	function closeNav() {
		document.getElementById("mySidenav").style.width = "0";
		document.getElementById("main").style.marginLeft= "0";
		document.body.style.backgroundColor = "white";
	}
</script>

</head>
<body class="bg">

<% 
	response.setHeader("Cache-Control", "no-stroe");
	response.setHeader("Pragma","no-Cache");
	response.setDateHeader("Expires",0);
%>

<% 	
	if(session.getAttribute("user")==null)
		response.sendRedirect("Home.jsp");

%>


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


<div id="mySidenav" class="sidenav navbody"  >
<br><br><br>
  <p><a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  
  <a href="#panelBody2" data-toggle="collapse" data-parent="#accordion" ><Text style="font-size:20px">Tour Guides</Text></a>
  <a href="#panelBody1" data-toggle="collapse" data-parent="#accordion"><Text style="font-size:40px">Profile</Text></a>
  <a href="#panelBody1" data-toggle="collapse" data-parent="#accordion"><Text style="font-size:15px">Attracive Places</Text></a>
  <a href="#panelBody2" data-toggle="collapse" data-parent="#accordion"><Text style="font-size:30px">Tour Planning</Text></a>
  <a href="#panelBody3" data-toggle="collapse" data-parent="#accordion"><Text style="font-size:50px">Contact Us</Text></a>
  <a href="#panelBody1" data-toggle="collapse" data-parent="#accordion"><Text style="font-size:23px">Search Anything</Text></a>
  <a href="#panelBody2" data-toggle="collapse" data-parent="#accordion"><Text style="font-size:45px">Flight Booking</Text></a>
  <a href="#panelBody3" data-toggle="collapse" data-parent="#accordion"><Text style="font-size:35px">Weather</Text></a>
  <a href="#panelBody1" data-toggle="collapse" data-parent="#accordion"><Text style="font-size:23px">Inquiry</Text></a>
  <a href="#panelBody2" data-toggle="collapse" data-parent="#accordion"><Text style="font-size:12px">About Us</Text></a>
  <a href="#panelBody3" data-toggle="collapse" data-parent="#accordion"><Text style="font-size:50px">Gallery</Text></a></p>
  <a href="#panelBody1" data-toggle="collapse" data-parent="#accordion"><Text style="font-size:15px">Site Map</Text></a>
  
</div>
<br><br><br>
<div class="container" style=" width: 100%; background-color: chartreuse">
	<div class="row">
		<div class="navbody" id="main" >
  			<span style="color: black; font-size:30px;cursor:pointer" class="pull-left" onclick="openNav()">&#9776; Menu</span>
		
					
					<div class="navbar-text pull-right">
						<a href="#" style="color:black"><i class="glyphicon glyphicon-cog fa-2x"></i></a>
					</div>
					<div class="navbar-text pull-right">
						<a href="#" style="color:black"><i class="glyphicon glyphicon-gift fa-2x"></i></a>
					</div>
					<div class="navbar-text pull-right">
						<a href="https://www.facebook.com/" style="color:black"><i class="glyphicon glyphicon-envelope fa-2x"></i></a>
					</div>
					
		
		</div>
	</div>
</div>

<div class="container" style="background-color:#641E16">
	<div class="row" id="myprofile">
		<div>
			<h2 align="center" style="color:aliceblue"><center><Text style="font-family: 'Finger Paint', cursive;font-size:200px;">Welcome</Text><br><Text style="color:#2ECC71"><%=session.getAttribute("user") %></Text><br><Text style="font-size:30px;"> Welcome Back </Text></center></h2>
			<h1 align="center">We Missed You....</h1>
		</div>
		<br>
		<div class="col-md-8 col-md-offset-2">
		
			<img class="roundedImg center-block" src="images/img_568656.png" alt="Avatar" style="width:200px;height:200px">
			
		</div>
		
	</div>
	<br>
	<div class="row" style="opacity: none">
		<div class="col-md-8 col-md-offset-2">
			<div id="accordion" class="panel-group">
				
				
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">
							<a href="#panelBody2" data-toggle="collapse" data-parent="#accordion">
								MY PORTFOLIO
							</a>
						</h3>
					</div>
					<div id="panelBody2" class="panel-collapse collapse" style="background-colour:black">
						<div class="panel-body">
							<div class="well" >
								<center>
								<a href="UserControllerServlet?command=LOAD&user_id=<%=session.getAttribute("id") %>"><button class="btn btn-lg btn-success">View My Details</button></a>
								<button class="btn btn-lg btn-danger">View My Inquiries</button>
								<button class="btn btn-lg btn-info">View My Tour Plans</button>
								</center>
								
								
							</div>
						</div>
					</div>
				</div>
				
				<div class="panel panel-danger">
					<div class="panel-heading">
						<h3 class="panel-title">
							<a href="#panelBody3" data-toggle="collapse" data-parent="#accordion">
								MY GALLERY 
							</a>
						</h3>
					</div>
					<div id="panelBody3" class="panel-collapse collapse" >
						
						<div class="panel-body">
						
							<div class="row">
								<div class="col-md-4">
									<div class="row">
										<a href="images/155bca1e9a0522.jpg" class="thumbnail">
											<p>Wangedigala Hike</p>
											<img src="images/155bca1e9a0522.jpg"  />
										</a>
									</div>
									<div class="row">
										<a href="images/158cb1c04d1971c18dfa30ad7167d849.jpg"  class="thumbnail">
											<p>Wangedigala Hike</p>
											<img src="images/158cb1c04d1971c18dfa30ad7167d849.jpg"  />
										</a>
									</div>
								</div>
								<div class="col-md-4">
									<a href="images/24756_medium.jpg"  class="thumbnail">
										<p>Wangedigala Hike</p>
										<img src="images/24756_medium.jpg"/>
									</a>
									<a href="images/journey-lanka-tours-activities-ayurvedic.jpg"  class="thumbnail">
										<p>Wangedigala Hike</p>
										<img src="images/journey-lanka-tours-activities-ayurvedic.jpg"/>
									</a>
								</div>
								<div class="col-md-4">
									<a href="images/IMG-20180101-WA0076.jpg"  class="thumbnail">
										<p>Wangedigala Hike</p>
										<img src="images/IMG-20180101-WA0076.jpg" />
									</a>
									<a href="images/colombo1.jpg"  class="thumbnail">
										<p>Wangedigala Hike</p>
										<img src="images/colombo1.jpg"/>
									</a>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="row">
										<a href="images/IMG-20180101-WA0090.jpg"  class="thumbnail">
											<p>Wangedigala Hike</p>
											<img src="images/IMG-20180101-WA0090.jpg"  />
										</a>
									</div>
									<div class="row">
										<a href="images/cultural-tours.jpg"  class="thumbnail">
											<p>Wangedigala Hike</p>
											<img src="images/cultural-tours.jpg"  />
										</a>
									</div>
								</div>
								<div class="col-md-4">
									<a href="images/hikkaduwa-05.jpg"  class="thumbnail">
										<p>Wangedigala Hike</p>
										<img src="images/hikkaduwa-05.jpg"/>
									</a>
									<a href="images/6783ca101987f87dc62e0ea48fe90df1.jpg"  class="thumbnail">
										<p>Wangedigala Hike</p>
										<img src="images/6783ca101987f87dc62e0ea48fe90df1.jpg"/>
									</a>
								</div>
								<div class="col-md-4">
									<a href="images/sri-lanka-train-tours.jpg"  class="thumbnail">
										<p>Wangedigala Hike</p>
										<img src="images/sri-lanka-train-tours.jpg" />
									</a>
									<a href="images/51cdba51fa2fa4686277bfed50ac41bc_XL.jpg"  class="thumbnail">
										<p>Wangedigala Hike</p>
										<img src="images/51cdba51fa2fa4686277bfed50ac41bc_XL.jpg"/>
									</a>
								</div>
								
								
							</div>
  							
    						
						</div>
					</div>
				</div>
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">
							<a href="#panelBody4" data-toggle="collapse" data-parent="#accordion">
								CONTACT SCALAR 
							</a>
						</h3>
					</div>
					<div id="panelBody4" class="panel-collapse collapse" >
						
						<div class="panel-body">
							<div class="col-md-12">
						<h2 style="color: cadetblue">CONTACT <span>US</span></h2>
								
						<form action="#" method="post">
							<div class="form-group">
								<label style="color:gold">NAME</label>
								<input class="form-control" placeholder="Enter Your Name" type="text" name="fullname">
							</div>
							<div class="form-group">
								<label style="color:gold">EMAIL</label>
								<input class="form-control" placeholder="Enter Your Email Address" type="text" name="fullname">
							</div>
							<div class="form-group">
								<label style="color:gold">MESSAGE</label>
								<textarea name="message" rows="4" class="form-control" id="message" placeholder="Enter Your Inquiary Here...."></textarea>
							</div>
							<div class="modal-footer">
								<button class="btn btn-primary" type="submit">Submit</button>
								<button class="btn btn-primary" type="reset">Reset</button>
							</div>
							
						</form>
					</div>
							
  							
    						
						</div>
					</div>
				</div>
			</div>
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
