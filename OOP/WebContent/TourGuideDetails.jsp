<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page
	import="com.scalar.web.userModelPack.TourGuide,com.scalar.web.utilityPack.TourGuideDbUtil,java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/styleSheet.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">

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
	background-image: url("images/Peacock-bird-on-the-tree-wallpaper.jpg");
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

<body style="background-color: #63943F">



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
		<div class="overlay">Indian Peacock,Yala National Park</div>
	</div>


	<div class="container">
		<div class="row">
			<div class="col-md-9">

				<div class="row">

					<div class="col-md-12">
						<h1 style="color: #023871">Tour Guides</h1>
						<p style="color: #9CAFB5; font-size: 16px">
							<strong>Tourist guides</strong> provides the visitor with in
							depth knowledge in their mother tongue, smoothing creases and
							wrinkles that is bound to occur while touring a foreign country
							for the first time. It is best to choose a tourist guide who had
							been professionally trained and authorized by SriLanka Tourism,
							who are categorized as National Tourist Guides or Chauffeur
							Tourist Guides. The National Tourist Guides caters to a large
							group of tourists traveling in luxury coaches driven by reserved
							drivers while Chauffeur Tourist Guides would be guiding small
							groups conveyed in small vans and luxury cars.
						</p>
					</div>


				</div>
				<br>
				<div class="row">
					<div class="col-md-9">
						<!-- Error message is showing when results not found -->
						<c:if test="${empty TOUR_GUIDE_LIST}">
							<div class="well"
								style="height: 180px; width: 800px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.5); background-color: #B7950B">
								<h2>Not Found</h2>
								<p>Sorry,but you are lokking for something that it's not
									found</p>

							</div>
						</c:if>

						<%
							String cmd = (String) request.getAttribute("COMMAND");

							if (cmd != null) {
								if (cmd.equals("SEARCH")) {
									List<TourGuide> tourguide = (List<TourGuide>) request.getAttribute("TOUR_GUIDE_LIST");
									int size = tourguide.size();

									if (size != 0) {
						%>
						<div class="row"
							style="height: 30px; width: 800px; background-color: #34495E">

							<h5 style="color: white"><%=size%>
								matched results found
							</h5>



						</div>
						<%
							}
								}
							}
						%>

						<c:forEach var="tourguide" items="${TOUR_GUIDE_LIST}">
							<div class="row">
								<div class="well"
									style="height: 300px; width: 800px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.5); background-color: #B7950B">
									<div class="col-md-3">
										<img src="images/Office-Customer-Male-Dark-icon.png" />
									</div>
									<div class="col-md-6" style="margin-left: 120px;">
										<h4 style="color: black">${tourguide.firstName}</h4>
										<p style="color: #0B6E60">Category:${tourguide.category}</p>
										<p style="color: #0B516E">Languages:${tourguide.language_1},${tourguide.language_2},${tourguide.language_3},${tourguide.language_4},${tourguide.language_5}</p>
										<p style="color: #0B6E60">Telephone:${tourguide.telephone}</p>
										<p style="color: #0B516E">Address:${tourguide.address}</p>
										<p style="color: #0B6E60">Email:${tourguide.emailAddress}</p>
										<p style="color: #0B516E">Registration No:${tourguide.id}</p>
										<p style="color: #0B6E60">Expiary
											Date:${tourguide.expDate}</p>

									</div>

								</div>

							</div>
						</c:forEach>


					</div>
				</div>
				<div class="row">
					<div
						style="height: 100px; width: 540px; background-color: #63943F; margin-left: 135px">
						<%--For displaying Previous link except for the 1st page --%>

						<%--For displaying Page numbers. 
					    The when condition does not display a link for the current page--%>
						<table>
							<tr>
								<c:if test="${currentPage == 0 || currentPage == null }">
									<form action="TourGuideControllerServlet" method="get">
										<input type="hidden" name="command" value="LIST" /> <input
											type="hidden" name="destination" value="TourGuideDetails.jsp" />
										<input type="hidden" name="page" value="1" />
										<button class="btn btn-lg btn-danger" type="submit">Back</button>
									</form>&nbsp;
					        	</c:if>
								<c:if test="${currentPage > 1}">
									<form action="TourGuideControllerServlet" method="get">
										<input type="hidden" name="command" value="LIST" /> <input
											type="hidden" name="destination" value="TourGuideDetails.jsp" />
										<input type="hidden" name="page" value="${currentPage - 1}" />
										<button class="btn btn-lg btn-danger" type="submit">Previous</button>
									</form>&nbsp;
						       	</c:if>

								<c:forEach begin="1" end="${noOfPages}" var="i">
									<c:choose>
										<c:when test="${currentPage eq i}">
											<form action="TourGuideControllerServlet" method="get">
												<input type="hidden" name="command" value="LIST" /> <input
													type="hidden" name="destination"
													value="TourGuideDetails.jsp" /> <input type="hidden"
													name="page" value="${i}" />
												<button class="btn btn-lg btn-warning active" type="submit">${i}</button>
											</form>
										</c:when>
										<c:otherwise>
											<form action="TourGuideControllerServlet" method="get">
												<input type="hidden" name="command" value="LIST" /> <input
													type="hidden" name="destination"
													value="TourGuideDetails.jsp" /> <input type="hidden"
													name="page" value="${i}" />
												<button class="btn btn-lg btn-primary" type="submit">${i}</button>
											</form>

										</c:otherwise>
									</c:choose>
								</c:forEach>

								<%--For displaying Next link --%>
								<c:if test="${currentPage lt noOfPages}">
							    	&nbsp;<form action="TourGuideControllerServlet" method="get">
										<input type="hidden" name="command" value="LIST" /> <input
											type="hidden" name="destination" value="TourGuideDetails.jsp" />
										<input type="hidden" name="page" value="${currentPage + 1}" />
										<a href="TourGuideDetails.jsp?page=${currentPage + 1}"
											type="button"><button class="btn btn-lg btn-success"
												type="submit">Next</button></a>
									</form>

								</c:if>
							</tr>
						</table>


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