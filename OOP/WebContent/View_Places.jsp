
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page
	import="com.scalar.web.userModelPack.Places,com.scalar.web.utilityPack.TourGuideDbUtil,java.util.List"%>
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
	background-image:
		url("images/shutterstock_302376269-e1505712197992.jpg");
	/* Full height */
	height: 550px;
	/* Center and scale the image nicely */
	background-repeat: no-repeat;
	background-size: cover;
}

.overlay {
	position: absolute;
	bottom: 183px;
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
<body style="background-color: #9D7F65">

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
		<div class="overlay">Sri Lankan Leopard,Yala National Park</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-9">

				<div class="row">

					<div class="col-md-12">
						<h1 style="color: white">Tourist Attractions in Sri Lanka</h1>
						<p style="color: black; font-size: 16px">
							<strong>Sri Lanka</strong> is also a land of staggering contrast
							and spectacular beauty due to its compactness.Along the coast,
							visitors can explore amazing beaches, safari tours, guided walks
							through ancient cities, experience the culture and bit of modern
							Sri Lanka.We welcome you to find your unique Sri Lankan travel
							experience.
						</p>
					</div>


				</div>

				<div class="row">
					<div class="col-md-12">
						<!-- Error message is showing when results not found -->
						<c:if test="${empty PLACES_LIST}">
							<div class="well"
								style="height: 180px; width: 800px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.5); background-color: #B7950B">
								<h2>Not Found</h2>
								<p>Sorry,but you are lokking for something that it's not
									found</p>

							</div>
						</c:if>
						<c:if test="${not empty COMMAND}">


							<div class="row"
								style="height: 30px; width: 800px; background-color: #34495E">

								<h5 style="color: white">${NO_OF_RESULTS} matched results
									found</h5>



							</div>


						</c:if>


						<div class="row">
							<c:forEach var="places" items="${PLACES_LIST}">

							<!-- set up link to update for each student -->
							<c:url var="showPlacelink" value="PlacesControllerServlet">
								<c:param name="command" value="LOAD_THE_PLACE" />
								<c:param name="destination" value="View_Place_Details.jsp" />
								<c:param name="place_id" value="${places.getP_image_ID() }" />
							</c:url>


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




							</c:forEach>

						</div>
					</div>
				</div>
				<div class="row">
					<div
						style="height: 100px; width: auto; background-color: #9D7F65; margin-left: 135px">
						<%--For displaying Previous link except for the 1st page --%>

						<%--For displaying Page numbers. 
					    The when condition does not display a link for the current page--%>
						<table>
							<tr>
								<c:if test="${currentPage == 0 || currentPage == null }">
									<form action="PlacesControllerServlet" method="get">
										<input type="hidden" name="command" value="LIST" /> <input
											type="hidden" name="destination" value="View_Places.jsp" />
										<input type="hidden" name="page" value="1" />
										<button class="btn btn-lg btn-danger" type="submit">Back</button>
									</form>&nbsp;
					        	</c:if>
								<c:if test="${currentPage > 1}">
									<form action="PlacesControllerServlet" method="get">
										<input type="hidden" name="command" value="LIST" /> <input
											type="hidden" name="destination" value="View_Places.jsp" />
										<input type="hidden" name="page" value="${currentPage - 1}" />
										<button class="btn btn-lg btn-danger" type="submit">Previous</button>
									</form>&nbsp;
						       	</c:if>

								<c:forEach begin="1" end="${noOfPages}" var="i">
									<c:choose>
										<c:when test="${currentPage eq i}">
											<form action="PlacesControllerServlet" method="get">
												<input type="hidden" name="command" value="LIST" /> <input
													type="hidden" name="destination" value="View_Places.jsp" />
												<input type="hidden" name="page" value="${i}" />
												<button class="btn btn-lg btn-warning active" type="submit">${i}</button>
											</form>
										</c:when>
										<c:otherwise>
											<form action="PlacesControllerServlet" method="get">
												<input type="hidden" name="command" value="LIST" /> <input
													type="hidden" name="destination" value="View_Places.jsp" />
												<input type="hidden" name="page" value="${i}" />
												<button class="btn btn-lg btn-primary" type="submit">${i}</button>
											</form>

										</c:otherwise>
									</c:choose>
								</c:forEach>

								<%--For displaying Next link --%>
								<c:if test="${currentPage lt noOfPages}">
							    	&nbsp;<form action="TourGuideControllerServlet" method="get">
										<input type="hidden" name="command" value="LIST" /> <input
											type="hidden" name="destination" value="View_Places.jsp" />
										<input type="hidden" name="page" value="${currentPage + 1}" />
										<a href="View_Places.jsp?page=${currentPage + 1}"
											type="button"><button class="btn btn-lg btn-success"
												type="submit">Next</button></a>
									</form>

								</c:if>
							</tr>
						</table>

					</div>
				</div>

			</div>



			<div class="col-md-3 fixed" style="margin-top: 30px">
				<div class="panel panel-warning">
					<div class="panel-heading">
						<h4>Search Portal</h4>
					</div>
					<div class="panel-body">

						<form action="PlacesControllerServlet" method="get">

							<input type="hidden" name="command" value="SEARCH" /> <input
								type="hidden" name="destination" value="View_Places.jsp" />
							<div class="form-group">
								<label for="InputUserName">Search by:</label> <select
									class="form-control" title="Select search category"
									name="category">
									<option selected disabled>Select an Option</option>
									<option>Place Name</option>
									<option>City</option>
									<option>Category</option>


								</select>

							</div>

							<div class="form-group">

								<label for="InputPassword">Keyword:</label> <input
									class="form-control" placeholder="Search here...." type="text"
									name="key" required>
							</div>
							<div class="modal-footer">

								<button class="btn btn-warning" type="submit">Search</button>

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