<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/styleSheet.css" rel="stylesheet">
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<script src="js/Validate.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/Validate.js"></script>

<style>
body, html {
	height: 100%;
	font-family: Arial;
}

.bg {
	/* The image used */
	background-image: url("images/sri-lanka-train-tours.jpg");
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
<body style="background-color: 	#000421" onload="btnshw()">



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

	<div class="bg"
		style="margin-bottom: 0px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.5);">
		<div class="overlay">SriLanka Train Tours,Hill Country</div>
	</div>


	<div class="container">
		<div class="row">
			<div class="col-md-9">

				<div class="row">

					<div class="col-md-12">
						<h1 style="color: #023871">Search Results</h1>
						<h2 style="color: white;">
							If <strong>You</strong> haven't found it yet,<strong>Keep
								Looking</strong>
						</h2>


						<p>
							<strong>- Steve Jobs</strong>
						</p>
					</div>


				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="well"
							style="height: 100px; width: 100%; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.5); background-color: gold">
							<p>${fn:length(list)} matched results found
							<p>



								<button class="btn btn-sm btn-danger" onclick="showPlaces()"
									id="places_btn" >Places <span class="badge badge-light">${count_places}</span></button>

								<button class="btn btn-sm btn-primary" onclick="showGuides()"
									 id="guides_btn">Tour Guides <span class="badge badge-light">${count_guides}</span></button>

								<button class="btn btn-sm btn-default" onclick="myFunctions()"
									 id="hotels_btn">Hotels</button>
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-md-12" id="places" style="display: none">

						<c:forEach var="places" items="${list}">
							
							<c:if test="${places['class'] eq 'class com.scalar.web.userModelPack.Places'}">

								<div class="row">

									<div class="well"
									style="height: 200px; width: 100%; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.5); background-color: white">
									<div class="row">

										<div class="col-md-3">
											<a href="${places.getP_img_filename()}"> <img
												src="${places.getP_img_filename()}"
												style="min-width: 300px; max-width: 500px; max-height: 150px; box-sizing: border-box; border: 2px solid #9D7F65; border-radius: 6px;" />
											</a>

										</div>
										<div class="col-md-6" style="margin-left: 120px;">
											<h4 style="color: black">${places.getPlace_name()}
												(${places.getP_category()})</h4>
											<p style="color: #0B516E">City:${places.getPlace_city()}</p>
											<p style="color: #0B516E">${places.getP_caption()}</p>

										</div>
										<a href="${showPlacelink}"><button class="btn btn-success">View More</button></a>
									</div>






								</div>

								</div>

							</c:if>
							
							
						</c:forEach>
					</div>
					<div class="col-md-12" id="guides" style="display: none">
						<c:forEach var="places" items="${list}">
							<c:if test="${not empty list}">
								<c:if
									test="${places['class'] eq 'class com.scalar.web.userModelPack.TourGuide'}">

									
									<div class="row">
										<div class="well"
											style="height: 385px; width: 90%; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.5); background-color: #B7950B">
											<div class="col-md-3">
												<img src="images/Office-Customer-Male-Dark-icon.png" />
											</div>
											<div class="col-md-6" style="margin-left: 50px;">
												<h4 style="color: black">${places.firstName}</h4>
												<p style="color: #0B6E60">Category:${places.category}</p>
												<p style="color: #0B516E">Languages:${places.language_1},${tourguide.language_2},${tourguide.language_3},${tourguide.language_4},${tourguide.language_5}</p>
												<p style="color: #0B6E60">Telephone:${places.telephone}</p>
												<p style="color: #0B516E">Address:${places.address}</p>
												<p style="color: #0B6E60">Email:${places.emailAddress}</p>
												<p style="color: #0B516E">Registration No:${places.id}</p>
												<p style="color: #0B6E60">Expiary Date:${places.expDate}</p>

											</div>

										</div>

									</div>
								</c:if>
							</c:if>

								
						</c:forEach>

					</div>
				</div>


			</div>
			<div class="col-md-3" style="margin-top: 30px">
				<div class="panel panel-warning">
					<div class="panel-heading">
						<h4>Guide Categories</h4>
					</div>
					<div class="panel-body">
						<h5>
							<strong>National Tourist Guides</strong>
						</h5>
						<p style="font-size: 13px">National tourist guides generally
							handle large groups of tourists and travel in large tourist
							coaches driven by a dedicated driver.</p>
						<h5>
							<strong>Chauffeur Tourist Guides</strong>
						</h5>
						<p style="font-size: 13px">Chauffeur tourist guides handles
							small groups and parties from 01-07 pax. The tours are been
							conducted in air conditioned micro vans and in semi luxury cars
							driven by the guide.</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 fixed">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h4>Search Portal</h4>
					</div>
					<div class="panel-body">

						<form action="TourGuideControllerServlet" method="get">

							<input type="hidden" name="command" value="SEARCH" /> <input
								type="hidden" name="destination" value="TourGuideDetails.jsp" />
							<div class="form-group">
								<label for="InputUserName">Search by:</label> <select
									class="form-control" title="Select search category"
									name="category">
									<option selected disabled>Select an Option</option>
									<option>Tour Guide ID</option>
									<option>Name</option>
									<option>Category</option>
									<option>Languages</option>

								</select>

							</div>

							<div class="form-group">

								<label for="InputPassword">Keyword:</label> <input
									class="form-control" placeholder="Search here...." type="text"
									name="key" required>
							</div>
							<div class="modal-footer">

								<button class="btn btn-info" type="submit">Search</button>

							</div>
						</form>

					</div>
					<div class="panel-footer">
						<h6>
							Powered by:<strong>Scalar Technologies</strong>
						</h6>
					</div>

				</div>


			</div>
			<div class="col-md-3 fixed">
				<div class="panel panel-danger">
					<div class="panel-heading">
						<h5>Tour Guides with expired license</h5>
					</div>
					<div class="panel-body" align="center">
						<form action="TourGuideControllerServlet" method="get">
							<input type="hidden" name="command" value="LIST_EXP" /> <input
								type="hidden" name="destination" value="TourGuideDetails.jsp" />
							<input type="hidden" name="page" value="1" />
							<button class="btn btn-sm btn-danger" type="submit">View</button>
							</a>
						</form>
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
				<div class="col-md-3">
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

				<div class="col-md-3">
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
				<div class="col-md-3">
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

	<script type="text/javascript">
		function showPlaces() {
			var x = document.getElementById("places");
			if (x.style.display === "none") {
				x.style.display = "block";
			} else {
				x.style.display = "none";
			}
		}

		function showGuides() {
			var x = document.getElementById("guides");
			if (x.style.display === "none") {
				x.style.display = "block";
			} else {
				x.style.display = "none";
			}
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
					<form action="UserValidate" method="post">

						<div class="form-group">
							<label for="form_username">Username</label> <input
								class="form-control" placeholder="Enter Username" type="text"
								name="user" required> <span class="error_form"
								id="username_error_message"></span>
						</div>
						<div class="form-group">
							<label for="form_password">Password</label> <input
								class="form-control" placeholder="Enter Password"
								type="password" name="pass" required> <span
								class="error_form" id="password_error_message"></span>
						</div>
						<div>
							<input type="checkbox">
						</div>
						<div class="modal-footer">
							<button class="btn btn-primary" type="submit">Login</button>
							<button class="btn btn-primary" data-dismiss="modal">Close</button>
						</div>
					</form>


				</div>
				<div class="text-center">
					<p>
						Not Registered yet ? <a href="Registration.html">Register</a>
					</p>
				</div>
			</div>
		</div>
	</div>

</body>
</html>