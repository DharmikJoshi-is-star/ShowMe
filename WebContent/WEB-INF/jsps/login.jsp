<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/login.css">
<title>Chat Application</title>

<style type="text/css">
.my-margin{
	margin-top: 12rem;
}
.my-width{
	width:70%;
}
.my-bg{
	background-color: #1ebea5;
}
.my-text{
	color: #1ebea5;
}


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


<div class="container my-margin">
			<div class="card my-width m-auto">
				<div class="card-body">
					<h5 class="card-title text-center">WhatsApp Login</h5>
					<h6 class="card-subtitle mb-2 text-muted text-center">Welcome to WhatsApp Web!</h6>
					<sf:form method="post" action="process-login" modelAttribute="login">
						<div class="form-group">
							<label for="exampleInputEmail1">Username/Email address</label>
							<sf:input type="email" path="username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email"/><sf:errors path="username"/>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label>
							<sf:input type="password"  path="password" class="form-control" id="exampleInputPassword1" placeholder="Enter password" /> <sf:errors path="password"/>
						</div>
						<input type="submit" class="btn card-link my-bg text-white" value="Submit">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h6 class="card-subtitle mb-2 text-muted text-center"><c:out value="${msg}"/></h6>
					</sf:form>
					<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;background-color: #1ebea5;">Sign Up</button>
						
				</div>
			</div>
		</div>
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


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
<h1>Login Page</h1>
<sf:form method="post" action="process-login" modelAttribute="login">

Username/Email: <sf:input type="text" path="username"/> <sf:errors path="username"/>
<br><br>
Password: <sf:input type="text" path="password"/> <sf:errors path="password"/>
<br><br>

<input type="submit">
</sf:form>
<a href="show-register-form">register here</a>
<br>
<c:out value="${msg}"></c:out>

 -->

</body>
</html>