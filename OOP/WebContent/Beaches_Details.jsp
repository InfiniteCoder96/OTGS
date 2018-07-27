<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/styleSheetOrg.css" rel="stylesheet">
<link rel="stylesheet" href="/maps/documentation/javascript/demos/demos.css">
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/Validate.js"></script>
<link href="css/nature.css" rel="stylesheet">


<style>
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
<body class="mybackground">



	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>

		</button>
		<a href="#" class="navbar-brand"><img
			src="images\tropical (2).png"></a> <a class="navbar-brand" href="#">Scalar
			Tour Guides</a>

		<div class="navbar-collapse collapse ">
			<c:choose>
				<c:when test="${not empty sessionScope.user}">
					<c:if test="${sessionScope.user == admin}">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="Home.jsp">Home</a></li>
							<li><a href="#start">News</a></li>
							<li><a href="About_Us.html">About Us</a></li>
							<li><a href="Gallery.html">Gallery</a></li>
							<li><a href="Contact_Us.jsp">Contact</a></li>
							<a href="http://localhost:8080/OOP/LogOut.jsp"><button
									class="btn btn-primary btn-sm  " type="button">Sign
									Out</button></a>&nbsp;&nbsp;&nbsp;
							<a href="http://localhost:8080/OOP/Admin_Dashboard.jsp"><button
									class="btn btn-primary btn-sm pull-right" type="button">
									Hi, ${sessionScope.user}</button></a>
						</ul>
					</c:if>
					<c:if test="${sessionScope.user != admin}">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="Home.jsp">Home</a></li>
							<li><a href="#start">News</a></li>
							<li><a href="About_Us.html">About Us</a></li>
							<li><a href="Gallery.html">Gallery</a></li>
							<li><a href="Contact_Us.jsp">Contact</a></li>
							<a href="http://localhost:8080/OOP/LogOut.jsp"><button
									class="btn btn-primary btn-sm  " type="button">Sign
									Out</button></a>&nbsp;&nbsp;&nbsp;
							<a href="http://localhost:8080/OOP/WelcomeUser.jsp"><button
									class="btn btn-primary btn-sm pull-right" type="button">
									Hi, ${sessionScope.user}</button></a>
						</ul>
					</c:if>
				</c:when>
				<c:otherwise>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="Home.jsp">Home</a></li>
						<li><a href="#start">Join Us</a></li>
						<li><a href="About_Us.html">About Us</a></li>
						<li><a href="Gallery.html">Gallery</a></li>
						<li><a href="Contact_Us.jsp">Contact</a></li>
						<button class="btn btn-primary btn-sm pull-right "
							data-toggle="modal" data-target="#loginModal">Sign In</button>
					</ul>
				</c:otherwise>
			</c:choose>

		</div>
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
						<h1 style="color: #023871">Tour Guides</h1>
						<p>
							With nearly 1600 km of of palm fringed Coastline baked to
							perfection surrounding the country Sri Lanka is the ideal
							destination for beach bums worldwide. May it be windsurfing,
							kayaking, yachting, water skiing, scuba diving or jut lazing
							around for the perfect tan, Sri Lanka offers it all. <br /> <br />
							The two monsoon winds providing rain to the two corners of the
							country at various periods, makes Sri Lanka’s beach holiday a
							year round prospect. The north east winds make the south western
							coast sunny and the sea calm from November to March. The South
							West winds make the East Coast waters quiet with the constant sun
							shine happily in agreement. &nbsp;&nbsp;
						</p>
						<p style="text-align: justify;">The best of the Southern
							beaches include Tangalla, Beruwala, Mirissa, Bentota and
							Unawatuna with varying options including chic boutique hotels,
							glowing coral reefs, gentle sandbars and undiscovered corners of
							paradise.</p>
						<p style="text-align: justify;">Although Sri Lanka’s southern
							beaches has been long discovered by the international traveller
							the east coast is yet to be fully discovered. The most known
							among the Eastern beaches is the Arugam Bay, the high church of
							surfing enthusiasts’ in the region. Once a mere rumour, Uppuveli
							beach is also open to the sun seekers after a three decade long
							civil war.</p>
						<p style="text-align: justify;">On the Western corner of the
							country to the north of Colombo is the Negambo lagoon. Its
							beaches, an old favourite with local and foreign visitors and
							lagoon famed for lobster harvesting. Despite having a ring of
							sandy beaches surrounding the country, Galle Face Green, a half a
							kilometre stretch between Galle Road and Indian Ocean is the
							playground of the Colombians.</p>
					</div>


				</div>

			</div>
			<div class=col-md-3">
				<div class="right-b">
					<h3>Plan Your Visit</h3>
					<li>Suggested Itineraries</li>
					<li>Book Your Holiday Now</li>
					<li>Online Services</li>
					<li>Travel Agents</li>
					<li>Accommodation</li>
					<li>Transport</li>
					<li>Tour Guides</li>
					<li>Events</li>
					<li>Visitor's Say</li>
					<li>Attractions</li>
					<li>Contact Us</li>

				</div>
			</div>

		</div>
		<div class="row">
			<div class="col-md-7">
				
			<iframe
				src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d2222937.427231049!2d80.74920264101597!3d7.822485734591139!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2slk!4v1524241487358"
				width="800" height="650" frameborder="0" style="border: 0"
				allowfullscreen></iframe>
				
			</div>
			<div class="col-md-5">
				
				<div class="img-gly" >
				<h4 style="color: #023871">Gallery</h4>
			<div class="gallery">
				<a target="_blank" href="images/beach1.jpg"> <img
					src="images/beach1.jpg" alt="wild1" width="150" height="100">
				</a>

			</div>

			<div class="gallery">
				<a target="_blank" href="images/beach2.jpg"> <img
					src="images/beach2.jpg" alt="wild2" width="150" height="100">
				</a>

			</div>

			<div class="gallery">
				<a target="_blank" href="images/beach3.jpg"> <img
					src="images/beach3.jpg" alt="wild3" width="150" height="100">
				</a>

			</div>

			<div class="gallery">
				<a target="_blank" href="images/beach4.jpg"> <img
					src="images/beach4.jpg" alt="wild4" width="150" height="100">
				</a>

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
					
						<ul><a>Tour Planning</a></ul>
						<ul><a>Hotel Reservation</a></ul>
						<ul><a>Transportation Reservation</a></ul>
						<ul><a>Hire Tour Guide</a></ul>
					
						
			</div>
			<div class="col-xs-3 col-md-3">
				<h3>Our Partners</h3>
					
						<ul><a>Tour Planning</a></ul>
						<ul><a>Hotel Reservation</a></ul>
						<ul><a>Transportation Reservation</a></ul>
						<ul><a>Hire Tour Guide</a></ul>
					
						
			</div>
			
			<div class="col-xs-3 col-md-3">
			  <h3>About the site</h3>
					
						<ul><a>Terms of Use</a></ul>
						<ul><a>Site Map</a></ul>
						<ul><a>Subscribe</a></ul>
						<ul><a>Contact US</a></ul>
					
						
			</div>
			<div class="col-xs-3 col-md-3">
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


<script type="text/javascript">

   
   
   
    setTimeout(function(){;},<%= session.getMaxInactiveInterval() - 60*1000 %>);
    
    setTimeout(function(){
		$('#alertBox').hide('fade');
	},2000);
    
  
	function myFunction() {
	    var x = document.getElementById("password");
	    if (x.type === "password") {
	        x.type = "text";
	    } else {
	        x.type = "password";
	    }
	}
	
</script>

<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.js"></script>


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
						<div class="input-group">
							
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							<input class="form-control" placeholder="Enter Username" type="text" name="user"  required/>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							
							<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
							<input class="form-control" placeholder="Enter Password" type="password" name="pass" id="password" required/>
							
						</div>
					</div>
					<div>
					
						<div>
							<input type="checkbox" onclick="myFunction()"/>&nbsp;Show Password</li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="checkbox" onclick="">&nbsp;Remember Me
						</div>
						
						
						
					</div>
					<div class="modal-footer">
						<div>
								
								<a href="Email_Confirmation.jsp" >Forget Password</a>
						</div>
							<div>
							
						</div>
						<button class="btn btn-primary" type="submit">Login</button>
						<button class="btn btn-primary" data-dismiss="modal">Close</button>
					</div>
				</form>
			
			
			</div>
			<div class="text-center">
				<p>Not Registered yet ?		<a href="Registration.jsp">Register</a></p>
			</div>
		</div>
	</div>
</div>



		

		
</body>
</html>