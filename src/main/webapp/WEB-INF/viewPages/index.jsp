<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Home Page</title>
	<meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	  
	  <link rel="stylesheet" type="text/css" href="styles/bootstrap.css">
	  
	<style>
		body{
	  			background-image: url("images/bg.jpg");
	  			height: 100%;
				background-position: center;
				background-repeat: no-repeat;
				background-size: cover;
			}
	</style>
	
</head>
<body class="text-white bg-dark">

	<div class="container-fluid-md text-white" style="opacity:0.9">
		<nav class="navbar navbar-expand-sm px-0 py-2">
		 	<div class="container-fluid">
			    <div class="navbar-header">
			      	<a class="navbar-brand" href=""></a>
			    </div>
				<div class="pull-right;">
				    <form:form action="userLogin" class="form-inline">
					    <input class="form-control input-group-sm mr-sm-1 bg-light text-dark" type="text" name="username" placeholder="Username">
					    <input class="form-control input-group-sm mr-sm-1 bg-light text-dark" type="password" name="password" placeholder="Password">
					    <button class="btn btn-success pull-right" type="submit">Login</button>
					</form:form>
				</div>
		 	 </div>
		</nav>
	</div>
	
	
	<div class="container-md  ml-4 mb-4 float-left" style="height:500px;width:400px;opacity:0.9;">
		<div class="container">
			 <h2 class="mb-4 mt-4" style="opacity:1">Register</h2>
				 <form:form action="saveUser">
				   	<div class="form-group">
				      	<input type="text" class="form-control" id="name" placeholder="Enter Name" name="name">
				    </div>
				    <div class="form-group">
				      	<input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
				    </div>
				    <div class="form-group">
				      	<input type="text" class="form-control" id="username" placeholder="Enter username" name="username">
				    </div>
				    <div class="form-group">
				      	<input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
				    </div>
				    <div class="form-group">
				      	<input type="number" class="form-control" id="phone" placeholder="Enter Contact No" name="phone">
				    </div>
				    <div class="form-group">
				      	<input type="text" class="form-control" id="address" placeholder="Enter Address" name="address">
				    </div>
				    
				    <button type="submit" class="btn btn-primary">Submit</button>
				  </form:form>
			</div>
	</div>
		 
	
</body>
</html>