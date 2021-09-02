<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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


<body class="bg-secondary" style="color: white; text-align:center">
		<div class="container-fluid-md text-white bg-dark" style="opacity:0.8">
			<nav class="navbar navbar-expand-sm navbar-secondary">
			 	<div class="container-fluid">
				    <!-- <div class="navbar-header">
				      	<a class="navbar-brand" href=""></a>
				    </div> -->
				    <div class="pull-left;">
					    <a class="navbar-brand; text-light" href="home"><strong>Home</strong></a>
					</div>
					<div class="pull-right;">
					    <a class="navbar-brand; text-light" href="adminView"><strong>Products</strong></a>
					</div>
			 	 </div>
			</nav>
		</div>
	
	
	<div class="container-md" style="height:500px;width:300px; margin-top:100px">
			 <h2 class="mb-4 mt-4" style="opacity:1">Add Product</h2>
				 <form:form action="../saveUpdate">
				 	<div class="form-group">
				      	<input type="hidden" class="form-control" value="${p.pid}" name="pid">
				    </div>
				   	<div class="form-group">
				      	<input type="text" class="form-control" value="${p.prod_name}" name="prod_name">
				    </div>
				 
				    <div class="form-group">
				      	<input type="number" class="form-control" value="${p.price}" name="price">
				    </div>
				    
				    <div class="form-group">
				      	<input type="number" class="form-control" value="${p.quantity}" name="quantity">
				    </div>
				    
				    <button type="submit" class="btn btn-success">Update</button>
				  </form:form>
	</div>
</body>
</html>
