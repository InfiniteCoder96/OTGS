<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/styleSheet.css" rel="stylesheet" type="text/css">
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<style>

#loader {
  position: absolute;
  left: 50%;
  top: 50%;
  z-index: 1;
  width: 150px;
  height: 150px;
  margin: -75px 0 0 -75px;
   border-top: 16px solid chartreuse;
  border-right: 16px solid transparent;
  border-bottom: 16px solid transparent;
  border-left: 16px solid transparent;
  border-radius: 50%;
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

</style>
</head>
<body>

<div id="loader"></div>
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

<div class="panel panel-info">
		<div class="panel-heading">
			<h4>Registered Users</h4>
		</div>

			<table class="table table-bordered table-fixed">

				<thead class="thead-light">
					<tr style="color: black">
						<th style="text-align: center; width: 100px">Sender</th>
						<th style="text-align: center; width: 160px">Date</th>
						<th style="text-align: center; width: 160px">Subject</th>
						<th style="text-align: center; width: 250px">Message</th>
										

					</tr>
				</thead>
			<tbody>
			<c:forEach var="mail" items="${MAIL_LIST}">

										

				<tr class="bg-info">
					<td class="bg-primary text-success" style=" width: 100px; height: 50px; text-align: center">${mail.getSender()}</td>
					<td class="bg-warning text-danger" style=" width: 160px; height: 50px">${mail.getReceiver() }</td>
					<td class="bg-success " style="color: black; width: 160px; height: 50px">${mail.getSubject() }</td>
					<td class="bg-danger" style="color: black; width: 250px; height: 50px">${mail.getMessage()}</td>
											
				</tr>
			</c:forEach>
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

var myVar;

function myFunction1() {
    myVar = setTimeout(showPage, 3000);
}

function showPage() {
  document.getElementById("loader").style.display = "none";
  document.getElementById("myDiv").style.display = "block";
}

window.onload = function(){
	myFunction1();
	startTime();
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