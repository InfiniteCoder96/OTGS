<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Scalar Inc 2018</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/styleSheetOrg.css" rel="stylesheet">
<link rel="stylesheet" href="css/animate.min.css">	
<link rel="stylesheet" href="css/templatemo-style.css">		
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<style>

	body, html {
    	height: 100%;
    	font-family: Arial;
	}

	.bg { 
    /* The image used */
    	background-image:url("images/srilankacroped.jpg");

    /* Full height */
    height: 100%; 
	width:100%
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
	  opacity:0;
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

<body style="background-color:		#426871">


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
	<div class="overlay">Temple of the Tooth Relic(Sri Dalada Maligawa),Kandy</div>
</div>

<div class="container">
	<div class="row">
		<div calss="col-sm-8 col-md-12">
			<h1 style="color:#023871">Flight Information</h1>
			<p style="color:#9CAFB5;font-size:16px">Scalar Industries together with the 
			Sri Lanka Tourism,Sri Lankan Airlines 
			and Mihin Lanka provides the online 
			booking of flights to Sri Lanka for 
			convenience of the travelers. Please 
			use the following booking engines to 
			book your flight to Sri Lanka.</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			
			<div id="accordion" class="panel-group">
				
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">
							<a href="#panelBodyOne" data-toggle="collapse" data-parent="#accordion">
								INTERNATIONAL FLIGHTS (Sri Lankan Airlines)
							</a>
						</h3>
					</div>
					<div id="panelBodyOne" class="panel-collapse collapse" >
						<div class="panel-body">
							<p style="color:black">SriLankan Airlines, the National Airline of Sri Lanka, is an award winning carrier with a firm reputation as a global leader in service, comfort, safety, reliability and punctuality. The airline's hub is located at Bandaranaike International Airport in Colombo, providing convenient connections to its global route network of 60 destinations in 33 countries in Europe, the Middle East, South Asia, Southeast Asia, the Far East, North America and Australia.</p>
							<ul >
								<div class="row">
									<div class="navbar-text ">
										<p style="color:midnightblue"><i class="glyphicon glyphicon-earphone"></i> Within Sri Lanka <b>1979</b></p>
									</div>
									<div class="navbar-text">
										<p style="color:midnightblue"><i class="glyphicon glyphicon-earphone"></i> From outside Sri Lanka<b> + 94 77777 1979 </b></p>
									</div>
									<div class="navbar-text">
										<a style="color:midnightblue" href="https://www.srilankan.com/en_uk/lk"><i class="glyphicon glyphicon-globe"></i> www.srilankan.lk</a>
									</div>


								</div>
  							
    						</ul>
						</div>
					</div>
				</div>
				<br>
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">
							<a href="#panelBodyTwo" data-toggle="collapse" data-parent="#accordion">
								DOMESTIC FLIGHTS
							</a>
						</h3>
					</div>
					<div id="panelBodyTwo" class="panel-collapse collapse" >
						
						<div class="panel-body">
						
							<h4 style="color:black">FALCON AIR</h4>
							<p style="color:midnightblue">A Domestic Airline offering daily schedule flights from Bandaranaike International Airport (Colombo International Air Port) to the island’s most picturesque locations. This mode of transport gives you a bird’s eye view of beautiful Sri Lanka, while significantly cutting down your surface travel time.</p>
							<ul >
							<br>
								<div class="row">
									<div class="navbar-text ">
										<p style="color:midnightblue"><i class="glyphicon glyphicon-earphone"></i> Within Sri Lanka <b>1979</b></p>
									</div>
									<div class="navbar-text">
										<p style="color:midnightblue"><i class="glyphicon glyphicon-earphone"></i> From outside Sri Lanka<b> + 94 77777 1979 </b></p>
									</div>
									<div class="navbar-text">
										<a style="color:midnightblue" href="https://www.srilankan.com/en_uk/lk"><i class="glyphicon glyphicon-globe"></i> www.srilankan.lk</a>
									</div>


								</div>
  							
    						</ul>
							
							<div class="well">
								<form action="#" method="post">
									<h3 style="color:lawngreen" align="center">Book a Flight</h3>
									<hr>
									<ul >
										<div class="row">
											<div class="col-md-8">
												<div class="navbar-text ">
													<div class="form-group" style="color: black">
														<input type="radio" name="user">
														<label for="InputUserName">One-Way</label>
													</div>
												</div>
												<div class="navbar-text">
													<div class="form-group" style="color: black">
														<input type="radio" name="user">
														<label for="InputUserName">Round-Trip</label>
													</div>
												</div>
											</div>
										</div>
  							
    								</ul>
									<ul>
										<div class="row">
											<div class="navbar-text ">
												<div class="form-group" style="color: black">
													<label for="InputUserName">DEPART</label>
													<input type="date" name="bday" min="2000-01-02">
												</div>
											</div>
											<div class="navbar-text ">
												<div class="form-group" style="color: black">
													<label for="InputUserName">RETURN</label>
													<input type="date" name="bday" min="2000-01-02">
												</div>
											
											</div>
										</div>
									</ul>
									<ul>
										<div class="row">
											<div class="navbar-text ">
												<div class="form-group ">
				
													<label style="color:black">FROM</label>
													<select class="form-control" title="Select Your Country" name="country" >
														<option selected disabled>Select Your Depature Location</option>
														<option value="Sri Lanka">Sri Lanka</option>
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
											<div class="navbar-text ">
												<div class="form-group ">
				
													<label style="color:black">TO</label>
													<select class="form-control" title="Select Your Country" name="country" >
														<option selected disabled>Select Your Arrival Location</option>
														<option value="Sri Lanka">Sri Lanka</option>
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
										</div>
									</ul>
									<ul>
										<div class="row">
											<div class="navbar-text ">
												<div class="form-group ">
				
													<label style="color:black">ADULTS</label>
													<select class="form-control" title="Select Your Country" name="country" >
														<option selected disabled>No. of Adults</option>
														<option value="Sri Lanka">1</option>
														<option>2</option>
														<option>3</option>
														<option>4</option>
														<option>5</option>
														<option>6</option>
														<option>7</option>
														<option>8</option>
													</select>
					
												</div> 
										
											</div>
											<div class="navbar-text ">
												<div class="form-group ">
				
													<label style="color:black">CHILDREN</label>
													<select class="form-control" title="Select Your Country" name="country" >
														<option selected disabled>No. of Children</option>
														<option value="Sri Lanka">1</option>
														<option>2</option>
														<option>3</option>
														<option>4</option>
														<option>5</option>
														
													</select>
					
												</div> 
										
											</div>
											<div class="navbar-text ">
												<div class="form-group ">
				
													<label style="color:black">INFANTS</label>
													<select class="form-control" title="Select Your Country" name="country" >
														<option selected disabled>No. of Infants</option>
														<option value="Sri Lanka">1</option>
														<option>2</option>
														<option>3</option>
														
													</select>
					
												</div> 
										
											</div>
										</div>
									</ul>
										
									
									<div class="modal-footer">
											<button class="btn btn-primary" type="submit">BOOK NOW</button>
											<button class="btn btn-primary" type="reset">RESET</button>
									</div>
								</form>
								
								
							</div>
							
							
							<hr style="border-color: darkblue">
							
							<h4 style="color:black">SIMPLIFLY</h4>
							<p style="color:midnightblue">Simplifly is Sri Lanka’s leading internal airline and the only airline in Sri Lanka that operates helicopters, planes and sea planes.In operation since 2004 and with over 26,000 passengers flown (and counting), our experience and expertise is unmatched by any other domestic airline.Starting with our meet and greet services on your arrival, our team will ensure you are swiftly transferred in exquisite comfort and safety to your final destination within Sri Lanka - whether it’s an airport transfer to your resort, a site visit for your business or a fun excursion flight.</p>
							<ul >
								<div class="row">
									<div class="navbar-text ">
										<p style="color:midnightblue"><i class="glyphicon glyphicon-earphone"></i> Within Sri Lanka <b>1979</b></p>
									</div>
									<div class="navbar-text">
										<p style="color:midnightblue"><i class="glyphicon glyphicon-earphone"></i> From outside Sri Lanka<b> + 94 77777 1979 </b></p>
									</div>
									<div class="navbar-text">
										<a style="color:midnightblue" href="https://www.srilankan.com/en_uk/lk"><i class="glyphicon glyphicon-globe"></i> www.srilankan.lk</a>
									</div>


								</div>
  							
    						</ul>
    						
							<hr style="border-color: darkblue">
							
							<h4 style="color:black">HELITOURS</h4>
							<p style="color:midnightblue">Helitours is the commercial flying arm of the Air Force which was inaugurated in 1972. Helitours is a venture established as a company under the companies act. For public resources the relevant disbursements are credited to the public coffers and a percentage of the proceeds are channeled to foster welfare/rehabilitation of Air Force personnel. This is another project that nurtures the nation building partnership of the government’s post-conflict tourism promotion initiatives connecting the North/East in the government’s overall development strategy of development of an aviation hub in Sri Lanka.</p>
							<ul >
								<div class="row">
									<div class="navbar-text ">
										<p style="color:midnightblue"><i class="glyphicon glyphicon-earphone"></i> Within Sri Lanka <b>1979</b></p>
									</div>
									<div class="navbar-text">
										<p style="color:midnightblue"><i class="glyphicon glyphicon-earphone"></i> From outside Sri Lanka<b> + 94 77777 1979 </b></p>
									</div>
									<div class="navbar-text">
										<a style="color:midnightblue" href="https://www.srilankan.com/en_uk/lk"><i class="glyphicon glyphicon-globe"></i> www.srilankan.lk</a>
									</div>


								</div>
  							
    						</ul>
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
		
 </div> 
 
<div  style="width: 100%; background-color: brown; color: azure" align="center">

	<p >© 2018 All Rights Reserved by Scalar Industries</p>
	<p>Powered By:<a href="#">Scalar Tech</a></p>

</div>
	
	

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.js"></script>

<script src="js/jquery-1.11.3.min.js"></script>
	<script src="js/bootstrap.js"></script>

	<script>
		setTimeout(function() {
			$('#alertBox').hide('fade');
		}, 2000);

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


	</div>
</body>
</html>
