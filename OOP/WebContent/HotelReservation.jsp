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
<link href="css/styleSheetOrg.css" rel="stylesheet">
<script src="js/AnimationJS.js"></script>	
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

<style>

	body, html {
    	height: 100%;
    	font-family: Arial;
	}

	.bg { 
    /* The image used */
    	background-image:url("images/98-acres-resort-mountains-sri-lanka-ella.jpg");

    /* Full height */
    height: 100%; 
	width:100%
    /* Center and scale the image nicely */
    
    background-repeat: no-repeat;
    background-size: cover;
	}
	

	.overlays {
	  position: absolute; 
	  bottom: 232px; 
	  background: rgb(0, 0, 0);
	  background: rgba(0, 0, 0, 0.5); /* Black see-through */
	  color: #f1f1f1; 
	  width: 100%;
	  transition: .5s ease;
	  opacity:0;
	  color: white;
	  font-size: 20px;
	  padding: 20px;
	  text-align: left;
	}
	
	/* When you mouse over the container, fade in the overlay title */
	.bg:hover .overlays {
	  opacity: 1;
	}
	
	}
	
	
</style>

</head>
<body style="background-color:	#79CBD5">


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

<div class="overlays">98 Acres Resort Mountains,Ella</div>

</div>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h1 style="color:#F4FDFF">Hotels & Other Accommodations</h1>
			<p style="color:#2C3F50;font-size:16px">From the most glamorous to the most
						tranquil, a wide selection of accomodations is up our sleeve. Be
						it an inn or a comfy cottage, a huge villa or a millennium
						appartement, or even a superstar hotel, your tour dream is going
						to have the perfect place to rest those feet. Excellent rates
						along withe perfect facilities, we are here to offer you the
						best..</p>
			<p style="color:crimson;">(Please refer Accommodation guide below)</p>
		</div>
	</div>
	<br>
	<div class="row" >
			<div class="col-md-4">
				<div class="containers" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.5);">
					
					<div>
						<a href="ReservationHandler?type=hotel">
						<img src="images/hotels_01.jpg" alt="Avatar" class="image"></a>
						<div class="overlay">Star Class Hotels</div>
					</div>
				
				
				</div>
			
			<br>
				<div class="containers" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.5);">

					<div>
						<a href="ReservationHandler?type=other">
						<img src="images/8.jpg" alt="Avatar" class="image"></a>
						<div class="overlay">Other Hotels</div>
					</div>

				</div>
				
				<br>
				<div class="containers" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.5);">

					<div>
						<a href="ReservationHandler?type=boutiqueHotels">
						<img src="images/ulagalla-room-feature.jpg" alt="Avatar" class="image"></a>
						<div class="overlay">Boutique Hotels</div>
					</div>

				</div>
			</div>
			<div class="col-md-4" >
				<div class="containers" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.5);">
					
				<div>
					<a href="ReservationHandler?type=bunglows">
					<img src="images/adisham-9.jpg" alt="Avatar" class="image"></a>
					<div class="overlay">Bunglows</div>
				</div>
				
				
				</div>
			
			<br>
				<div class="containers" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.5);">

					<div>
						<a href="ReservationHandler?type=guestHouses">
						<img src="images/kandalama-680x360.jpg" alt="Avatar" class="image"></a>
						<div class="overlay">Guest Houses</div>
					</div>

				</div>
				
				<br>
				<div class="containers" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.5);">

					<div>
						<a href="ReservationHandler?type=homeStays">
						<img src="images/hh_feature.jpg" alt="Avatar" class="image"></a>
						<div class="overlay">Home Stays</div>
					</div>

				</div>
			</div>
			<div class="col-md-4">
				<div class="containers" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.5);">
					
					<div>
						<a href="ReservationHandler?type=HeritageHomes">
						<img src="images/09-oceans edge-tangalle - side view of the villa.jpg" alt="Avatar" class="image"></a>
						<div class="overlay">Heritage Homes</div>
					</div>
				
				
				</div>
			
			<br>
				<div class="containers" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.5);">

					<div>
						<a href="ReservationHandler?type=RentedApartments">
						<img src="images/1_13_7083c1bba191c913aa5c26a85fc67977.jpg" alt="Avatar" class="image">
						</a>
						<div class="overlay">Rented Apartments</div>
					</div>

				</div>
				
				<br>
				<div class="containers" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.5);">

					<div>
						<a href="ReservationHandler?type=tourismResorts">
							<img src="images/1480523730d1.jpg" alt="Avatar" class="image">
						</a>
						<div class="overlay">Sri Lanka Tourism Resorts</div>
					</div>

				</div>
			</div>
			
		
	</div>
		
</div>
<br>

<div class="container" style="background-color:#5D6D7E;">
	<div class="row">
		<h3 align="center">Accommodation Guide</h3>
		<br>
		<div class="col-md-6">
			
			<p style="color: gold; font-size: 20px">5 Stars</p><p>Superior standard and an extensive range of first-class guest services</p>
			<p style=" color: gold; font-size: 20px">4 Stars</p><p>Exceptional standard with high-quality furnishings and comfort</p>
			<p style="color: gold; font-size: 20px">3 Stars</p><p>Well-appointed establishments with comfortable, clean rooms and quality furnishings</p>
			<p style="color: gold; font-size: 20px">Less than 3 Stars</p><p>A basic, well-maintained standard</p>
			<p style="color: gold; font-size: 20px">Unclassified Hotels</p><p>Well maintained properties with adequate facilities which do not fall under star classifications.</p>
			
		</div>
		<div class="col-md-6">
			
			<p style="color: gold; font-size: 20px">Boutique Hotel and Villas</p><p>Small but exclusive property that caters to the affluent clientele with an exceptional level of service at premium prices.</p>
			<p style="color: gold; font-size: 20px">Bungalow</p><p>A type of real estate property that consists of a small, one story home with an enclosed porch.</p>
			<p style="color: gold; font-size: 20px">Home Stay</p><p>A stay at a residence by a traveler and especially by a tourist who is hosted by a local family to better learn about the local lifestyle</p>
			<p style="color: gold; font-size: 20px">Rented Apartments</p><p>Is a room or suite of rooms designed as a residence and generally located in a building occupied by more than one household.</p>
			<p style="color: gold; font-size: 20px">Guest House</p><p>Guest houses range from low budget rooms to luxury apartments, and tend to be like small hotels in larger cities.</p>
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

<script type="text/javascript">
	function googleTranslateElementInit() {
		new google.translate.TranslateElement({pageLanguage: 'en', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
	}
</script>
					
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