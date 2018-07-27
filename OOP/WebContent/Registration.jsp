<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Scalar Inc 2018</title>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/styleSheet.css" rel="stylesheet" type="text/css">

<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<script src="js/Validate.js"></script>

<style>

body, html {
	height: 100%;
	font-family: Arial;
}

.bg {
	/* The image used */
	background-image: url("images/colombo-temple.jpg");
	/* Full height */
	height: 500px;
	/* Center and scale the image nicely */
	background-repeat: no-repeat;
	background-size: cover;
}

.overlay {
	position: absolute;
	bottom: 232px;
	background: rgb(0, 0, 0);
	background: rgba(0, 0, 0, 0.5); /* Black see-through */
	color: #f1f1f1;
	width: 100%;
	transition: .5s ease;
	opacity: 0;
	color: white;
	font-size: 20px;
	padding: 20px;
	text-align: left;
}

/* When you mouse over the container, fade in the overlay title */
.bg:hover .overlay {
	opacity: 1;
}	

	
</style>

</head>

<body style="background-color:	#3E7F89">


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

<div class="bg" style="margin-bottom:20px;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.5);height:500px">

<div class="overlay">Gangarama Temple,Colombo</div>

</div>

<div class="container">
	<div class="row">
		
		<div class="col-xs-4 col-md-9">
					<c:if test="${not empty WalertMsg}">
						<div id="alertBox" class="alert alert-danger">
						<a class="close" data-dismiss="alert">&times;</a>
						<P>${WalertMsg}<P>
						</div>
					</c:if>
					
					<c:if test="${not empty SalertMsg}">
						<div id="alertBox" class="alert alert-success">
						<a class="close" data-dismiss="alert">&times;</a>
						<P>${SalertMsg}<P>
						</div>
					</c:if>
			<div class="row">
					
						<div class="col-md-12" >
						<h1 style="color: #F3F5F7">REGISTRATION</h1>
						<p style="color:#9CAFB5;font-size:16px"><strong>Tourist guides</strong> provides the visitor with in depth knowledge 
						in their mother tongue, smoothing creases and wrinkles that is
						bound to occur while touring a foreign country for the first 
						time. It is best to choose a tourist guide who had been
						professionally trained and authorized by SriLanka Tourism,
						who are categorized as National Tourist Guides or Chauffeur
						Tourist Guides. The National Tourist Guides caters to a large
						group of tourists traveling in luxury coaches driven by 
						reserved drivers while Chauffeur Tourist Guides would be
						guiding small groups conveyed in small vans and luxury cars.</p>
					</div>
		
		
				</div>
				<form  method="post" action="UserControllerServlet" onsubmit="return PW_Validate()">
			
				<input type="hidden" name="command" value="VERIFY"/>
				
				
				<div class="form-group">
					<label style="color:white">First Name</label>
					<input class="form-control zform-control:focus" placeholder="Enter First Name" type="text" name="firstName" required>
					<span id="fnamelocation"></span> 
				</div>
				<div class="form-group">
					<label style="color:white">Last name</label>
					<input class="form-control control" placeholder="Enter Last Name" type="text" name="lastName" required>
					<span id="lnamelocation"></span> 
				</div>
				<div class="form-group">
					<label style="color:white">Email</label>
					<input class="form-control control" placeholder="Enter Email Address" type="email" name="email" required>
					<span id="emaillocation"></span> 
				</div>
				<div class="form-group">
				
					<label style="color:white">Country</label>
					<select class="form-control" title="Select Your Country" name="country" required>
						<option selected disabled>Select Your Country</option>
						<option>Sri Lanka</option>
						<option>England</option>
						<option>Austrailia</option>
						<option>Canada</option>
						<option>Brazil</option>
						<option>India</option>
						<option>Maldives</option>
						<option>China</option>
						<option>Russia</option>
						<option>Japan</option>
					</select>
					
				</div>
				<span id="countrylocation"></span>  
				<div class="form-group">
					<label style="color:white">Username</label>
					<input class="form-control" placeholder="Enter Username" type="text" name="username" required>
					<span id="usernamelocation"></span> 
				</div>
				
				
				
				<div class="form-group">
					<label style="color:white">Password</label>
					<input class="form-control" placeholder="Enter Password" type="password" name="password" id="password" required>
					<span id="pwlocation"></span> 
				</div>
				<div class="form-group">
					<label style="color:white">Confirm Password</label>
					<input class="form-control" placeholder="Re enter password" type="password" name="confirmPassword" id="con_password" required>
					<span id="conpwlocation"></span> 
				</div>
				<div class="modal-footer">
							<button id="registerBtn" class="btn btn-primary" type="submit">Submit</button>
							<button class="btn btn-primary" type="reset">Reset</button>
				</div>
			</form>
		</div>
		
		
		
		
		
		<div class="col-xs-6 col-md-3">
			
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading">
							<a class="btn btn-primary" href="#ImgGal" data-toggle="collapse">Show Image Gallery</a>
						</div>
						<div class="panel-body collapse"  id="ImgGal">
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
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading">
							<a class="btn btn-primary" href="#servicesGal" data-toggle="collapse">Show Our Services</a>
						</div>
						<div class="panel-body collapse"  id="servicesGal">
							<div class="row">
								<div class="col-md-4">
									<div class="row">
										<a href="../../../MyDocs/photos/IMG-20171231-WA0004.jpg"  class="thumbnail">
											<p>Wangedigala Hike</p>
											<img src="../../../MyDocs/photos/IMG-20171231-WA0004.jpg"  />
										</a>
									</div>
									<div class="row">
										<a href="../../../MyDocs/photos/IMG-20171231-WA0004.jpg"  class="thumbnail">
											<p>Wangedigala Hike</p>
											<img src="../../../MyDocs/photos/IMG-20171231-WA0004.jpg"  />
										</a>
									</div>
								</div>
								<div class="col-md-4">
									<a href="../../../MyDocs/photos/IMG-20180101-WA0026.jpg"  class="thumbnail">
										<p>Wangedigala Hike</p>
										<img src="../../../MyDocs/photos/IMG-20180101-WA0026.jpg"/>
									</a>
								</div>
								<div class="col-md-4">
									<a href="../../../MyDocs/photos/IMG-20180101-WA0096.jpg"  class="thumbnail">
										<p>Wangedigala Hike</p>
										<img src="../../../MyDocs/photos/IMG-20180101-WA0096.jpg" />
									</a>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="row">
										<a href="../../../MyDocs/photos/IMG-20171231-WA0004.jpg"  class="thumbnail">
											<p>Wangedigala Hike</p>
											<img src="../../../MyDocs/photos/IMG-20171231-WA0004.jpg"  />
										</a>
									</div>
									<div class="row">
										<a href="../../../MyDocs/photos/IMG-20171231-WA0004.jpg"  class="thumbnail">
											<p>Wangedigala Hike</p>
											<img src="../../../MyDocs/photos/IMG-20171231-WA0004.jpg"  />
										</a>
									</div>
								</div>
								<div class="col-md-4">
									<a href="../../../MyDocs/photos/IMG-20180101-WA0026.jpg"  class="thumbnail">
										<p>Wangedigala Hike</p>
										<img src="../../../MyDocs/photos/IMG-20180101-WA0026.jpg"/>
									</a>
								</div>
								<div class="col-md-4">
									<a href="../../../MyDocs/photos/IMG-20180101-WA0096.jpg"  class="thumbnail">
										<p>Wangedigala Hike</p>
										<img src="../../../MyDocs/photos/IMG-20180101-WA0096.jpg" />
									</a>
								</div>
							</div>
						</div>
					</div>
					
					
					
				</div>
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading">
							<a class="btn btn-primary" href="#archievementsGal" data-toggle="collapse">Show Special Achievements</a>
						</div>
						<div class="panel-body collapse"  id="archievementsGal">
							<div class="row">
								<div class="col-md-4">
									<div class="row">
										<a href="../../../MyDocs/photos/IMG-20171231-WA0004.jpg"  class="thumbnail">
											<p>Wangedigala Hike</p>
											<img src="../../../MyDocs/photos/IMG-20171231-WA0004.jpg"  />
										</a>
									</div>
									<div class="row">
										<a href="../../../MyDocs/photos/IMG-20171231-WA0004.jpg"  class="thumbnail">
											<p>Wangedigala Hike</p>
											<img src="../../../MyDocs/photos/IMG-20171231-WA0004.jpg"  />
										</a>
									</div>
								</div>
								<div class="col-md-4">
									<a href="../../../MyDocs/photos/IMG-20180101-WA0026.jpg"  class="thumbnail">
										<p>Wangedigala Hike</p>
										<img src="../../../MyDocs/photos/IMG-20180101-WA0026.jpg"/>
									</a>
								</div>
								<div class="col-md-4">
									<a href="../../../MyDocs/photos/IMG-20180101-WA0096.jpg"  class="thumbnail">
										<p>Wangedigala Hike</p>
										<img src="../../../MyDocs/photos/IMG-20180101-WA0096.jpg" />
									</a>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="row">
										<a href="../../../MyDocs/photos/IMG-20171231-WA0004.jpg"  class="thumbnail">
											<p>Wangedigala Hike</p>
											<img src="../../../MyDocs/photos/IMG-20171231-WA0004.jpg"  />
										</a>
									</div>
									<div class="row">
										<a href="../../../MyDocs/photos/IMG-20171231-WA0004.jpg"  class="thumbnail">
											<p>Wangedigala Hike</p>
											<img src="../../../MyDocs/photos/IMG-20171231-WA0004.jpg"  />
										</a>
									</div>
								</div>
								<div class="col-md-4">
									<a href="../../../MyDocs/photos/IMG-20180101-WA0026.jpg"  class="thumbnail">
										<p>Wangedigala Hike</p>
										<img src="../../../MyDocs/photos/IMG-20180101-WA0026.jpg"/>
									</a>
								</div>
								<div class="col-md-4">
									<a href="../../../MyDocs/photos/IMG-20180101-WA0096.jpg"  class="thumbnail">
										<p>Wangedigala Hike</p>
										<img src="../../../MyDocs/photos/IMG-20180101-WA0096.jpg" />
									</a>
								</div>
							</div>
						</div>
					</div>
					
					
					
				</div>
				
						
								
						<div class="row" >
						
							<div class="col-xs-2 col-md-12">
							<h2 style="color: #F3F5F7">TESTIMONIAL</h2>
								<div id="imageCarousel" class="carousel slide " data-warp="false" data-interval="5000" data-ride="carousel"> 
								
								
								
								<div class="carousel-inner" style="width:100%;height:450px">
									<div class="item active">
										<div class="row">
											<div class="col-xs-2 col-md-3" style="width:100%;height:100%">
												<img src="images\joanna-and-family-tour.jpg" class="img-responsive" />
												<div class="well" style="width:100%;height:450px">
													<h4>Joanna and Family</h4>
													<p><i class="fa fa-quote-left fa-2x"></i><p>Provides the visitor with in depth knowledge 
													in their mother tongue, smoothing creases and wrinkles that is
													bound to occur while touring a foreign country for the first 
													time</p><p>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-quote-right fa-2x"></i><p>
												</div>
											</div>
											
										</div>
									</div>
									<div class="item">
										<div class="row">
											<div class="col-xs-2 col-md-3" style="width:100%;height:100%">
											
											  <img src="images\charlie_376_268_s_c1.png" class="img-responsive " />
												<div class="well" style="width:100%;height:450px">
													<h4>Charlie Kim</h4>
													<p><i class="fa fa-quote-left fa-2x"></i><p>Provides the visitor with in depth knowledge 
													in their mother tongue, smoothing creases and wrinkles that is
													bound to occur while touring a foreign country for the first 
													time</p><p>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-quote-right fa-2x"></i><p>
												</div>
												
												
											</div>
											
										</div>
									</div>
									<div class="item">
										<div class="row">
											<div class="col-xs-2 col-md-3" style="width:100%;height:100%">
												<img src="images\family-portrait.jpg" class="img-responsive " />
												
												<div class="well" style="width:100%;height:450px">
													<h4>Veronica & Daniel Family</h4>
													<p><i class="fa fa-quote-left fa-2x"></i><p>Provides the visitor with in depth knowledge 
													in their mother tongue, smoothing creases and wrinkles that is
													bound to occur while touring a foreign country for the first 
													time</p><p>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-quote-right fa-2x"></i><p>
												</div>
												
											</div>
											
										</div>
									</div>
									<div class="item">
										<div class="row">
											<div class="col-xs-2 col-md-3" style="width:100%;height:100%">
												<img src="images\keshara.jpg" class="img-responsive " />
												<div class="well" style="width:100%;height:450px">
													<h4>Keshara Smith</h4>
													<p><i class="fa fa-quote-left fa-2x"></i><p>Provides the visitor with in depth knowledge 
													in their mother tongue, smoothing creases and wrinkles that is
													bound to occur while touring a foreign country for the first 
													time</p><p>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-quote-right fa-2x"></i><p>
												</div>
											</div>
											
										</div>
									</div>
									<div class="item">
										<div class="row">
											<div class="col-xs-2 col-md-3" style="width:100%;height:100%">
												<img src="images\thomas-roberts-_0052.jpg" class="img-responsive " />
												<div class="well" style="width:100%;height:450px">
													<h4>Thomas Roberts</h4>
													<p><i class="fa fa-quote-left fa-2x"></i><p>Provides the visitor with in depth knowledge 
													in their mother tongue, smoothing creases and wrinkles that is
													bound to occur while touring a foreign country for the first 
													time</p><p>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-quote-right fa-2x"></i><p>
												</div>
											</div>
											
										</div>
									</div>
									<div class="item">
										<div class="row">
											<div class="col-xs-2 col-md-3" style="width:100%;height:100%">
												<img src="images\pinnawala-1.jpg" class="img-responsive " />
												<div class="well" style="width:100%;height:450px">
													<h4>Jinna Mass</h4>
													<p><i class="fa fa-quote-left fa-2x"></i><p>Provides the visitor with in depth knowledge 
													in their mother tongue, smoothing creases and wrinkles that is
													bound to occur while touring a foreign country for the first 
													time</p><p>&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-quote-right fa-2x"></i><p>
												</div>
											</div>
											
										</div>
									</div>
									
									
								
					
								</div>
								<a href="#imageCarousel" class="carousel-control left" data-slide="prev">
									<span class="glyphicon glyphicon-chevron-left"></span>
								</a>
								<a href="#imageCarousel" class="carousel-control right" data-slide="next">
									<span class="glyphicon glyphicon-chevron-right"></span>
								</a>
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
		
 		
			
	
</div>
 </div> 
 
<div style="width: 100%; background-color: brown; color: azure" align="center">

	<p >© 2018 All Rights Reserved by Scalar Industries</p>
	<p>Powered By:<a href="#">Scalar Tech</a></p>

</div>
	
	<div class="modal" id="loginModal" >
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Sign In</h4>
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
			<div class="text-center">
				<p>Not Registered yet ?		<a href="Registration.html">Register</a></p>
			</div>
		</div>
	</div>
</div>
	

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.js"></script>

			   
		    
<script type="text/javascript">
		
			
	setTimeout(function(){
		$('#alertBox').hide('fade');
	},4000);
			
	function PW_Validate(){
		var pass = document.getElementById("password").value;
		var con_pass = document.getElementById("con_password").value;
		
		if(pass == con_pass){
			
			
			return true;
		}
		else{
			alert("Passwords didn't matched");
			
			return false;
		}
	}		
</script>


	
</body>
</html>