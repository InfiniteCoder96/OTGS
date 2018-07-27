<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List,com.scalar.web.userModelPack.Inquiry,java.sql.Connection,java.sql.Date"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="css/styleSheet.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/templatemo-style.css">
<link href='https://fonts.googleapis.com/css?family=Denk One'
	rel='stylesheet'>
	<!-- Include the Quill library -->

<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/bootstrap.js"></script>


<style>
* {
	box-sizing: border-box
}

/* Set height of body and the document to 100% */
body, html {
	height: 1300px;
	margin: 0;
	font-family: Arial;
}

/* Style tab links */
.tablink {
	background-color: #555;
	color: white;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	font-size: 17px;
	width: 25%;
}

.tablink:hover {
	background-color: #777;
}

/* Style the tab content (and add height:100% for full page content) */
.tabcontent {
	color: white;
	display: none;
	padding: 100px 20px;
	height: 100%;
}

#userMgr {
	background-color: black;
}

#tourguideMgr {
	background-color: black;
}

#h_Fmgr {
	background-color: black;
}

#webmgr {

	background-color: black;
}

.table-fixed thead {
	width: 97%;
}

.table-fixed tbody {
	height: 230px;
	overflow-y: auto;
	width: 100%;
}

.table-fixed thead, .table-fixed tbody, .table-fixed tr, .table-fixed td,
	.table-fixed th {
	display: block;
}

.table-fixed tbody td, .table-fixed thead>tr>th {
	float: left;
	border-bottom-width: 0;
}

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

<script>
	
</script>


</head>


<body  >

	<div id="loader"></div>

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

			<ul class="nav navbar-nav navbar-right">

				<li><a href="Home.jsp">Home</a></li>
							<li><a href="Registration.jsp">Join Us</a></li>
							<li><a href="Gallery.html">Gallery</a></li>
							<li><a href="Contact_Us.jsp">Contact</a></li>
							<li><a href="About_Us.html">About Us</a></li>

							<button style="margin-left: 10px"
								class="btn btn-warning btn-sm pull-right"
								onclick="myFunctions()">Weather Report</button>
				<a href="http://localhost:8080/OOP/LogOut.jsp"><button
						class="btn btn-primary btn-sm pull-right " type="button">Sign
						Out</button></a>

			</ul>


		</div>




	</div>
	</nav>
	<!---->

	<div class="container" id="myDiv"
		style="width: 100%;height:130px; background-color: chartreuse">
		<div class="row">
			<div id="main" style="margin-top: 50px">
				<h2 class="pull-left" style="font-family: 'Denk One'; font-size: 30px;color:black">
					<img src="images/img_233159.png"
						style=" width: 50px; height: 50px" align="middle"
						hspace="20">Admin Dashboard
				</h2>

				<div class="pull-right" style="margin-top: 15px;margin-right:20px">
					<div class="well" style="background-color:black;">
						Time:<div id="clock" style="color: red; font-size: 20px"></div>
						Date:<div id="date" style="color: yellow; font-size: 20px"></div>
			
					</div>
					
				</div>


			</div>
		</div>
	</div>

	<div class="container" style="margin-top: 30px;">
		<div class="well">
			<div class="row">

				<div class="col-md-3">
					<div class="well" style="margin-bottom: 0px;background-color:white">
						<div class="row">
							<img src="images/Team_100px.png"
								style="width: 100px; margin-left: 65px" align="middle"/>
						</div>
						<div class="row">
							<center><p style="color:black;font-size: 40px">
							
								${fn:length(USERS_LIST)}
								
									</p></center>
									<center><p style="color:black;">
									Registered Users
									</p></center>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="well" style="margin-bottom: 0px;background-color:white">
						<div class="row">
							<img src="images/Tourist Guide_100px.png"
								style="width: 100px; margin-left: 75px" align="middle" />
						</div>
						<div class="row">
							<center><p style="color:black;font-size: 40px">
							${fn:length(TOUR_GUIDE_LIST)}
							</p></center>
							<center><p style="color:black;">
							Registered Tour Guides
							</p></center>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="well" style="margin-bottom: 0px;background-color:white">
						<div class="row">
							<img src="images/Hotel Building_100px.png"
								style="width: 100px; margin-left: 76px" align="middle"/>
						</div>
						<div class="row">
							<center><p style="color:black;font-size: 40px">
							${fn:length(HOTEL_LIST)}</p></center>
							
							<center><p style="color:black;">
							Registered Hotels
							</p></center>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="well" style="margin-bottom: 0px;background-color:white">
						<div class="row">
							<img src="images/Geo-fence_100px.png"
								style="width: 100px; margin-left: 76px" align="middle" />
						</div>
						<div class="row">
							<center><p style="color:black;font-size: 40px">
							
								${fn:length(PLACES_LIST)}</p>
								</center>
								
									<center><p style="color:black;">
									Tour Places
									</p></center>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>



	<div class="container">
			<c:if test="${not empty WalertMsg}">
				<div id="alertBox" class="alert alert-danger">
					<a class="close" data-dismiss="alert">&times;</a>
					<P>${WalertMsg}<P>
				</div>
			</c:if>
						
			<c:if test="${not empty SalertMsg}">
				<div id="alertBox" class="alert alert-success">
					<a class="close" data-dismiss="alert">&times;</a>
					<P>${SalertMsg}<P>
				</div>
			</c:if>	
	</div>	
	<div class="container">
		<div class="row">
			<div class="col-md-7 col-md-offset-3" style="margin-bottom:10px">
				
					
							<a href="Admin_Manager_ControllerServlet?command=LOAD" style="margin-left:50px;"><button type="button" class="btns btn-lg btn-info" aria-label="Left Align" data-placement="left" title="Click here to load Data">
							 <img src="images/Synchronize_30px.png"/>
							</button></a>
							
							<a><button class="btns btn-lg btn-default " type="button" 
										data-toggle="modal" data-target="#emailModal" aria-label="Left Align" data-placement="left" title="Click here to load Data">
							 <img src="images/New Post_30px.png"/>
							</button></a>
							
							<a type="button"><button type="button"  class="btns btn-lg btn-warning" aria-label="Left Align" data-placement="left" title="Click here to load Data">
							 <img src="images/Webcam_30px.png"/>
							</button></a>
							
							<a type="button" href="MailHandlerServlet"><button type="button"  class="btns btn-lg btn-success" aria-label="Left Align" data-placement="left" title="Click here to load Data">
							 <img src="images/Read Message_30px.png"/>
							</button></a>
							
							<a type="button" href="View_Listed_reports.jsp"><button type="button" class="btns btn-lg btn-danger" aria-label="Left Align" data-placement="left" title="Click here to load Data">
							 <img src="images/Combo Chart_30px.png"/>
							</button></a>
					
				
			</div>
		</div>
	</div>
	
<div class="tab-base" >
		<button class="tablink active" data-toggle="tab"
			onclick="openPage('userMgr', this, 'red')" id="defaultOpen">User
			Management</button>
		<button class="tablink" data-toggle="tab"
			onclick="openPage('tourguideMgr', this, 'green')" id="defaultOpen">Tour
			Guide Management</button>
		<button class="tablink" data-toggle="tab"
			onclick="openPage('h_Fmgr', this, 'blue')" id="defaultOpen">Hotels Management</button>
		<button class="tablink" data-toggle="tab"
			onclick="openPage('webmgr', this, 'orange')" id="defaultOpen">Tour Places Management</button>
	</div>



<div style="height: 100%;">
<!-- PASINDU -->
	<div id="userMgr" class="tabcontent active" >
		<div class="container" style="width: 100%;margin-top:10px">
			<div class="row">
				<div class="col-xs-5 col-md-3">
					<div class="panel panel-primary">
						<div class="panel-heading" align="center">
							<h4>Main Controls</h4>
						</div>
						<div class="panel-body">
							<div class="panel panel-success">
								<div class="panel-heading" align="center">
									<h4>User Controls</h4>
								</div>
								<div class="panel-body">
									

									

									<button class="btn btn-success " title="Tooltip on left"
										data-toggle="modal" data-target="#searchModal">Search
										Portal</button>

									<button class="btn btn-warning  " title="Tooltip on left"
										data-toggle="modal" data-target="#addModal">Add
										Portal</button>

								</div>
							</div>

						</div>
						
						<div class="panel-body">
							<div class="panel panel-danger">
								<div class="panel-heading" align="center">
									<h4>Statistics</h4>
								</div>
								<div class="panel-body">

									<div class="progress">
										<div
											class="progress-bar  progress-bar-striped progress-bar-success active"
											style="width: ${fn:length(USERS_LIST)}%; min-width: 20px">${fn:length(USERS_LIST)}%</div>
									</div>
									<div class="progress">
										<div
											class="progress-bar  progress-bar-striped progress-bar-danger "
											style="width: 5%; min-width: 20px">5%</div>
									</div>
									<div class="progress">
										<div
											class="progress-bar  progress-bar-striped progress-bar-warning "
											style="width: 20%; min-width: 20px">20%</div>
									</div>

								</div>

							</div>

						</div>
					</div>
				</div>
				<div class="col-md-9"  style="height:100%">
					<div class="row">

						<!-- Error message is showing when results not found -->
						
						<div class="panel panel-info">
							<div class="panel-heading">
								<h4>Registered Users</h4>
							</div>

							<table class="table table-bordered table-fixed">

								<thead>
									<tr style="color: gold">
										<th style="text-align: center; width: 100px">User ID</th>
										<th style="text-align: center; width: 160px">First Name</th>
										<th style="text-align: center; width: 160px">Last Name</th>
										<th style="text-align: center; width: 250px">Email
											Address</th>
										<th style="text-align: center; width: 100px">Country</th>
										<th style="text-align: center; width: 100px">Username</th>
										<th style="text-align: center; width: 160px">Action</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="tempUser" items="${USERS_LIST}">

										<!-- set up link to update for each student -->
										<c:url var="updatelink" value="UserControllerServlet">
											<c:param name="command" value="LOAD" />
											<c:param name="user_id" value="${tempUser.id }" />
										</c:url>

										<!-- set up link to delete for each student -->
										<c:url var="deletelink" value="UserControllerServlet">
											<c:param name="command" value="DELETE" />
											<c:param name="user_id" value="${tempUser.id }" />
											<c:param name="username" value="${tempUser.username }" />
										</c:url>

										<tr>
											<td
												style="color: tomato; width: 100px; height: 50px; text-align: center">${tempUser.id}</td>
											<td style="color: springgreen; width: 160px; height: 50px">${tempUser.firstName}</td>
											<td style="color: tomato; width: 160px; height: 50px">${tempUser.lastName}</td>
											<td style="color: springgreen; width: 250px; height: 50px">${tempUser.emailAddress}</td>
											<td
												style="color: tomato; width: 100px; height: 50px; text-align: center">${tempUser.country}</td>
											<td style="color: springgreen; width: 100px; height: 50px">${tempUser.username}</td>
											<td
												style="color: springgreen; width: 200px; height: 50px; font-size: 15px; text-align: center">
												<a href="${updatelink}">Update</a> | <a href="${deletelink}"
												onclick="if(!(confirm('Are you sure you want to delete this user ?'))) return false">Delete</a>
												
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

					</div>


					


				</div>

			</div>
			</div>



		
	</div>
<!-- PASINDU -->
<!-- DITHALI -->
	<div id="tourguideMgr" class="tabcontent">
		<div class="container" style="width: 100%;margin-top:10px">
			<div class="row">
				<div class="col-xs-5 col-md-3">
					<div class="panel panel-primary">
						<div class="panel-heading" align="center">
							<h4>Main Controls</h4>
						</div>
						<div class="panel-body">
							<div class="panel panel-success">
								<div class="panel-heading" align="center">
									<h4>User Controls</h4>
								</div>
								<div class="panel-body">
									

									

									<button class="btn btn-success " title="Tooltip on left"
										data-toggle="modal" data-target="#searchModal">Search
										Portal</button>

									<button class="btn btn-warning  " title="Tooltip on left"
										data-toggle="modal" data-target="#addModal">Add
										Portal</button>

								</div>
							</div>

						</div>
						
						<div class="panel-body">
							<div class="panel panel-danger">
								<div class="panel-heading" align="center">
									<h4>Statistics</h4>
								</div>
								<div class="panel-body">

									<div class="progress">
										<div
											class="progress-bar  progress-bar-striped progress-bar-success active"
											style="width: ${fn:length(TOUR_GUIDE_LIST)}%; min-width: 20px">${fn:length(TOUR_GUIDE_LIST)}%</div>
									</div>
									<div class="progress">
										<div
											class="progress-bar  progress-bar-striped progress-bar-danger "
											style="width: 5%; min-width: 20px">5%</div>
									</div>
									<div class="progress">
										<div
											class="progress-bar  progress-bar-striped progress-bar-warning "
											style="width: 20%; min-width: 20px">20%</div>
									</div>

								</div>

							</div>

						</div>
					</div>
				</div>
				<div class="col-md-9"  style="height:100%">
					<div class="row">

						<!-- Error message is showing when results not found -->
						
						<div class="panel panel-info">
							<div class="panel-heading">
								<h4>Registered Tour Guides</h4>
							</div>

							<table class="table table-bordered table-fixed">

								<thead>
									<tr style="color: gold">
										<th style="text-align: center; width: 100px">Guide ID</th>
										<th style="text-align: center; width: 190px">Full Name</th>
										<th style="text-align: center; width: 100px">Category</th>
										<th style="text-align: center; width: 250px">Email
											Address</th>
										<th style="text-align: center; width: 100px">Languages</th>
										<th style="text-align: center; width: 100px">Expiary Date</th>
										<th style="text-align: center; width: 200px">Action</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="tempGuide" items="${TOUR_GUIDE_LIST}">

										<!-- set up link to update for each student -->
										<c:url var="updatelink" value="TourGuideControllerServlet">
											<c:param name="command" value="LOAD" />
											<c:param name="guide_id" value="${tempGuide.id }" />
										</c:url>

										<!-- set up link to delete for each student -->
										<c:url var="deletelink" value="TourGuideControllerServlet">
											<c:param name="command" value="DELETE" />
											<c:param name="guide_id" value="${tempGuide.id }" />
											
										</c:url>

										<tr>
											<td
												style="color: tomato; width: 100px; height: 50px; text-align: center">${tempGuide.id}</td>
											<td style="color: springgreen; width: 190px; height: 50px">${tempGuide.firstName}</td>
											<td style="color: tomato; width: 100px; height: 50px">${tempGuide.category}</td>
											<td style="color: springgreen; width: 250px; height: 50px">${tempGuide.emailAddress}</td>
											<td
												style="color: tomato; width: 100px; height: 50px; text-align: center">${tempGuide.language_1}<br>${tempGuide.language_2}<br>${tempGuide.language_3}<br>${tempGuide.language_4}<br>${tempGuide.language_5}</td>
											<jsp:useBean id="now" class="java.util.Date" />
											
											<c:if test="${tempGuide.expDate  le now }">
												<td style="background-color:red;color: springgreen; width: 100px; height: 50px">${tempGuide.expDate}</td>
											</c:if>
											<c:if test="${tempGuide.expDate  gt now }">
												<td style="color: springgreen; width: 100px; height: 50px">${tempGuide.expDate}</td>
											</c:if>
											
											<td
												style="color: springgreen; width: 200px; height: 50px; font-size: 15px; text-align: center">
												<a href="${updatelink}">Update</a> | <a href="${deletelink}"
												onclick="if(!(confirm('Are you sure you want to delete this user ?'))) return false">Delete</a>
												
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

					</div>


					


				</div>

			</div>
			</div>

	</div>
	<!-- DITHALI -->
	<!-- VIDUSHAN -->
	<div id="h_Fmgr" class="tabcontent">
		<div class="container" style="width: 100%;margin-top:10px">
			<div class="row">
				<div class="col-xs-5 col-md-3">
					<div class="panel panel-primary">
						<div class="panel-heading" align="center">
							<h4>Main Controls</h4>
						</div>
						<div class="panel-body">
							<div class="panel panel-success">
								<div class="panel-heading" align="center">
									<h4>User Controls</h4>
								</div>
								<div class="panel-body">
									
									

									<button class="btn btn-success " title="Tooltip on left"
										data-toggle="modal" data-target="#searchModal">Search
										Portal</button>

									<a href="insertHotel.html"><button class="btn btn-warning  " title="Tooltip on left"
										 >Add
										Portal</button></a>

								</div>
							</div>

						</div>
						
						<div class="panel-body">
							<div class="panel panel-danger">
								<div class="panel-heading" align="center">
									<h4>Statistics</h4>
								</div>
								<div class="panel-body">

									<div class="progress">
										<div
											class="progress-bar  progress-bar-striped progress-bar-success active"
											style="width: ${fn:length(HOTEL_LIST)}%; min-width: 20px">${fn:length(HOTEL_LIST)}%</div>
									</div>
									<div class="progress">
										<div
											class="progress-bar  progress-bar-striped progress-bar-danger "
											style="width: 5%; min-width: 20px">5%</div>
									</div>
									<div class="progress">
										<div
											class="progress-bar  progress-bar-striped progress-bar-warning "
											style="width: 20%; min-width: 20px">20%</div>
									</div>

								</div>

							</div>

						</div>
					</div>
				</div>
				<div class="col-md-9"  style="height:100%">
					<div class="row">

						<!-- Error message is showing when results not found -->
						
						<div class="panel panel-info">
							<div class="panel-heading">
								<h4>Registered Hotels</h4>
							</div>

							<table class="table table-bordered table-fixed">

								<thead>
									<tr style="color: gold">
										<th style="text-align: center; width: 160px">Hotel Name</th>
										<th style="text-align: center; width: 100px">City</th>
										<th style="text-align: center; width: 250px">Address</th>
										<th style="text-align: center; width: 100px">Telephone
											</th>
										<th style="text-align: center; width: 160px">Web</th>
										<th style="text-align: center; width: 100px">Category</th>
										<th style="text-align: center; width: 200px">Action</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="tempHotel" items="${HOTEL_LIST}">

										<!-- set up link to update for each student -->
										<c:url var="updatelink" value="ReservationHandler">
											
											<c:param name="load" value="${tempHotel.getID() }" />
										</c:url>

										<!-- set up link to delete for each student -->
										<c:url var="deletelink" value="ReservationHandler">
											<c:param name="delete" value="${tempHotel.getID() }" />
											<!--<c:param name="user_id" value="${tempHotel.getID() }" />-->
											
										</c:url>

										<tr>
											<td
												style="color: tomato; width: 160px; height: 50px; text-align: center">${tempHotel.getName()}</td>
											<td style="color: springgreen; width: 100px; height: 50px">${tempHotel.getCity()}</td>
											<td style="color: tomato; width: 250px; height: 50px">${tempHotel.getAddress()}</td>
											<td style="color: springgreen; width: 100px; height: 50px">${tempHotel.getPhone()}</td>
											<td
												style="color: tomato; width: 160px; height: 50px; text-align: center"><a href="${tempHotel.getWeb()}">${tempHotel.getWeb()}</a></td>
											<td style="color: springgreen; width: 100px; height: 50px">${tempHotel.gettype()}</td>
											<td
												style="color: springgreen; width: 200px; height: 50px; font-size: 15px; text-align: center">
												<a href="${updatelink}">Update</a> | <a href="${deletelink}"
												onclick="if(!(confirm('Are you sure you want to delete this Hotel ?'))) return false">Delete</a>
												
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

					</div>


					


				</div>

			</div>
			</div>
	</div>
<!-- VIDUSHAN -->
<!-- PARAKUM -->
	<div id="webmgr" class="tabcontent">
		<div class="container" style="width: 100%;margin-top:10px">
			<div class="row">
				<div class="col-xs-5 col-md-3">
					<div class="panel panel-primary">
						<div class="panel-heading" align="center">
							<h4>Main Controls</h4>
						</div>
						<div class="panel-body">
							<div class="panel panel-success">
								<div class="panel-heading" align="center">
									<h4>Tour Places Controls</h4>
								</div>
								<div class="panel-body">
								
									<button class="btn btn-success " title="Tooltip on left"
										data-toggle="modal" data-target="#searchModal">Search
										Portal</button>

									<button class="btn btn-warning  " title="Tooltip on left"
										data-toggle="modal" data-target="#addModal">Add
										Portal</button>

								</div>
							</div>

						</div>
						
						<div class="panel-body">
							<div class="panel panel-danger">
								<div class="panel-heading" align="center">
									<h4>Statistics</h4>
								</div>
								<div class="panel-body">

									<div class="progress">
										<div
											class="progress-bar  progress-bar-striped progress-bar-success active"
											style="width: ${fn:length(PLACES_LIST)}%; min-width: 20px">${fn:length(PLACES_LIST)}%</div>
									</div>
									<div class="progress">
										<div
											class="progress-bar  progress-bar-striped progress-bar-danger "
											style="width: 5%; min-width: 20px">5%</div>
									</div>
									<div class="progress">
										<div
											class="progress-bar  progress-bar-striped progress-bar-warning "
											style="width: 20%; min-width: 20px">20%</div>
									</div>

								</div>

							</div>

						</div>
					</div>
				</div>
				<div class="col-md-9"  style="height:100%">
					<div class="row">

						<!-- Error message is showing when results not found -->
						
						<div class="panel panel-info">
							<div class="panel-heading">
								<h4>Tour Places</h4>
							</div>

							<table class="table table-bordered table-fixed">

								<thead>
									<tr style="color: gold">
										<th style="text-align: center; width: 100px">Place ID</th>
										<th style="text-align: center; width: 160px">Name</th>
										<th style="text-align: center; width: 160px">Category</th>
										<th style="text-align: center; width: 100px">City</th>
										<th style="text-align: center; width: 350px">Caption</th>
										<th style="text-align: center; width: 200px">Action</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="tempPlace" items="${PLACES_LIST}">

										<!-- set up link to update for each student -->
										<c:url var="updatelink" value="PlacesControllerServlet">
											<c:param name="command" value="LOAD" />
											<c:param name="destination" value="updatePlaceDetails.jsp" />
											<c:param name="place_id" value="${tempPlace.getPlace_id() }" />
											
										</c:url>

										<!-- set up link to delete for each student -->
										<c:url var="deletelink" value="PlacesControllerServlet">
											<c:param name="command" value="DELETE" />
											<c:param name="destination" value="Admin_Dashboard.jsp" />
											<c:param name="place_id" value="${tempPlace.getPlace_id() }" />
											
										</c:url>

										<tr>
											<td
												style="color: #566573; width: 100px; height: 80px; text-align: center">${tempPlace.getPlace_id()}</td>
											<td style="color: #EC7063; width: 160px; height: 80px">${tempPlace.getPlace_name()}</td>
											<td style="color: #566573; width: 160px; height: 80px">${tempPlace.getP_category()}</td>
											<td style="color: #EC7063; width: 100px; height: 80px; text-align: center">${tempPlace.getPlace_city()}</td>
											<td style="color: #3498DB; width: 350px; height: 80px">${tempPlace.getP_caption()}</td>
											
											<td	style="color: #3498DB; width: 200px; height: 80px; font-size: 15px; text-align: center">
												<a href="${updatelink}">Update</a> | <a href="${deletelink}"
												onclick="if(!(confirm('Are you sure you want to delete this user ?'))) return false">Delete</a>
												
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

					</div>


					


				</div>
				
				

			</div>
			
			<div class="row">
					<div class="col-md-3 fixed">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h4>Search Portal</h4>
					</div>
					<div class="panel-body">

						<form action="PlacesControllerServlet" method="post"
							enctype="multipart/form-data">


							<input type="hidden" name="command" value="PHOTO_UPLOAD">

							<div class="form-group">
								<label for="InputUserName">Place ID:</label> <input
									class="form-control" placeholder="Enter Place ID" type="text"
									name="imageID" required>

							</div>
							<div class="form-group">
								<label for="InputUserName">Image No:</label> <select
									class="form-control" title="Select search category"
									name="imageNo">
									<option selected disabled>Select an Image No</option>
									<option>Main Image</option>
									<option>Sub Image 02</option>
									<option>Sub Image 03</option>
									<option>Sub Image 04</option>
									<option>Sub Image 05</option>
									
									


								</select>

							</div>
							<div class="form-group">

								<label for="InputPassword">Keyword:</label> <input
									class="form-control" placeholder="Search here...." type="file"
									name="file" required>

							</div>
							<div class="modal-footer">

								<button class="btn btn-info" type="submit">Submit</button>

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
	</div>

<!-- PARAKUM -->
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

		<div style="width: 100%; background-color: brown; color: azure"
			align="center">

			<p>© 2018 All Rights Reserved by Scalar Industries</p>
			<p>
				Powered By:<a href="#">Scalar Tech</a>
			</p>

		</div>

		<div class="modal" id="searchModal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" style="color: black">User Search
							Portal</h4>
					</div>
					<div class="modal-body">
						<form action="UserControllerServlet" method="get">

							<input type="hidden" name="command" value="SEARCH" />

							<div class="form-group">
								<label for="InputUserName">Search by:</label> <select
									class="form-control" title="Select Your Country"
									name="category" required>
									<option selected disabled>Select an Option</option>
									<option>User ID</option>
									<option>First Name</option>
									<option>Last Name</option>
									<option>Country</option>
									<option>Username</option>
								</select>

							</div>

							<div class="form-group">

								<label for="InputPassword">Keyword:</label> <input
									class="form-control" placeholder="Search here...." type="text"
									name="key" required>
							</div>
							<div class="modal-footer">
								<button class="btn btn-success" type="submit">Search</button>
								<button class="btn btn-danger" data-dismiss="modal">Close</button>
							</div>
						</form>


					</div>

				</div>
			</div>
		</div>

		<div class="modal" id="addModal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" style="color: black">Add User Portal</h4>
					</div>
					<div class="modal-body">
						<form action="UserControllerServlet" method="post">

							<input type="hidden" name="command" value="ADMIN_ADD" />

							<div class="form-group">

								<label for="InputPassword">First Name</label> <input
									class="form-control" placeholder="Search here...." type="text"
									name="firstName" required>
							</div>
							<div class="form-group">

								<label for="InputPassword">Last Name</label> <input
									class="form-control" placeholder="Search here...." type="text"
									name="lastName" required>
							</div>
							<div class="form-group">

								<label for="InputPassword">Email </label> <input
									class="form-control" placeholder="Search here...." type="text"
									name="email" required>
							</div>
							<div class="form-group">
								<label for="InputUserName">Country</label> <select
									class="form-control" title="Select Your Country" name="country"
									required>
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
							<div class="form-group">

								<label for="InputPassword">Username</label> <input
									class="form-control" placeholder="Search here...." type="text"
									name="username" required>
							</div>
							<div class="form-group">

								<label for="InputPassword">Password</label> <input
									class="form-control" placeholder="Search here...."
									type="password" name="password" required>
							</div>
							<div class="modal-footer">
								<button class="btn btn-warning" type="submit">Submit</button>
								<button class="btn btn-danger" data-dismiss="modal">Close</button>
							</div>
						</form>


					</div>

				</div>
			</div>
		</div>


		<div class="modal" id="emailModal">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" style="color: black">Email Sending  Portal</h4>
					</div>
					<div class="modal-body">
						<form action="Admin_Manager_ControllerServlet" method="post">

							<input type="hidden" name="command" value="ADMIN_EMAIL" />
							
							<div class="form-group">
								<label for="InputUserName">FROM:</label> <select
									class="form-control" title="Select An Email Address" name="from"
									required>
									<option selected disabled>Select an Email address</option>
									<option>scalartourguide@gmail.com</option>
									<option>scalartourplan@gmail.com</option>
									<option>scalarmanager@gmail.com</option>
								</select>

							</div>
							<div class="form-group">

								<label for="InputPassword">TO:</label> <input
									class="form-control" placeholder="Enter an Email address" type="text"
									name="to" required>
							</div>
							<div class="form-group">

								<label for="InputPassword">SUBJECT:</label> <input
									class="form-control" placeholder="Subject here...." type="text"
									name="subject" required>
							</div>
							<div class="form-group">

								<label for="InputPassword">MESSAGE:</label> <textarea rows="10" cols="15"
									class="form-control" placeholder="Message here...." type="text"
									name="message" required></textarea>
							</div>
							
							<div class="modal-footer">
								<button class="btn btn-info" type="submit">Submit</button>
								<button class="btn btn-danger" data-dismiss="modal">Close</button>
							</div>
						</form>


					</div>

				</div>
			</div>
		</div>

<script>
	setTimeout(function(){
		$('#alertBox').hide('fade');
	},4000);

	$(function() {
		$('[data-toggle="tooltip"]').tooltip()
	})

	function openPage(pageName, elmnt, color) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablink");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].style.backgroundColor = "";
		}
		document.getElementById(pageName).style.display = "block";
		elmnt.style.backgroundColor = color;

	}
	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();

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

	  $(function() {
		    $('a[data-toggle="tab"]').on('click', function(e) {
		        window.localStorage.setItem('activeTab', $(e.target).attr('href'));
		    });
		    var activeTab = window.localStorage.getItem('activeTab');
		    if (activeTab) {
		        $('#myTab a[href="' + activeTab + '"]').tab('show');
		        window.localStorage.removeItem("activeTab");
		    }
		});
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




	</div>
</body>
</html>