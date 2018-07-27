<%@page import="com.scalar.web.userModelPack.Hotel"%>
<%@page import="java.util.ArrayList"%>

<%@page import="com.scalar.web.userModelPack.PropertiesList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<script src="js/AnimationJS.js"></script>	
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body class="mybackground">


<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<button type="button" class="navbar-toggle"
		data-toggle="collapse"
		data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			
		</button>
		<a href="#" class="navbar-brand"><img src="images\tropical (2).png"></a>
	  <a class="navbar-brand" href="#">Scalar Tour Guides</a>
		<div class="navbar-collapse collapse ">
			<ul class="nav navbar-nav navbar-right">
				
				<li><a href="Home.html">Home</a></li>
				<li><a href="#start">About Us</a></li>
				<li><a href="#">Services</a></li>
				<li><a href="About_Us.html">Team</a></li>
				<li><a href="#">Gallery</a></li>
				<li><a href="Contact_Us.html">Contact</a></li>
				<button class="btn btn-primary btn-sm pull-right "  data-toggle="modal" data-target="#loginModal">Sign In</button>
				
			</ul>
		
		
		</div>
		
			
							
		
	</div>
</nav>
<!---->

<br><br>

<%
	ArrayList<Hotel> newArrayList = (ArrayList<Hotel>)request.getAttribute("propertyList");

int count = newArrayList.size();
//GenaralProperty prop1 = newArrayList.get(0);

//out.println("<h1>TITLE "+prop1.getName()+"! </h1>");
%>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h2><%
				out.print(request.getAttribute("title"));
			%></h2>
			
			
		</div>
	</div>
	<br>
	<div class="row">
	<%
		for (int i = 0 ; i< count; i++) {
			Hotel prop = newArrayList.get(i);
			out.println("<div style='padding-bottom:40px' class='col-md-4'><div class='containers'>"+
			"<div><img src='" +prop.getPictureUrl() +"' alt='Avatar' class='image'>"+
			"<div class='overlay'>" +prop.getName() +"<br></small>"+"<p style='font-size:12px'>"+prop.getAddress()+
			"<br>"+prop.getCity()+"<br>"+prop.getWeb()+"<br>"+prop.getPhone()+"</p>"+
			"</div></div>"+
			"</div></div>");
		}
	%>
		<div class='col-md-4'>	
	<%	/*
		
		for(int i=0; i<count; i++){
		String a = 
			
				"<div class='containers'>"+
					
					"<div class='col-md-4'>"+
						
						"<img src='pics/star1.jpg' alt='Avatar' class='image'>"+
						"<div class='overlay'>Star Class Hotels"+
							"<br><small> NUgegoda</small>"+
							"<br><small>ncecnoencenclknflen</small>"+
							"<p style='font-size:10px'> name </p>"+
						"</div>"+
					"</div>"+
				
				
				"</div>"+
			"</div>";
		
		out.print(a);
	//	out.print(a);
		}
			
	*/	%>
		</div>
			
<!-- 	<div class="row">
			<div class="col-md-4">
				<div class="containers">
					
					<div>
						<a href="Registration.html">
						<img src="images/hotels_01.jpg" alt="Avatar" class="image"></a>
						<div class="overlay">Star Class Hotels</div>
					</div>
				
				
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="containers">

					<div>
						<a href="Registration.html">
						<img src="images/8.jpg" alt="Avatar" class="image"></a>
						<div class="overlay">Other Hotels</div>
					</div>

				</div>
			</div>
			
			<div class="col-md-4">
				<div class="containers">

					<div>
						<a href="Registration.html">
						<img src="images/ulagalla-room-feature.jpg" alt="Avatar" class="image"></a>
						<div class="overlay">Boutique Hotels</div>
					</div>

				</div>
			</div>
			
			<div class="col-md-4">
				<div class="containers">

					<div>
						<a href="Registration.html">
						<img src="images/ulagalla-room-feature.jpg" alt="Avatar" class="image"></a>
						<div class="overlay">Boutique Hotels</div>
					</div>

				</div>
			</div>
			

			
		
	</div> -->
		
</div>
<br>




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
