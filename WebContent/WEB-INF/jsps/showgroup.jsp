<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
<!--  
<script src= "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"> </script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
-->
<title>Chat Application</title> 
<script> 
        $(document).ready(function() { 
            $("body").click(function() { 
                $(document).scrollTop($(document).height()); 
            }); 
        }); 
 </script> 
<style>

/*New design starts from here
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
body{
	padding: 2rem 0rem;
}
.image-parent {
	max-width: 40px;
}
*/
/*Ends here*/

/*

body {
  margin: 0 auto;
  max-width: 800px;
  padding: 0 20px;
}

.container {
  border: 2px solid #dedede;
  background-color: #f1f1f1;
  border-radius: 5px;
  padding: 10px;
  margin: 10px 0;
}

.darker {
  border-color: #ccc;
  background-color: #ddd;
}

.container::after {
  content: "";
  clear: both;
  display: table;
}

.container img {
  float: left;
  max-width: 60px;
  width: 100%;
  margin-right: 20px;
  border-radius: 50%;
}

.container img.right {
  float: right;
  margin-left: 20px;
  margin-right:0;
}

.time-right {
  float: right;
  color: #aaa;
}

.time-left {
  float: left;
  color: #999;
}
img {
  border-radius: 50%;
}
*/

.my-margin{
	margin-top: 6rem;
}
.my-width{
	width:70%;
}
.my-bg{
	
}
.my-text{
	color: #1ebea5;
}
body{
	padding: 2rem 0rem;
}
.image-parent {
	max-width: 40px;
}
.my-height-nav {
	height: 4rem;
	margin-top: -1.5rem;
}
.my-center{
	text-align: center;
	vertical-align: middle;
	line-height: 3rem;  
}



.topnav {
  position: relative;
  overflow: hidden;
  background-color: #1ebea5;
}

.topnav a {
  float: left;
 /*color: #f2f2f2;*/
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;

}

.topnav a:hover {
  background-color: #1ebea5;
  color: black;
}

.topnav a.active {
  background-color: #1ebea5;
  color: white;
}

.topnav-centered a {

  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.topnav-right {
  float: right;
}

/* Responsive navigation menu (for mobile devices) */
@media screen and (max-width: 600px) {
  .topnav a, .topnav-right {
    float: none;
    display: block;
  }
  
  .topnav-centered a {
    position: relative;
    top: 0;
    left: 0;
    transform: none;
  }
}

</style>

</head>
<body>


<!-- 
<h1>Welcome in Group <c:out value="${group. group_name }"/></h1> &nbsp; &nbsp; 

<br>
<br>

<h1>
Group Description: <c:out value="${group. description}"/>
<BR><BR>

</h1>

<h5>
<a href="leaveGroup?user_id=${user_id }&group_id=${group.group_id}">Leave Group
</a>
</h5>

<BR><BR>
Total Members: <c:out value="${group. total_members}"/>
<BR><BR>

<c:if test="${user_id eq group.getAdmin_id() }">
	Since you are Admin of this Group you have the privilege of adding members<BR>
	<a href="addMember?user_id=<c:out value="${user_id}"/>&group_id=${group.group_id}">+ADD MEMBER</a>
	
</c:if>
<BR><BR>

Group Members :
<c:forEach items="${users }" var="member">
     
    <div class="container">
			<img src="data:image/jpg;base64,${member.picture_str}" alt="Avatar" style="width:100%;">
			<p><c:out value="${member.name}"/>
			<c:if test="${group.getAdmin_id() ne member.getId() }">
				<c:if test="${user_id eq group.getAdmin_id() }">
					<a href="removeMember?member_id=${member.getId() }&group_id=${group.group_id }&user_id=${user_id}">
						Remove
					</a>
				</c:if>
			</c:if>
			</p>
			
			<c:if test="${member.getId() eq group.getAdmin_id() }">
				ADMIN
			</c:if>
			<c:if test="${member.getId() ne group.getAdmin_id() }">
				MEMBER
			</c:if>
	</div>

</c:forEach> 
<BR><BR>
 -->
<header class="container my-bg my-height-nav">
			
<div class="topnav">

  <!-- Centered link -->
  <div class="topnav-centered">
    <font size="6"><a href="#home" class="active"><b>Group Information</b></a></font>
  </div>
  
  <a class="nav-link text-light my-center" 
	href="showGroup?group_id=<c:out value="${group.group_id}"/> &user_id=<c:out value="${user_id}"/>" style="text-align: left;">
	<< GoHome
	</a>


 
</div>
		
</header>


<div class="container my-margin">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col">
							<h3 class="card-title"><c:out value="${group. group_name }"/></h3>
							<p class="card-text"><c:out value="${group. description}"/></p>
							<pre class="text-muted">Admin is <c:out value="${admin.getName() }"/></pre>
							
							<pre class="text-muted">Total Members: <c:out value="${group. total_members}"/></pre>
							
							<c:if test="${user_id eq group.getAdmin_id() }">
								
								<a href="addMember?user_id=<c:out value="${user_id}"/>&group_id=${group.group_id}">+ADD MEMBER</a>
								
							</c:if>
						</div>
						<div class="col">
							<i class="fa fa-group" class="rounded-circle float-right" style="font-size:190px;color:#00FBDA;font-align:right"></i>
							<!-- 
							<img src="../images/profile.png" alt="Group Profile" class="rounded-circle float-right" style="width: 4rem; height: 4rem;">
							 -->
						</div>
					</div>
				</div>
				<ul class="list-group">
					
							<c:forEach items="${users }" var="member">
								
				
								<li class="list-group-item">
									<div class="row">
											<div class="col-6">
												<img src="data:image/jpg;base64,${member.picture_str}" class="img-fluid rounded-circle " style="width: 4rem; height: 4rem;" alt="quixote">
												<c:out value="${member.name}"/>
												<c:if test="${member.getId() eq group.getAdmin_id() }">
													<font class="text-muted">ADMIN</font>
												</c:if>
												<c:if test="${member.getId() ne group.getAdmin_id() }">
													<font class="text-muted">MEMBER</font>
												</c:if>
											</div>
									
											<div class="col-3"></div>
										
											<div class="text-right">
									
												<c:if test="${group.getAdmin_id() ne member.getId() }">
													<c:if test="${user_id eq group.getAdmin_id() }">
														<a href="removeMember?member_id=${member.getId() }&group_id=${group.group_id }&user_id=${user_id}" rel="noopener noreferrer">
															Remove
														</a>
													</c:if>
												</c:if>
										 	</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					
				<div class="card-body">
				  <a href="leaveGroup?user_id=${user_id }&group_id=${group.group_id}" class="card-link">leave group</a>
				</div>
			</div>
		</div>
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


</body>
</html>