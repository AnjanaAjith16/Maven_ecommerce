<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<body class="bg-secondary">
	

	<div class="container-fluid-md text-white bg-dark" style="opacity:0.8">
		<nav class="navbar navbar-expand-sm navbar-secondary">
			 <div class="container-fluid">
				<div class="pull-left;">
					<a class="navbar-brand; text-light" href="home"><strong>Home</strong></a>
				</div>
				<div class="mr-4" style="float: right;">
<%-- 					Welcome , ${userob.username} --%>
				</div>
				<div class="pull-right;">
					    <a class="navbar-brand; text-light" href="viewProducts"><strong>Products</strong></a>
				</div>
			 </div>
		</nav>
	</div>
	
	<div class="container-md">	
		<div class="row justify-content-center">
			<table class="table table-dark table-hover" style="margin-top:70px; width:100%;">
			<thead style="background-color:black;"><tr><th>ProductID</th><th>Product Name</th><th>Quantity</th><th>Unit Price</th><th></th><th></th></tr></thead>

			<c:forEach var="c" items="${cart}">
				<tr>
					<td>${c.product.pid}</td>
					<td>${c.product.prod_name}</td>
					<td>${c.product.price}</td>
					<td>${c.product.quantity}</td>
					<td><a href="removeItem/${c.product.pid}" style="color:red">Remove</a></td>
				</tr>
			</c:forEach>		
	
			</table>
			<!-- <script>		
				function getPrice(q,p,i){
					toas(q,p,i);
				}
				
				$(document).ready(
						function() {
							toas = function(q,p,i) {
								$("#tprice"+i).load("getPrice.jsp?q="+q+"&p="+p,
										function(responseTxt, statusTxt, xhr) {
							});
						}
				});
			</script> -->
		</div>	
	</div>
	<div class="text-center" style="margin-top:50px">
		<a href="" class="btn btn-success" role="button">Order Now</a>
	</div>
</body>
</html>


