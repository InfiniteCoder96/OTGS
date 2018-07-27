<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List,com.scalar.web.userModelPack.Inquiry"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Keep Last Selected Bootstrap Tab Active on Page Refresh</title>
<link href="css/styleSheet.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">

<link href='https://fonts.googleapis.com/css?family=Denk One'
	rel='stylesheet'>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/Validate.js"></script>
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

	function startTime() {
		var today = new Date();
		var h = today.getHours();
		var m = today.getMinutes();
		var s = today.getSeconds();
		var y = today.getFullYear();
		var mon = today.getMonth() + 1;
		var d = today.getDate();

		m = checkTime(m);
		s = checkTime(s);

		mon = checkTime(mon);
		d = checkTime(d);

		document.getElementById('clock').innerHTML = h + ":" + m + ":" + s;
		document.getElementById('date').innerHTML = d + "-" + mon + "-" + y;

		var t = setTimeout(startTime, 500);
	}
	function checkTime(i) {
		if (i < 10) {
			i = "0" + i
		}
		; // add zero in front of numbers < 10
		return i;
	}
</script>
</head>
<body>
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

				<ul class="nav navbar-nav navbar-right">

					<li><a href="Home.jsp">Home</a></li>
					<li><a href="#start">About Us</a></li>
					<li><a href="#">Services</a></li>
					<li><a href="About_Us.html">Team</a></li>
					<li><a href="#">Gallery</a></li>
					<li><a href="Contact_Us.html">Contact</a></li>
					<a href="http://localhost:8080/OOP/LogOut.jsp"><button
							class="btn btn-primary btn-sm pull-right " type="button">Sign
							Out</button></a>

				</ul>


			</div>




		</div>
	</nav>
	<!---->

	<div class="container"
		style="width: 100%; background-color: chartreuse">
		<div class="row">
			<div class="navbody" id="main" style="margin-top: 50px">
				<h2 style="font-family: 'Denk One'; font-size: 30px;">
					<img src="images/img_233159.png"
						style="margin-top: 10px; width: 50px; height: 50px" align="middle"
						hspace="20">Admin Dashboard
				</h2>

				<div class="pull-right">
					<div id="clock" style="color: black; font-size: 20px"></div>
					<div id="date" style="color: black; font-size: 20px"></div>
				</div>


			</div>
		</div>
	</div>

	<div class="container" style="margin-top: 30px;">
		<div class="well">
			<div class="row">

				<div class="col-md-3">
					<div class="well" style="margin-bottom: 0px">
						<div class="row">
							<img src="images/users.png"
								style="width: 100px; margin-left: 65px" />
						</div>
						<div class="row">
							<p><center>102<center>
									</p>
					<p>
									<center>Registered Users</center>
									</p>
				
						</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="well" style="margin-bottom:0px">
				<div class="row">
					<img src="images/637305-200.png"
								style="width:100px;margin-left:65px" />
				</div>
				<div class="row">
					<p>
							<center>16</center>
							</p>
					<p>
							<center>Registered Tour Guides</center>
							</p>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="well" style="margin-bottom:0px">
				<div class="row">
					<img src="images/Hotel-PNG-Pic.png"
								style="width:100px;margin-left:65px" />
				</div>
				<div class="row">
					<p>
							<center>16</center>
							</p>
					<p>
							<center>Registered Hotels</center>
							</p>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="well" style="margin-bottom:0px">
				<div class="row">
					<img src="images/adres-1.png" style="width:100px;margin-left:65px" />
				</div>
				<div class="row">
					<p>
							<center>108 <center>
									</p>
					<p>
									<center>Tour Places</</center>
									</p>
				
						</div>
			</div>
		</div>
	</div>
	</div>
	
</div>

	</body>
</html>
