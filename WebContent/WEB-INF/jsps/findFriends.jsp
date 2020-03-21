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
<script
			src="https://kit.fontawesome.com/81c2c05f29.js"
			crossorigin="anonymous"
		></script>

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

@import url('https://fonts.googleapis.com/css?family=Roboto:300,400,500&display=swap');
* {
	margin: 0;
	padding: 0;
}
/* body {
	background: #1ebea5;
	font-size: 14px;
	position: relative;
	font-family: 'Roboto', sans-serif;
} */
.navigation {
	position: fixed;
	left: -70px;
	top: 0;
	bottom: 0;
	background: #f6f4f3;
	border-right: 1px solid #1ebea5;
	display: flex;
	flex-direction: column;
	justify-content: center;
	transition: 0.2s ease-in-out left;
	box-shadow: 3px 0 6px rgba(0, 0, 0, 0.1);
}
.open {
	left: 0;
}
.nav-list {
	text-align: center;
	list-style: none;
}
.nav-item {
	padding: 16px 10px;
	transition: 0.1s ease-in-out transform;
}
.link {
	color: #fff;
	text-decoration: none;
}
.icon-nav {
	font-size: 40px;/* 1.5em; */
	margin-bottom: 5px;
	color: #1ebea5;
	text-shadow: 3px 0 6px rgba(0, 0, 0, 0.1);
}
.label {
	font-size: 10px;/* 0.6em; */
	font-weight: 300;
	opacity: 0;
	transition: 0.2s ease-in-out opacity;
	color: black;
}
.nav-item:hover {
	transform: scale(1.2);
	transform-origin: center center;
}
.nav-item:hover .label {
	opacity: 1;
}
.trigger {
	position: absolute;
	top: 20px;
	left: 90px;
	width: 20px;
	height: 20px;
	cursor: pointer;
	color: #fff;
	transition: 0.15s ease-in-out transform;
}
.rotate-trigger {
	transform: rotate(180deg);
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

<c:set var="user_id" value="${userId }"></c:set>

<div class="navigation open">
			<div class="trigger"><i class="fas fa-chevron-left trigger-icon icon-nav"></i></div>

			<ul class="nav-list">
				<!-- Home link -->
				<li class="nav-item">
					<a href="showHome?user_id=${user_id }" class="link">
						<i class="fas fa-home icon-nav"></i>
						</br>
						<span class="label">Home</span>
					</a>
				</li>
				<!-- About link -->
				<li class="nav-item">
					<a href="viewProfile?user_id=<c:out value="${user_id}"/>" class="link">
						<i class="fa fa-user-circle icon-nav"></i>
						</br>
						<span class="label">Profile</span>
					</a>
				</li>
				<li class="nav-item">
					<a href="show-group-form?user_id=<c:out value="${user_id}"/>" class="link">
						<i class="fas fa-group icon-nav"></i>
						</br>
						<span class="label">New group</span>
					</a>
				</li>
				<li class="nav-item">
					<a href="viewAllPosts?user_id=${user_id}&prev=${0}&next=${1}&postId=#" class="link">
						<i class="fa fa-id-badge icon-nav"></i>
						</br>
						<span class="label">Posts</span>
					</a>
				</li>
				<li class="nav-item">
					<a href="checkRequest?userId=<c:out value="${user_id}"/>" class="link">
						<i class="fa fa-user-plus icon-nav"></i>
						</br>
						<span class="label">Friend Request</span>
					</a>
				</li>
				<li class="nav-item">
					<a href="#" onclick="document.getElementById('statusId').style.display='block'" class="link">
						<i class="fa fa-eye icon-nav"></i>
						</br>
						<span class="label">Status</span>
					</a>
				</li>
					
				<li class="nav-item">
					<a href="<c:url value="/logout"/>" class="link">
						<i class="fas fa-sign-out-alt fa-rotate-180 icon-nav"></i>
						</br>
						<span class="label">Logout</span>
					</a>
				</li>
			</ul>
</div>

<div class="container my-margin">

	<H1>LIST OF RECOMMENDED USERS</H1>

	<c:forEach items="${recommendUser }" var="user">
	
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
										
										<h6 class="card-subtitle mb-2 text-muted">Friends: ${user.getContacts().size() }</h6>
										<p class="card-text">Posts: ${user.getPosts().size() }</p>
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
										
										<h6 class="card-subtitle mb-2 text-muted">Friends: ${user.getContacts().size() }</h6>
										<p class="card-text">Posts: ${user.getPosts().size() }</p>
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
						
						<h6 class="card-subtitle mb-2 text-muted">Friends: ${user.getContacts().size() } </h6>
										<p class="card-text">Posts: ${user.getPosts().size() }</p>
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


	<H1>LIST OF USERS</H1>
	
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
										
										<h6 class="card-subtitle mb-2 text-muted">Friends: ${user.getContacts().size() }</h6>
										<p class="card-text">Posts: ${user.getPosts().size() }</p>
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
										
										<h6 class="card-subtitle mb-2 text-muted">Friends: ${user.getContacts().size() }</h6>
										<p class="card-text">Posts: ${user.getPosts().size() }</p>
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
						
						<h6 class="card-subtitle mb-2 text-muted">Friends: ${user.getContacts().size() }</h6>
										<p class="card-text">Posts: ${user.getPosts().size() }</p>
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

<script type="text/javascript">

//for vertical-nav
const trigger = document.querySelector('.trigger');
const nav = document.querySelector('.navigation');

const toggleClass = (element, className) => element.classList.toggle(className);

trigger.addEventListener('click', () => {
	toggleClass(nav, 'open');
	toggleClass(trigger, 'rotate-trigger');
});
</script>

</body>
</html>