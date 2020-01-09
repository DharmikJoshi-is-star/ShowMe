<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Chat Application</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- START FOR TOOL TIP 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- END FOR TOOL TIP -->

<script type="text/javascript">
/*START FOR TOOL TIP*/
$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();   
});
/*END FOR TOOL TIP*/
</script>

<style>

/*START FOR TOOL TIP*/
.color-tooltip + .tooltip > .tooltip-inner {background-color: #1ebea5;}
.color-tooltip + .tooltip > .tooltip-arrow { border-bottom-color:#1ebea5; }
/*END FOR TOOL TIP*/


.my-margin{
	margin-top: 3rem;
	margin-bottom: auto;
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
.my-img {
	height: 8rem;
	width: 8rem;
}
.my-card {
	width: 95%;
	margin: auto;
	margin-top: 2rem;
}
.my-height-nav {
	height: 4rem;
}
.my-center{
	text-align: center;
	vertical-align: middle;
	line-height: 3rem;  
}
.my-active {
	font-size: larger;
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

<header class="container  my-height-nav">
			
<div class="topnav">

  <!-- Centered link -->
  <div class="topnav-centered">
    <font size="6"><a href="#ProfileInformation" class="active"><b>Friend Requests</b></a></font>
  </div>
  
  <a class="nav-link text-light my-center" 
	href="javascript:history.go(-1)" style="text-align: left;" title="home" data-toggle="tooltip" data-placement="bottom" class="color-tooltip">
	<i class="fa fa-home" style='font-size:48px;color:white'></i>
	</a>

</div>
		
</header>

<div class="container my-margin">
	<c:forEach items="${users }" var="user">
	
	<c:set value="0" var="loop"/>
	
	<c:forEach items="${requestedUsers }" var="requested">

			<c:if test="${user.getId() eq requested.request_by}">
				
				<c:if test="${loop eq 0 }">
				
				<c:set value="1" var="loop"/>
					
						<div class="card my-card">
							<div class="card-body">
								<div class="row">
								
									<div class="col-xs-3">
										<a href="showFindFriendProfile?user_id=${userId}&f_id=${user.id}&type=accept">
										<img src="data:image/jpg;base64,${user.picture_str}" alt="" class="my-img rounded mx-auto d-block ml-md-3">
										</a>
									</div>
									<div class="col">
										
										<h5 class="card-title"><a href="showFindFriendProfile?user_id=${userId}&f_id=${user.id}&type=accept" 
										title="view profile" data-toggle="tooltip" data-placement="bottom" class="color-tooltip">
										<c:out value="${user.name }"/></a></h5>
										
										<h6 class="card-subtitle mb-2 text-muted">Works At</h6>
										<p class="card-text">Bio, if provided!</p>
										<div class="card-link row">
											<a href="addFromFindFriend?userId=${userId}&contactId=${user.id}" class="card-link col col-md-4">Accept Request</a>
											<!-- <a href="rejectRequest?userId=${userId}&contactId=${user.id}" class="card-link col col-md-4">Delete Request</a> -->
										</div>
									</div>
								
								</div>
							</div>
						</div>
				</c:if>
			</c:if>
			
	</c:forEach>

	<c:forEach items="${alreadyRequestedUsers }" var="alreadyRequestedUser">
		
		<c:if test="${loop eq 0 }">
			<c:if test="${user.getId() eq  alreadyRequestedUser.getRequest_to()}">
				<c:set value="1" var="loop"/>
						
						<div class="card my-card">
							<div class="card-body">
								<div class="row">
								
									<div class="col-xs-3">
										<a href="showFindFriendProfile?user_id=${userId}&f_id=${user.id}&type=accept">
										<img src="data:image/jpg;base64,${user.picture_str}" alt="" class="my-img rounded mx-auto d-block ml-md-3">
										</a>
									</div>
									<div class="col">
										
										<h5 class="card-title"><a href="showFindFriendProfile?user_id=${userId}&f_id=${user.id}&type=delete"
										title="view profile" data-toggle="tooltip" data-placement="bottom" class="color-tooltip">
										<c:out value="${user.name }"/></a></h5>
										
										<h6 class="card-subtitle mb-2 text-muted">Works At</h6>
										<p class="card-text">Bio, if provided!</p>
										<div class="card-link row">
											<a href="deleteRequest?userId=${userId}&requestId=${user.id}" class="card-link col col-md-4">Delete Request</a>
											<!-- <a href="rejectRequest?userId=${userId}&contactId=${user.id}" class="card-link col col-md-4">Delete Request</a> -->
										</div>
									</div>
								
								</div>
							</div>
						</div>
			</c:if>
		</c:if>
	</c:forEach>

	<c:if test="${loop eq 0 }">
		
		<div class="card my-card">
			<div class="card-body">
				<div class="row">
				
					<div class="col-xs-3">
						<a href="showFindFriendProfile?user_id=${userId}&f_id=${user.id}&type=accept">
						<img src="data:image/jpg;base64,${user.picture_str}" alt="" class="my-img rounded mx-auto d-block ml-md-3">
						</a>
					</div>
					<div class="col">
						
						<h5 class="card-title"><a href="showFindFriendProfile?user_id=${userId}&f_id=${user.id}&type=request"
						title="view profile" data-toggle="tooltip" data-placement="bottom" class="color-tooltip"><c:out value="${user.name }"/></a></h5>
						
						<h6 class="card-subtitle mb-2 text-muted">Works At</h6>
						<p class="card-text">Bio, if provided!</p>
						<div class="card-link row">
							<a href="sentRequest?userId=${userId}&requestId=${user.id}" class="card-link col col-md-4">Sent Request</a>
							<!-- <a href="rejectRequest?userId=${userId}&contactId=${user.id}" class="card-link col col-md-4">Delete Request</a> -->
						</div>
					</div>
				
				</div>
			</div>
		</div>
			
	</c:if>
	</c:forEach>
	
</div>
	
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>