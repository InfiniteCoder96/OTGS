<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Scalar Inc 2018</title>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/styleSheet.css" rel="stylesheet">
<link rel="stylesheet"
	href="/maps/documentation/javascript/demos/demos.css">
<link
	href="https://fonts.googleapis.com/css?family=Barrio|Berkshire+Swash|Finger+Paint|Flavors|Hanalei|Lobster|Nova+Mono|Poiret+One|Poppins|Yeon+Sung"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Denk One'
	rel='stylesheet'>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/Validate.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<style>

#loader {
  position: absolute;
  left: 50%;
  top: 50%;
  z-index: 1;
  width: 150px;
  height: 150px;
  margin: -75px 0 0 -75px;
  border-radius: 50%;
  border-top: 16px solid chartreuse;
  border-right: 16px solid transparent;
  border-bottom: 16px solid transparent;
  border-left: 16px solid transparent;
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
 
}

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

/* Add animation to "page content" */
.animate-bottom {
  position: relative;
  -webkit-animation-name: animatebottom;
  -webkit-animation-duration: 1s;
  animation-name: animatebottom;
  animation-duration: 1s
}

@-webkit-keyframes animatebottom {
  from { bottom:-100px; opacity:0 } 
  to { bottom:0px; opacity:1 }
}

@keyframes animatebottom { 
  from{ bottom:-100px; opacity:0 } 
  to{ bottom:0; opacity:1 }
}
body, html {
	height: 100%;
	max-width: 100%;
	overflow-x: hidden;
	font-family: Arial;
	background-attachment: fixed;
}

.bg {
	/* The image used */
	background-image: url("images/334992.jpg");
	/* Full height */
	width: 100%;
	/* Center and scale the image nicely */
	background-position: right;
	background-repeat: no-repeat;
	background-size: cover;
	background-attachment: fixed;
}

.pimg {
	-webkit-transition: all 0.8s ease;
}

.pimg:hover {
	transform: scale(1.1);
}


</style>



</head>

<body onload="myFunction1()" style="margin:0;">

<div id="loader"></div>




	<!--style="background: url(images/light-blue-stripe-background.jpg);"  -->



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
							<li><a href="About_Us.jsp">About Us</a></li>

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




	<div class="bg" style="height: 520px; display: table">
	
		<h1
			style="color: #399212; font-family: 'Finger Paint', cursive; margin: 0px; display: table-cell; vertical-align: middle; text-align: center; padding: 0px">
			<font style="color: white; font-family: 'Denk One'; font-size: 50px;letter-spacing: 10px;">WELCOME&nbsp;&nbsp;TO</font><font
				style="font-size: 190px"><br> <font
				style="color: #FFB700"><img
					src="images/4a43577f48916955dc4b250b73528024.png" alt="Smiley face"
					width="200" height="200" align="middle" hspace="20">PA</font><font
				style="color: #005641">RA</font><font style="color: #FF5B00">DI</font><font
				style="color: #8D2029">SE<img
					src="images/4a43577f48916955dc4b250b735280241.png"
					alt="Smiley face" width="200" height="200" align="middle"
					hspace="20"></font><br></font><font
				style="color: white; font-family: 'Denk One'; font-size: 50px;letter-spacing: 8px;">ISLAND</font>
		</h1>
	</div>

	<div class="bg" style="margin-top: 0px; height: 300px">


		<form action="CACS" method="post">
			<input type="hidden" name="command" value="SEARCH" /> <span><input
				class="search" type="text" name="search" placeholder="Search.." >

				<button class="btns btn-lg btn-success">
					<i class="glyphicon glyphicon-search"></i>
				</button></span>
		</form>


		<button class="btns btn-lg btn-danger"
			style="margin-left: 680px; margin-top: 10px;">Get Started</button>
		<div></div>		
	</div>









	<div class="bg" style="height: 100%">
		<div class="container">

			<div class="row">

				<div class="col-md-3">


					<div class="thumbnail">
						<a href="wild.html" target="_blank"> <img
							class="pimg pimg:hover" src="images/tiger.jpg" alt="Lights"
							style="width: 100%">
							<div class="text-block">
								<h4>WILD LIFE</h4>

							</div>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail">
						<a href="nature.html" target="_blank"> <img
							class="pimg pimg:hover" src="images/hikkaduwa-05.jpg"
							alt="Nature" style="width: 100%">
							<div class="text-block">
								<h4>NATURE</h4>

							</div>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail">
						<a href="beaches.html" target="_blank"> <img
							class="pimg pimg:hover"
							src="images/sea_palm_trees_coast_stones_boulders_tropics_45933_3840x2160.jpg"
							alt="Fjords" style="width: 100%">
							<div class="text-block">
								<h4>BEACHES</h4>

							</div>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail">
						<a href="heritage.html" target="_blank"> <img
							class="pimg pimg:hover" src="images/sigiriya.jpg" alt="Heritage"
							style="width: 100%">
							<div class="text-block">
								<h4>HERITAGE</h4>

							</div>
						</a>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-3">
					<div class="thumbnail">
						<a href="scenic.html" target="_blank"> <img
							class="pimg pimg:hover" src="images/scenic2.jpg" alt="Lights"
							style="width: 100%">
							<div class="text-block">
								<h4>SCENIC BEAUTY</h4>

							</div>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail">
						<a href="culture.html" target="_blank"> <img
							class="pimg pimg:hover" src="images/culture.jpg" alt="Nature"
							style="width: 100%">
							<div class="text-block">
								<h4>CULTURE</h4>

							</div>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail">
						<a href="religious.html" target="_blank"> <img
							class="pimg pimg:hover" src="images/religioustemple.jpg"
							alt="Fjords" style="width: 100%">
							<div class="text-block">
								<h4>RELIGIOUS</h4>

							</div>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="thumbnail">
						<a href="bliss.html" target="_blank"> <img
							class="pimg pimg:hover" src="images/bliss1.jpg" alt="Nature"
							style="width: 100%">
							<div class="text-block">
								<h4>BLISS</h4>

							</div>
						</a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<img style="width: 550px; height: 200px; align: center"
						src="images/vintage_red_roses_ribbons_3.png" />
				</div>
			</div>

		</div>

	</div>

	<div class="bg" style="height: 100%;">
		<div class="container">
			<div class="row">


				<div class="col-md-4 ">
					<div class="well" style="background-color: transparent;">
						<div class="customDiv">
							<h2><font style="color: white; font-family: 'Barrio';letter-spacing: 3px;">Where to Go</font></h2>
							<a id="g"
								href="PlacesControllerServlet?page=1&command=LIST&destination=View_Places.jsp">
								<button class="btn btn-sm btn-primary" type="submit">
									<i class="glyphicon glyphicon-menu-right"></i>&nbsp;Learn More
								</button>
							</a>
						</div>


					</div>
				</div>
				<div class="col-md-8" id="h"
					style="display: none; height: 150px; opacity: 0.6; background-color: black; font-size: 20px">
					<p class="paraFontStyle">Explore the blinding beauty of
						Srilanka! Through tha majestic rainforests to the glittering
						waterfalls, discover the spotlights of cultural hotspots and the
						epic era of Royalty and vintage essence. Not to forget the
						tranquil beaches surrounding the Island along with the glorious
						heritage of the Colonial Cities. The pearl of the Indian Ocean is
						yours to visit.</p>
				</div>
			</div>




			<div class="row">
				<div class="col-md-4 ">
					<div class="well" style="background-color: transparent;">
						<div class="customDiv">
							<h2><font style="color: white; font-family: 'Barrio';letter-spacing: 3px;">Where to Stay</font></h2>

							<a id="b" href="HotelReservation.jsp">
								<button class="btn btn-sm btn-warning" type="submit">
									<i class="glyphicon glyphicon-menu-right"></i>&nbsp;Learn More
								</button>
							</a>
							
						</div>


					</div>
				</div>
				<div class="col-md-8" id="a"
					style="display: none; height: 150px; opacity: 0.6; background-color: black; font-size: 20px">
					<p class="paraFontStyle">From the most glamorous to the most
						tranquil, a wide selection of accomodations is up our sleeve. Be
						it an inn or a comfy cottage, a huge villa or a millennium
						appartement, or even a superstar hotel, your tour dream is going
						to have the perfect place to rest those feet. Excellent rates
						along withe perfect facilities, we are here to offer you the
						best..</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8">
					<p id="d"
						style="display: none; height: 150px; opacity: 0.6; background-color: black; font-size: 20px"
						class="paraFontStyle">Afraid to enter a paradise you have
						never been to before? Don't you worry a moment longer. We are
						there for you. Upto a hundred professional guides are here to walk
						you through this Island of mystique, making sure that you don't
						miss a moment of glitter and assuring that you will be safe at all
						times...</p>
				</div>
				<div class="col-md-4">
					<div class="well" style="background-color: transparent;">
						<div class="customDiv">
							<h2><font style="color: white; font-family: 'Barrio';letter-spacing: 3px;">Who will Guide</font></h2>
							
							<a id="c"
								href="TourGuideControllerServlet?page=1&command=LIST&destination=TourGuideDetails.jsp">
								<button class="btn btn-sm btn-info" type="submit">
									<i class="glyphicon glyphicon-menu-right"></i>&nbsp;Learn More
								</button>
							</a>
							<!--<form method="post">
								<input type="hidden" name="command" value="LIST">
								<input type="hidden" name="page" value="1">
								<input type="hidden" name="destination" value="TourGuideDetails.jsp">
								<button class="btn btn-sm btn-info" type="submit">
									<i class="glyphicon glyphicon-menu-right"></i>&nbsp;Learn More
								</button>
							</form>  -->
						</div>
					</div>
				</div>

			</div>
			<div class="row">
				<div class="col-md-8">
					<p id="f"
						style="display: none; height: 150px; opacity: 0.6; background-color: black; font-size: 20px"
						class="paraFontStyle">You know where to go, where to stay and
						even who will guide you. But how will you ever come here? You will
						be flown from where you are to Srilanka, but how to handle the
						details? We are there for you even for that. All air ticket
						reservations will be handled online. Explore our website and see
						for yourself! A few clicks later you better pack your bags because
						your ticket has been reserved and your adventure is about to
						begin..</p>
				</div>
				<div class="col-md-4">
					<div class="well" style="background-color: transparent;">
						<div class="customDiv">
							<h2 ><font style="color: white; font-family: 'Barrio';">Air Ticket Reservation</font></h2>

							<a id="e"
								href="FlightBooking.html">
								<button class="btn btn-sm btn-success" type="submit">
									<i class="glyphicon glyphicon-menu-right"></i>&nbsp;Learn More
								</button>
							</a>
							

						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


	<div class="bg" style="height: 100%">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading" align="center">
							<h4>Sri Lankan Map</h4>
						</div>
						<div class="panel-body">
							<div id="googleMap" style="width: 100%; height: 400px"></div>

							<script>
								function myMap() {
									var mapProp = {
										center : new google.maps.LatLng(7.8731,
												80.7718),
										zoom : 5,
									};
									var map = new google.maps.Map(document
											.getElementById("googleMap"),
											mapProp);
								}
							</script>

							<script
								src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD-jmWFuuBXBGhRwowj08bCr-1u3UvO1SI&callback=myMap"></script>

						</div>
					</div>

				</div>
				<div class="col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading" align="center">
							<h4>Holidays In Sri Lanka</h4>
						</div>
						<div class="panel-body">
							<iframe
								src="https://calendar.google.com/calendar/embed?showTitle=0&amp;height=200&amp;wkst=1&amp;bgcolor=%23666666&amp;src=en.lk%23holiday%40group.v.calendar.google.com&amp;color=%23125A12&amp;ctz=Asia%2FColombo"
								style="border: solid 1px #777" width="520" height="400"
								frameborder="0" scrolling="no"></iframe>

						</div>
					</div>

				</div>

			</div>
		</div>
	</div>

	<div class="footer navbar-static-bottom ">
		<div class="container">
			<div class="row">
				<div class="col-xs-3 col-md-3">
					<h3>Our Services</h3>

					<ul>
						<a>Tour Planning</a>
					</ul>
					<ul>
						<a>Hotel Reservation</a>
					</ul>
					<ul>
						<a>Transportation Reservation</a>
					</ul>
					<ul>
						<a>Hire Tour Guide</a>
					</ul>


				</div>
				<div class="col-xs-3 col-md-3">
					<h3>Our Partners</h3>

					<ul>
						<a>Tour Planning</a>
					</ul>
					<ul>
						<a>Hotel Reservation</a>
					</ul>
					<ul>
						<a>Transportation Reservation</a>
					</ul>
					<ul>
						<a>Hire Tour Guide</a>
					</ul>


				</div>

				<div class="col-xs-3 col-md-3">
					<h3>About the site</h3>

					<ul>
						<a>Terms of Use</a>
					</ul>
					<ul>
						<a>Site Map</a>
					</ul>
					<ul>
						<a>Subscribe</a>
					</ul>
					<ul>
						<a>Contact US</a>
					</ul>


				</div>
				<div class="col-xs-3 col-md-3">
					<div class="row">

						<h3>We are Social</h3>

					</div>
					<div class="row">
						<div class="navbar-text ">
							<a href="https://www.facebook.com/" style="color: Tomato"><i
								class="fab fa-facebook-square fa-2x"></i></a>
						</div>
						<div class="navbar-text">
							<a href="#" style="color: Tomato"><i
								class="fab fa-twitter-square fa-2x"></i></a>
						</div>
						<div class="navbar-text">
							<a href="#" style="color: Tomato"><i
								class="fab fa-instagram fa-2x"></i></a>
						</div>
						<div class="navbar-text">
							<a href="#" style="color: Tomato"><i
								class="fab fa-google-plus-square fa-2x"></i></a>
						</div>
					</div>
				</div>
			</div>



		</div>

	</div>
					
	<div style="width: 100%; background-color: brown; color: azure"
		align="center">

		<p>© 2018 All Rights Reserved by Scalar Industries</p>
		<p>
			Powered By:<a href="#">Scalar Tech</a>
		</p>

	</div>



	<script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/bootstrap.js"></script>

	<script>
		setTimeout(function() {
			$('#alertBox').hide('fade');
		}, 2000);

		document.getElementById('b').onmouseover = function() {
			document.getElementById('a').style.display = 'block';

		}

		document.getElementById('b').onmouseout = function() {
			document.getElementById('a').style.display = 'none';

		}

		document.getElementById('c').onmouseover = function() {
			document.getElementById('d').style.display = 'block';
		}

		document.getElementById('c').onmouseout = function() {
			document.getElementById('d').style.display = 'none';
		}

		document.getElementById('e').onmouseover = function() {
			document.getElementById('f').style.display = 'block';
		}

		document.getElementById('e').onmouseout = function() {
			document.getElementById('f').style.display = 'none';
		}

		document.getElementById('g').onmouseover = function() {
			document.getElementById('h').style.display = 'block';
		}

		document.getElementById('g').onmouseout = function() {
			document.getElementById('h').style.display = 'none';
		}

		/*$('#d').hover(function() {
			$('#c').css('background', '#F00')
		}, function() {
			$('#c').css('background', '')
		});*/

		setTimeout(function() {
			$('#TourPlanningModal').modal('show');
		}, 30000); // milliseconds

		function myFunctions() {
			var x = document.getElementById("myDIV");
			if (x.style.display === "none") {
				x.style.display = "block";
			} else {
				x.style.display = "none";
			}
		}

		function myFunction() {
			var x = document.getElementById("password");
			if (x.type === "password") {
				x.type = "text";
			} else {
				x.type = "password";
			}
		}

		!function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (!d.getElementById(id)) {
				js = d.createElement(s);
				js.id = id;
				js.src = 'https://weatherwidget.io/js/widget.min.js';
				fjs.parentNode.insertBefore(js, fjs);
			}
		}(document, 'script', 'weatherwidget-io-js');
		
		var myVar;

		function myFunction1() {
		    myVar = setTimeout(showPage, 3000);
		}

		function showPage() {
		  document.getElementById("loader").style.display = "none";
		  document.getElementById("myDiv").style.display = "block";
		}
	</script>

	<div class="modal" id="loginModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Sign In</h4>
				</div>
				<div class="modal-body">
				
					
					
					<form action="UserControllerServlet" method="post">
						<input type="hidden" name="command" value="VALIDATE">
						<div class="form-group">
							<div class="input-group">

								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user"></i></span> <input
									class="form-control" placeholder="Enter Username" type="text"
									name="user" required />
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">

								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock"></i></span> <input
									class="form-control" placeholder="Enter Password"
									type="password" name="pass" id="password" required />

							</div>
						</div>
						<div>

							<div>
								<input type="checkbox" onclick="myFunction()" />&nbsp;Show
								Password
								</li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="checkbox" onclick="">&nbsp;Remember Me
							</div>



						</div>
						<div class="modal-footer">
							<div>

								<a href="Email_Confirmation_PW_Reset.jsp">Forget Password</a>
							</div>
							<div></div>
							<button class="btn btn-primary" type="submit">Login</button>
							<button class="btn btn-primary" data-dismiss="modal">Close</button>
						</div>
					</form>


				</div>
				<div class="text-center">
					<p>
						Not Registered yet ? <a href="Registration.jsp">Register</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<div class="modal" id="TourPlanningModal">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal">&times;</button>
					<center>
						<h1>Thank you for visiting www.scalar.travel website.</h1>
					</center>
				</div>
				<div class="modal-body"
					style="height: 500px; background-image: url('images/9.jpg'); background-position: right; background-repeat: no-repeat; background-size: cover;">


					<div style="margin-top: 300px">


						<p style="font-size: 20px; color: white">
							Have you planned your trip to <strong>Sri Lanka ?</strong> If
							not, Please submit your Travel Inquiry to <font
								Style="color: #00ff20"><b>Registered</b></font> Travel Agents.
						</p>





						<div class="modal-footer">
							<a href="Tour_Planning.jsp"><button
									class="btn btn-lg btn-success" type="submit"
									style="vertical-align: bottom">Go Ahead</button></a>
						</div>

					</div>








				</div>

			</div>
		</div>
	</div>

</body>
</html>
