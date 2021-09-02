<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="styles/bootstrap.css">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<title>Insert title here</title>
</head>
<body class="text-white" style="background-color:black;">
	<%
// 		Login u = (Login)session.getAttribute("userob");
		
	%>
	
	<div class="container-fluid-md bg-dark" style="opacity:0.8;">
		<nav class="navbar navbar-expand-sm navbar-secondary">
			<div class="container-fluid">
				<div style="float:right">
					<a href="home" class="text-white">Home</a>
				</div>
				<div class="ml-4" style="float: right;">
					Welcome ,  ${userob.name}
			</div>
				<div class="ml-4" style="float: right;">
					<a href = "Cart.jsp" class="text-warning">Cart</a>
				</div>
			</div>
		</nav>
	</div>
	
	

	<div class="container-md">
		<table class="table table-dark table-hover" style="margin-top:70px; width:100%">
			<tr> 
				<th>PRODUCT ID</th> <th>PRODUCT NAME</th> <th>QUANTITY</th> <th>PRICE</th> <th></th> <th></th>
			</tr>			
			<c:forEach var="p" items="${prod_list}">
				<tr>
					<td>${p.pid}</td>
					<td>${p.prod_name}</td>
					<td>${p.price}</td>
					<td>${p.quantity}</td>
					<td><a href="editProduct/${p.pid}">Edit</a></td>  
			   		<td><a href="deleteProduct/${p.pid}">Delete</a></td>
				</tr>
			</c:forEach>
			
		</table>
	</div>
</body>
</html>