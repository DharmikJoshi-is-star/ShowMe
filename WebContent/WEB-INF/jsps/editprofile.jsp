<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
<title>Chat Application</title>
<style>

.my-margin{
	margin-top: 6rem;
}
.my-width{
	width:70%;
}
.my-bg{
	background-color: #1ebea5;
	color: #fff;
}
.my-text{
	color: #1ebea5;
}
.header-text{
color: gray;
}
</style>
</head>
<body>

	<div class="container my-margin">
		<h1 style="text-align:center;" class="header-text">Edit Profile</h1>
		<sf:form method="post" action="process-editprofile-form?image=${image}" modelAttribute="user">
			<div class="form-row">
				<img src="data:image/jpg;base64,${image}" width="200" height="200" />
				<div class="input-group mb-3 mt-3">
					<sf:input type="hidden" path="id"/> 
					<div class="custom-file">
						<sf:input type="file" class="custom-file-input"  id="inputGroupFile02" name="Click to change" path="picture_str"/> <sf:errors path="picture_str"/>
						<label class="custom-file-label" for="inputGroupFile02">Update Profile</label>
					</div>
					<div class="input-group-append">
						<span class="input-group-text" id="">Upload</span>
					</div>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputEmail4">Name</label>
			 		<sf:input type="text"   class="form-control" id="inputName" path="name"/> <sf:errors path="name"/>
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4">Contact</label>
					<sf:input class="form-control" id="inputNumer" type="text" path="contact" /> <sf:errors path="contact"/>
				</div>	
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputEmail4">Email</label>
					<sf:input type="email" class="form-control" id="inputEmail4" path="email" /> <sf:errors path="email"/>
				</div>
			 	<div class="form-group col-md-6">
					<label for="inputPassword4">Password</label>
					<sf:input type="text" class="form-control" id="inputPassword4" path="password"/> <sf:errors path="password"/>
				</div>
			</div>	
			<input type="submit" class="btn my-bg" value="Save Changes">
		</sf:form>
		<Hr>
		<h4><a href="javascript:history.go(-1)">View Profile</a></h4>
	</div>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>