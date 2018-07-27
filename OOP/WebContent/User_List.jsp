<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
	
	
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<!-- <form action="UserControllerServlet" method="get">
		<input type="hidden" name="command" value="LIST">
		<button class="btn btn-primary" type="submit">Submit</button>
	</form> -->
	
	<div id ="wrapper">
		<div id="header">
			<h2>Registered Users</h2>
		</div>
	</div>
	
	<div id="container">
		<div id="content">
			<table>
				<tr>
					<th>fname</th>
					<th>lname</th>
					<th>email</th>
					
				</tr>

				<c:forEach var="tempUser" items="${USERS_LIST}">
					<tr>
						<td>${tempUser.firstName}</td>
						<td>${tempUser.lastName}</td>
						<td>${tempUser.emailAddress}</td>
					</tr>
				</c:forEach>
					
			</table>
		</div>
	</div>
</body>
</html>