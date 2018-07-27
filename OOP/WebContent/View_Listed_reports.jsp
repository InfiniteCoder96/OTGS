<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Scalar Inc 2018</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/animate.min.css">	
<link rel="stylesheet" href="css/templatemo-style.css">	
<link href="css/styleSheet.css" rel="stylesheet">

	
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<style>

.bg {
	/* The image used */
	background-image: url("images/38825695-tech-wallpapers.jpg");
	/* Full height */
	width: 100%;
	/* Center and scale the image nicely */
	background-position: right;
	background-repeat: no-repeat;
	background-size: cover;
	background-attachment: fixed;
}

a:link {
	color:black;
}

a:hover {
	color:crimson;
}
</style>
</head>
<body class="bg">

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

<div class="container" style="margin-top:50px">
  <h1 class="text-danger" style="letter-spacing: 8px;">REPORTS</h1>
  <p style="letter-spacing: 3px;color:chartreuse">Parameterized and Non-Parameterized Reports</p>
  <table class="table">
    <thead>
      <tr  style="color:black;">
        <th class="success">Report Name</th>
        <th class="info">Description</th>
        <th class="danger">Access</th>
      </tr>
    </thead>
    <tbody>
     
      <tr style="background-color: transparent;">
        <td style="width:300px"><a href="generateReport?type=non_Parameterized&command=user" target="_blank">User Details(Non Parameterized)</a></td>
        <td style="width:500px">Afraid to enter a paradise you have never been to before? Don't you worry a moment longer. We are there for you. Upto a hundred professional guides are here to walk you through this Island of mystique, making sure that you don't miss a moment of glitter and assuring that you will be safe at all times...</td>
        <td style="width:100px">Read</td>
      </tr>
        <tr style="background-color: transparent;">
        <td><a  target="_blank" data-toggle="modal" data-target="#userModal" href="#userModal" >User Details(Parameterized)</a></td>
        <td>Afraid to enter a paradise you have never been to before? Don't you worry a moment longer. We are there for you. Upto a hundred professional guides are here to walk you through this Island of mystique, making sure that you don't miss a moment of glitter and assuring that you will be safe at all times...</td>
        <td>Read</td>
      </tr>
       <tr style="background-color: transparent;">
        <td><a  target="_blank" data-toggle="modal" data-target="#guideModal" href="#guideModal" >Tour Guide Details(Parameterized)</a></td>
        <td>Afraid to enter a paradise you have never been to before? Don't you worry a moment longer. We are there for you. Upto a hundred professional guides are here to walk you through this Island of mystique, making sure that you don't miss a moment of glitter and assuring that you will be safe at all times...</td>
       <td>Read</td>
      </tr>
        <tr style="background-color: transparent;">
        <td><a target="_blank" href="generateReport?type=non_Parameterized&command=guide" target="_blank">Tour Guide Details(Non Parameterized)</a></td>
        <td>Afraid to enter a paradise you have never been to before? Don't you worry a moment longer. We are there for you. Upto a hundred professional guides are here to walk you through this Island of mystique, making sure that you don't miss a moment of glitter and assuring that you will be safe at all times...</td>
       <td>Read</td>
      </tr>
       <tr style="background-color: transparent;">
        <td><a target="_blank" target="_blank" href="generateReport?type=non_Parameterized&command=hotel" >Hotel Details(Parameterized)</a></td>
        <td>Afraid to enter a paradise you have never been to before? Don't you worry a moment longer. We are there for you. Upto a hundred professional guides are here to walk you through this Island of mystique, making sure that you don't miss a moment of glitter and assuring that you will be safe at all times...</td>
       <td>Read</td>
      </tr>
        <tr style="background-color: transparent;">
        <td><a target="_blank" href="generateReport?type=non_Parameterized&command=hotel" target="_blank">Hotel Details(Non Parameterized)</a></td>
        <td>Afraid to enter a paradise you have never been to before? Don't you worry a moment longer. We are there for you. Upto a hundred professional guides are here to walk you through this Island of mystique, making sure that you don't miss a moment of glitter and assuring that you will be safe at all times...</td>
        <td>Read</td>
      </tr>
        <tr style="background-color: transparent;">
        <td><a target="_blank" href="generateReport?type=non_Parameterized&command=inquiry" >Inquiry Details(Non Parameterized)</a></td>
        <td >Afraid to enter a paradise you have never been to before? Don't you worry a moment longer. We are there for you. Upto a hundred professional guides are here to walk you through this Island of mystique, making sure that you don't miss a moment of glitter and assuring that you will be safe at all times...</td>
        <td>Read</td>
      </tr>
        <tr style="background-color: transparent;">
        <td><a target="_blank" href="generateReport?command=non_Parameterized&report=tour_plan" >Tour Planning Details(Non Parameterized)</a></td>
        <td>Afraid to enter a paradise you have never been to before? Don't you worry a moment longer. We are there for you. Upto a hundred professional guides are here to walk you through this Island of mystique, making sure that you don't miss a moment of glitter and assuring that you will be safe at all times...</td>
        <td>Read</td>
      </tr>
      
    </tbody>
  </table>
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
	
<div class="modal" id="userModal" >
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" style="color:black">Enter Parameter</h4>
			</div>
			<div class="modal-body">
				<form action="generateReport" method="get">
					<input type="hidden" name="type" value="Parameterized">
					<input type="hidden" name="command" value="user">
					<div class="form-group">
						<label for="InputUserName" style="color:black">Keyword</label>
						<input class="form-control" placeholder="Enter User ID" type="text" name="user_id">
					</div>
					<div class="modal-footer">
							<button class="btn btn-primary" type="submit">Submit</button>
							<button class="btn btn-primary" data-dismiss="modal">Close</button>
					</div>
				</form>
			
			
			</div>
			
		</div>
	</div>
</div>


<div class="modal" id="guideModal" >
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" style="color:black">Enter Parameter</h4>
			</div>
			<div class="modal-body">
				<form action="generateReport" method="get">
					<input type="hidden" name="type" value="Parameterized">
					<input type="hidden" name="command" value="guide">
					<div class="form-group">
						<label for="InputUserName" style="color:black">Category</label>
						<input class="form-control" placeholder="Enter Category" type="text" name="category">
					</div>
					<div class="form-group">
						<label for="InputUserName" style="color:black">Keyword</label>
						<input class="form-control" placeholder="Enter Keyword" type="text" name="value">
					</div>
					<div class="modal-footer">
							<button class="btn btn-primary" type="submit">Submit</button>
							<button class="btn btn-primary" data-dismiss="modal">Close</button>
					</div>
				</form>
			
			
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
    
</script>


</body>
</html>