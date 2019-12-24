<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib  prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Chat Application</title>
<style>



body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Full-width input fields */
input[type=text], input[type=password] , input[type=email]{
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus ,  input[type=email]:focus{
  background-color: #ddd;
  outline: none;
}


/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
  padding: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: #474e5d;
  padding-top: 50px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* Style the horizontal ruler */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
 
/* The Close Button (x) */
.close {
  position: absolute;
  right: 35px;
  top: 15px;
  font-size: 40px;
  font-weight: bold;
  color: #f1f1f1;
}

.close:hover,
.close:focus {
  color: #f44336;
  cursor: pointer;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
}

.my-margin{
	margin-top: 3rem;
}
.my-width{
	width: 70%;
}
.my-bg{
	background-color: #1ebea5;
}
.my-text{
	color: #1ebea5;
}
</style>

</head>

<body>
<!-- 
<h1 style="text-align:center;">SignUp Page</h1>

<div class="container my-margin">
	<sf:form method="post" action="process-register-form" modelAttribute="user">
		
		<div class="form-row">
			<div class="form-group col">
				<label for="name">Name</label>
				<sf:input type="text" path="name" class="form-control" id="name" placeholder="Full Name"/> <BR><sf:errors path="name"/>
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col">
				<label for="inputEmail4">Email</label>
				<sf:input type="email" path="email" class="form-control" id="inputEmail4" placeholder="Email"/> <BR><sf:errors path="email"/>
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col">
				<label for="inputPassword4">Password</label>
				<sf:input type="password" path="password" class="form-control" id="inputPassword4" placeholder="Password"/> <BR><sf:errors path="password"/>
			</div>
		</div>
		<div class="form-row">
			<div class="form-group col">
				<label for="contact">Contact No.</label>
				<sf:input type="number" path="contact" class="form-control" id="contact" placeholder="Contact Number"/> <BR><sf:errors path="contact"/>
			</div>
		</div>
		<div class="form-row input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">Upload</span>
			</div>
			<div class="custom-file">
				<sf:input path="picture_str" type="file" class="custom-file-input" id="inputGroupFile01"/>
				<label class="custom-file-label" for="profile">Upload your Profile Picture</label><BR><sf:errors path="picture_str"/>
			</div>
		  </div>
		<input type="submit" class="btn btn-primary" value="Register">
		
		<h1>${user.picture_str}</h1>
	</sf:form>
	<a href="login">
			<button class="btn btn-primary">
				Sign In
			</button>
	</a>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
 -->
<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Sign Up</button>
<div id="id01" class="modal">
  <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
  <sf:form class="modal-content" action="process-register-form" modelAttribute="user">
    <div class="container">
      <h1>Sign Up</h1>
      <p>Please fill in this form to create an account.</p>
      <hr>
      <label for="name"><b>Full Name</b></label>
      <sf:input type="text" path="name" placeholder="Enter Full Name" name="name" />

	  <label for="email"><b>Email</b></label>
      <sf:input type="email" path="email" placeholder="Enter Email" name="email" />
				
      <label for="psw"><b>Password</b></label>
      <sf:input path="password" type="password" placeholder="Enter Password" name="psw" />

      <label for="contact"><b>Contact Number</b></label>
      <sf:input path="contact" type="text" placeholder="Enter Contact" name="contact" />
      
      
	  <div class="form-row input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">Upload</span>
		</div>
		<div class="custom-file">
			<sf:input path="picture_str" type="file" class="custom-file-input" id="inputGroupFile01"/>
			<!--  --><label class="custom-file-label" for="profile">Upload your Profile Picture</label><BR><sf:errors path="picture_str"/>
		</div>
	  </div>
	  
      <div class="clearfix">
        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
        <button type="submit" class="signupbtn" value="Sign Up">Sign Up</button>
      </div>
    </div>
  </sf:form>
</div>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

<!-- 

<sf:form method="post" action="process-register-form" modelAttribute="user">

Name: <sf:input type="text" path="name"/> <sf:errors path="name"/>
<br><br>
Email: <sf:input type="text" path="email"/> <sf:errors path="email"/>
<br><br>
Contact: <sf:input type="text" path="contact"/> <sf:errors path="contact"/>
<br><br>

<h3>Show a file-select field which allows only one file to be chosen:</h3>

Select a profile: <sf:input type="file" name="myFile" path="picture_str"/> <sf:errors path="picture_str"/>
  
<br><br>
Password: <sf:input type="text" path="password"/> <sf:errors path="password"/>
<br><br>

<input type="submit">
 
</sf:form>
 -->
</body>
</html>