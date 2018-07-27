<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Scalar Inc 2018</title>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/styleSheet.css" rel="stylesheet" type="text/css">

<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<script src="js/Validate.js"></script>

<style>
body, html {
	height: 100%;
	font-family: Arial;
}

.bg {
	/* The image used */
	background-image: url("images/bADULLA.jpg");
	/* Full height */
	height: 100%;
	width: 100% /* Center and scale the image nicely */
    
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

<body style="background-color: #0E1420">


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

	<div class="bg"
		style="margin-bottom: 20px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.5); height: 500px">

		<div class="overlay">Sunrise,Badulla</div>

	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1 style="color: #F3F5F7">Welcome to Tour Planning System</h1>
				<p style="color: #9CAFB5; font-size: 16px">
					<strong>Tourist guides</strong> provides the visitor with in depth
					knowledge in their mother tongue, smoothing creases and wrinkles
					that is bound to occur while touring a foreign country for the
					first time. It is best to choose a tourist guide who had been
					professionally trained and authorized by SriLanka Tourism, who are
					categorized as National Tourist Guides or Chauffeur Tourist Guides.
					The National Tourist Guides caters to a large group of tourists
					traveling in luxury coaches driven by reserved drivers while
					Chauffeur Tourist Guides would be guiding small groups conveyed in
					small vans and luxury cars.
				</p>
			</div>


		</div>


	</div>




	<div class="container">
	<c:if test="${not empty WalertMsg}">
			<div id="alertBox" class="alert alert-danger">
				<a class="close" data-dismiss="alert">&times;</a>
				<P>${WalertMsg}
				<P>
			</div>
		</c:if>

		<c:if test="${not empty SalertMsg}">
			<div id="alertBox" class="alert alert-success">
				<a class="close" data-dismiss="alert">&times;</a>
				<P>${SalertMsg}
				<P>
			</div>
		</c:if>
		<form class="form-horizontal" action="TourPlanningServlet" method="post">
			<input type="hidden" name="command" value="ADD"/>
			<div class="form-group form-group-sm">

				<!-- left column -->
				<div class="col-sm-6">
					<div class="well">
						<p class="lead">Personal Details</p>
						<div class="form-group">
							<label for="new_name" class="col-sm-2 control-label"><font Style="color:red">*</font>Title</label>
							<div class="col-sm-4">
								<select class="form-control" title="Select Your Country"
									name="title" required>
									<option selected disabled>Select Your Title</option>
									<option>Mr.</option>
									<option>Mrs.</option>
									<option>Ms.</option>
									<option>Hon.</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="new_subname" class="col-sm-2 control-label"><font Style="color:red">*</font>Full
								Name</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="fullname"
									placeholder="Enter Your Full Name" required/>
							</div>
						</div>
						<div class="form-group">
							<label for="new_name" class="col-sm-2 control-label"><font Style="color:red">*</font>Country</label>
							<div class="col-sm-10">
								<select class="form-control" title="Select Your Country"
									name="country">
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
						</div>
						<div class="form-group">
							<label for="new_subname" class="col-sm-2 control-label"><font Style="color:red">*</font>Nationality</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="nationality"
									placeholder="Example:American" required>
							</div>
						</div>
						<div align="right">(<font Style="color:red">*</font>)required</div>
						
					</div>
					<div class="well">
						<p class="lead">Contact Details</p>
						<div class="form-group">
							<label for="new_address" class="col-sm-2 control-label"><font Style="color:red">*</font>Email</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="email"
									placeholder="Example:ABC@gmail.com" required>
							</div>
						</div>
						<div class="form-group">
							<label for="new_addresssub" class="col-sm-2 control-label"><font Style="color:red">*</font>Phone
								No </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="phone_no"
									placeholder="Enter Your Contact number here" required>
							</div>
						</div>
						<div align="right">(<font Style="color:red">*</font>)required</div>
					</div>
					<div class="well">
						<p class="lead">Transportation Details</p>
						<div class="well">
						<div class="form-group">
							
							<div class="col-sm-12">
								<input type="radio"  name="transport"  value="Train" onclick="otherCheck();" />Train&nbsp;&nbsp;&nbsp;&nbsp;
								 <input type="radio" name="transport" value="Bus" onclick="otherCheck();"/>Bus&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio"  name="transport" value="Van" onclick="otherCheck();"/>Van&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio"  name="transport" value="Other" id="other" onclick="otherCheck()" />Other
								<br>
								<div  id="otherYes" style="display: none">
									<input class="form-control" name="other" type="text" placeholder="Enter preffered Transportation method here"/> 
								</div>
							</div>
							</div>
						</div>
						<div align="right">(<font Style="color:red">*</font>)required</div>
					</div>
					<div class="well">
						<p class="lead">Tour Guide Details</p>
						<p class="col-sm-12">
							Select a Tour Guide You Prefer(<font Style="color:red">Or leave blanks
								in this section We'll assign a reputed tour guide for you</font>)
						</p>

						<p>Please refer <a href="TourGuideControllerServlet?page=1&command=LIST&destination=TourGuideDetails.jsp"><font Style="color:blue">this</font></a> to fill this section
						<div class="form-group">


							<div class="col-sm-10">
								<select class="form-control" title="Select Your Country" name="tourguide_options">
									<option selected disabled>Select By</option>
									<option>Tour Guide ID</option>
									<option>Name</option>
									<option>Languages</option>
								</select>
							</div>


							<div class="col-sm-10">
								<br> <input type="text" class="form-control" name="keyword" placeholder="Enter Keyword here...">
							</div>
						</div>
					</div>
				</div>





				<!-- right column -->
				<div class="col-sm-6">
					<div class="well">
						<p class="lead">Travel Details</p>
						<div class="well">
							<div class="form-group">
								<label for="new_company_identity" class="col-sm-2 control-label"><font Style="color:red">*</font>Arrival
									Date</label>
								<div class="col-sm-4">
									<input class="form-control" type="date" name="arrival_date"
										min="2018-05-01" max="2018-08-30" required>
								</div>
								<label for="new_bol_require" class="col-sm-2 control-label"><font Style="color:red">*</font>Depature
									Date</label>
								<div class="col-sm-4">
									<input class="form-control" type="date" name="depature_date"
										min="2000-01-02" required>
								</div>
							</div>

							<div class="form-group"></div>
							<div class="form-group">
								<label for="new_pod_require" class="col-md-4 control-label"><font Style="color:red">*</font>Number
									of nights</label>
								<div class="col-sm-2">
									<div class="input-group">
										<input class="form-control" type="number" name="no_nights"
											required>
									</div>
								</div>
							</div>
						</div>
						<div class="well">
							<p>
								<strong>Number of Persons</strong>
							</p>
							<div class="form-group">

								<label for="new_discount" class="col-sm-4 control-label"><font Style="color:red">*</font>Number
									of Adults</label>
								<div class="col-sm-2">
									<div class="input-group">
										<input class="form-control" type="number" name="no_adults" required>
									</div>
								</div>
								<label for="new_discount" class="col-sm-4 control-label"><font Style="color:red">*</font>Number
									of Children</label>
								<div class="col-sm-2">
									<div class="input-group">
										<input class="form-control" type="number" name="no_childs" required>
									</div>
								</div>
							</div>


						</div>
						<div class="well">
							<p>
								<strong>Please specify your interest transportation
									method</strong>
							</p>
							<div class="form-group">

								<div class="col-sm-12">
									<input type="checkbox" name="Beach_Holiday" />Beach
									Holiday&nbsp; <input type="checkbox" name="Beach_Holiday" />Beach
									Holiday&nbsp; <input type="checkbox" name="Beach_Holiday" />Beach
									Holiday&nbsp; <input type="checkbox" name="Beach_Holiday" />Beach
									Holiday&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
										type="checkbox" name="Beach_Holiday" />Beach Holiday&nbsp;
								</div>
							</div>
						</div>
						<div class="well">
							<p>
								<strong>Interest Travel Region</strong>
							</p>
							<div class="form-group form-group-sm">

								<div class="col-sm-12">
									<textarea type="text" class="form-control" name="regions"
										placeholder=""></textarea>
								</div>
							</div>
							<p>
								<strong>Special Requirements</strong>
							</p>
							<div class="form-group form-group-sm">

								<div class="col-sm-12">
									<textarea type="text" class="form-control" name="requirements"
										placeholder=""></textarea>
								</div>
							</div>
							<p>
								<strong>Additional Comments</strong>
							</p>
							<div class="form-group form-group-sm">

								<div class="col-sm-12">
									<textarea type="text" class="form-control" name="comments"
										placeholder=""></textarea>
								</div>
							</div>
							<p>
								<strong><font Style="color:red">*</font>Approximate Overall Budget</strong>
							</p>
							<div class="form-group form-group-sm">

								<div class="col-sm-6">
									<div class="input-group">
										<span class="input-group-addon">$</span><input type="text"
											class="form-control" name="budget" placeholder="" required />
									</div>
								</div>
							</div>

						</div>
						<div align="right">(<font Style="color:red">*</font>)required</div>
					</div>
				</div>



			</div>
			<div class="modal-footer">


				<div class="col-md-8">
					<div class="input-group">

						<input type="checkbox" name="confirmation" />&nbsp;<font Style="color:white">I confirm that
						the information given in this form is true, complete and accurate.</font>
					</div>
				</div>

				<button id="registerBtn" class="btn btn-primary" type="submit">Submit</button>
				<button class="btn btn-primary" type="reset">Reset</button>
			</div>

		</form>
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
							<label for="InputUserName">Username</label> <input
								class="form-control" placeholder="Enter Username" type="text"
								name="user">
						</div>
						<div class="form-group">
							<label for="InputPassword">Username</label> <input
								class="form-control" placeholder="Enter Password"
								type="password" name="pass">
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


	<script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/bootstrap.js"></script>



	<script type="text/javascript">
		setTimeout(function() {
			$('#alertBox').hide('fade');
		}, 4000);

		function PW_Validate() {
			var pass = document.getElementById("password").value;
			var con_pass = document.getElementById("con_password").value;

			if (pass == con_pass) {

				return true;
			} else {
				alert("Passwords didn't matched");

				return false;
			}
		}
		
		function otherCheck() {
		    if (document.getElementById('other').checked) {
		        document.getElementById('otherYes').style.display = 'block';
		    }
		    else document.getElementById('otherYes').style.display = 'none';

		}
	</script>
	
	</body>
</html>