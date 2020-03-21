<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
			src="https://kit.fontawesome.com/81c2c05f29.js"
			crossorigin="anonymous"
		></script>
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
	color: #fff;
}
.my-text{
	color: #1ebea5;
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
<%-- <h1>Group form</h1>

<h4>
<a href="showHome?user_id=<c:out value="${user_id}"/>">Go Home</a>
</h4>
 --%>
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

<c:set var="user_id" value="${user_id }"></c:set>
<c:set var="admin_id" value="${user_id }"></c:set>
<c:set var="contacts" value="${contacts }"></c:set>
<div class="container my-margin">
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">Create a Group</h5>
			<p class="card-text">Create a group for your family, friends and closed ones.</p>
			<sf:form action="create-group" method="post" modelAttribute="group">
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">Group Name</label>
					<div class="col-sm-10">
						<sf:hidden path="admin_id" name="admin_id" />
						<sf:input path="group_name" class="form-control" id="inputName" name="group_name" placeholder="ex: School Gang"/>
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">Description</label>
					<div class="col-sm-10">
						<sf:input path="description" class="form-control" name="description" placeholder="ex: Besties forever"/>
					</div>
				</div>
				Select Group Members:
				<ul class="list-group list-group-flush">
					<c:forEach items="${contacts}" var="contact">
						<div class="input-group container">
							<div class="input-group-prepend">
								<div class="input-group-text">
									
									<sf:checkbox style="font-size: 5px;" class="form-control" path="Members_id" name="Members_id" value="${contact.getContact_id() }" label="${contact.getName()}"/>
									
								</div>
							</div>
						</div>
					</c:forEach>	
				</ul>
				<div class="card-body">
					<input type="submit" class="btn my-bg align-self-center" value="Create new Group">
				</div>
			</sf:form>
		</div>
	</div>	
</div>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>

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

</html>