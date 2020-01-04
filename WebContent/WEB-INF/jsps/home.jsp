<%@page import="java.util.concurrent.TimeUnit"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
			<link rel="stylesheet" 
				href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
			<link rel="stylesheet" href="chat.css">
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
			<title>Chat Application</title>
			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
			<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
			<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
				rel="stylesheet">
			<meta name="viewport"
				content="width=device-width, initial-scale=1, shrink-to-fit=no">
			<link rel="stylesheet"
				href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
<meta name="viewport" content="width=device-width">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://onesignal.github.io/emoji-picker/lib/js/config.js"></script>
<script src="https://onesignal.github.io/emoji-picker/lib/js/util.js"></script>
<script
	src="https://onesignal.github.io/emoji-picker/lib/js/jquery.emojiarea.js"></script>
<script
	src="https://onesignal.github.io/emoji-picker/lib/js/emoji-picker.js"></script>
	<script
	src="https://cdnjs.cloudflare.com/ajax/libs/react/15.3.1/react.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/react/15.3.1/react-dom.js"></script>


<link rel="stylesheet"
	href="https://onesignal.github.io/emoji-picker/lib/css/emoji.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
 -->

<script type="text/javascript">
function openNav() {
  document.getElementById("myNav").style.display = "block";
}

function closeNav() {
  document.getElementById("myNav").style.display = "none";
}

$(document).ready(function () {
    // Handler for .ready() called.
    $('html, body').animate({
        scrollTop: $('#bottom').offset().top
    }, 'slow');
});



function seeBottom() {
  var elmnt = document.getElementById("bottom");
  elmnt.scrollIntoView();
}

</script>

<style>

/*Code for admin status start here*/
* {
	box-sizing: border-box;
}

.row>.column {
	padding: 0 8px;
}

.row:after {
	content: "";
	display: table;
	clear: both;
}

.column {
	float: left;
	width: 25%;
}

/* The Modal (background) */
.modalForAdmin {
	display: none;
	position: fixed;
	z-index: 1;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: black;
}

/* Modal Content */
.adminModal-content {
	position: relative;
	background-color: #fefefe;
	margin: auto;
	padding: 0;
	width: 90%;
	max-width: 1200px;
}

/* The Close Button */
.close {
	color: white;
	position: absolute;
	top: 10px;
	right: 25px;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #999;
	text-decoration: none;
	cursor: pointer;
}

.mySlidesForAdmin {
	display: none;
}

.cursor {
	cursor: pointer;
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	padding: 16px;
	margin-top: -50px;
	color: white;
	font-weight: bold;
	font-size: 20px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	user-select: none;
	-webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

img {
	margin-bottom: -4px;
}

.adminCaption-container {
	text-align: center;
	background-color: black;
	padding: 2px 16px;
	color: white;
}

.demoAdmin {
	opacity: 0.6;
}

.active, .demo:hover {
	opacity: 1;
}

img.hover-shadow {
	transition: 0.3s;
}

.hover-shadow:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
/*Code for admin status end here*/

/*This code is for status */
* {
	box-sizing: border-box;
}

.row>.column {
	padding: 0 8px;
}

.row:after {
	content: "";
	display: table;
	clear: both;
}

.column {
	float: left;
	width: 25%;
}

/* The Modal (background) */
.modalStatusClass {
	display: none;
	position: fixed;
	z-index: 1;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: black;
}

/* Modal Content */
.mymodalStatus-content {
	position: relative;
	background-color: #fefefe;
	margin: auto;
	padding: 0;
	width: 90%;
	max-width: 1200px;
}

.mymodalStatusForAdmin-content {
	position: relative;
	background-color: #fefefe;
	margin: auto;
	padding: 0;
	width: 90%;
	max-width: 1200px;
}

/* The Close Button */
.close {
	color: white;
	position: absolute;
	top: 10px;
	right: 25px;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #999;
	text-decoration: none;
	cursor: pointer;
}

.mySlides {
	display: none;
}

.cursor {
	cursor: pointer;
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	padding: 16px;
	margin-top: -50px;
	color: white;
	font-weight: bold;
	font-size: 20px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	user-select: none;
	-webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

img {
	margin-bottom: -4px;
}

.caption-container {
	text-align: center;
	background-color: black;
	padding: 2px 16px;
	color: white;
}

.demo {
	opacity: 0.6;
}

.active, .demo:hover {
	opacity: 1;
}

.active, .demoAdmin:hover {
	opacity: 1;
}

img.hover-shadow {
	transition: 0.3s;
}

.hover-shadow:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

/* style for status start here */

/* Add padding to container elements */
.container {
	padding: 16px;
}

/* The statusModel (background) */
.statusModel {
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

/* statusModel Content/Box */
.statusModel-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 80%; /* Could be more or less, depending on screen size */
}

/* Style the horizontal ruler */
hr {
	border: 1px solid #f1f1f1;
	margin-bottom: 25px;
}

/* The statusstatusstatusstatusClose Button (x) */
.statusstatusstatusstatusClose {
	position: absolute;
	right: 35px;
	top: 15px;
	font-size: 40px;
	font-weight: bold;
	color: #f1f1f1;
}

.statusstatusstatusstatusClose:hover, .statusstatusstatusstatusClose:focus
	{
	color: #f44336;
	cursor: pointer;
}

/* Clear floats */
.clearfix::after {
	content: "";
	clear: both;
	display: table;
}

/*style for status end here*/
<!--
-->
.dropbtn {
	background-color: #00BDAE;
	color: white;
	padding: 12px;
	font-size: 12px;
	border: none;
	cursor: pointer;
}

.dropbtn:hover, .dropbtn:focus {
	background-color: #2980B9;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	overflow: auto;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown a:hover {
	background-color: #ddd;
}

.show {
	display: block;
}

<!--
-->
<!--
-->
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.9); /* Black w/ opacity */
}

/* Modal Content (image) */
.modal-content {
	margin: auto;
	display: block;
	width: 80%;
	max-width: 700px;
}

/* Caption of Modal Image */
#caption {
	margin: auto;
	display: block;
	width: 80%;
	max-width: 700px;
	text-align: center;
	color: #ccc;
	padding: 10px 0;
	height: 150px;
}

#captionAdmin {
	margin: auto;
	display: block;
	width: 80%;
	max-width: 700px;
	text-align: center;
	color: #ccc;
	padding: 10px 0;
	height: 150px;
}

/* Add Animation */
.modal-content, #caption, #captionAdmin {
	-webkit-animation-name: zoom;
	-webkit-animation-duration: 0.6s;
	animation-name: zoom;
	animation-duration: 0.6s;
}

@
-webkit-keyframes zoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes zoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}

/* The Close Button */
.close {
	position: absolute;
	top: 15px;
	right: 35px;
	color: #f1f1f1;
	font-size: 40px;
	font-weight: bold;
	transition: 0.3s;
}

.close:hover, .close:focus {
	color: #bbb;
	text-decoration: none;
	cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px) {
	.modal-content {
		width: 100%;
	}
}

<!--
-->
<!--
-->
.attach {
	display: inline-block;
	height: 40px;
	width: 40px;
	position: relative;
	text-align: center;
	cursor: pointer;
	margin-left: 10px;
	overflow: hidden;
}

attach {
	opacity: 0;
	position: absolute;
	left: 0;
	width: 100%;
	top: 0;
	height: 100%;
	z-index: 1;
}

.attach:focus, .attach:active {
	background: rgba(255, 255, 255, .2);
}

.attach:before {
	content: '';
	font-family: fontAwesome;
	line-height: 40px;
	font-size: 30px;
	font-weight: normal;
	-webkit-text-stroke: .5px #0af;
}

.attach:before {
	content: '\f0c6';
}

<!--
-->
div.ex3 {
	width: 215px;
	height: 700px;
	overflow: auto;
}

body {
	font-family: 'Lato', sans-serif;
}

.overlay {
	height: 100%;
	width: 100%;
	display: none;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.9);
}

.overlay-content {
	position: relative;
	top: 25%;
	width: 100%;
	text-align: center;
	margin-top: 30px;
}

.overlay a {
	padding: 8px;
	text-decoration: none;
	font-size: 36px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.overlay a:hover, .overlay a:focus {
	color: #f1f1f1;
}

.overlay .closebtn {
	position: absolute;
	top: 20px;
	right: 45px;
	font-size: 60px;
}

@media screen and (max-height: 450px) {
	.overlay a {
		font-size: 20px
	}
	.overlay .closebtn {
		font-size: 40px;
		top: 15px;
		right: 35px;
	}
}

.my-bg {
	background-color: #1ebea5;
}

.my-active {
	background-color: #f4f4f4;
}

.my-pill {
	background-color: #1ebea5;
}

.my-received-message {
	width: 75%;
	background-color: #f5f77c;
}

.my-sender-message {
	width: 75%;
	background-color: #f7f7f7;
}

.my-img {
	height: 30px;
	width: 30px;
}

		.my-margin{
	margin-top: 4rem;
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
.my-img-profile {
	width: 3rem;
	height: 3rem;
}
.my-img-status {
	width: 2rem;
	height: 2rem;
	border: 1.5px solid #1ebea5;
}
.my-white {
	color: #ffffff;
}
		</style>
		


</head>
<body onload="seeBottom()">

	<c:set var="user_id" value="${user_id}" />

	<div id="myNav" class="overlay">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<div class="overlay-content">
			<a href="show-group-form?user_id=<c:out value="${user_id}"/>">New
				group</a>
			<a href="social?user_id=${user_id}&postId=#">See Posts</a>
			<a href="viewProfile?user_id=<c:out value="${user_id}"/>">Profile</a>
			<a href="checkRequest?userId=<c:out value="${user_id}"/>">Friend
				Requests</a> <a href="<c:url value="/logout"/>">LogOut</a>
				
		</div>
	</div>

	<div class="container min-vh-100 border mt-0">
		<div class="row m-4 border">
			<div class="col-4 border-right pl-0 pr-0">
				<nav class="navbar navbar-light my-bg justify-content-center">
					<span class="navbar-brand text-white"
						style="font-size: 20px; cursor: pointer; text-align: left;"
						onclick="openNav()">&#9776;</span> <span
						class="navbar-brand text-white">WhatsApp</span> <span
						class="navbar-brand text-white"
						style="font-size: 20px; cursor: pointer; text-align: right;">

						<span class="material-icons"
						style="font-size: 30px; color: white; width: 10px;"
						onclick="document.getElementById('statusId').style.display='block'">
							&#xe917;</span>
					</span>

				</nav>
			
				<div id="div1" style="height: 500px;position:relative;">
						<div id="div2" style="max-height:115%;overflow:auto;">
							<div id="div3" style="height:auto;">
							
				<!-- <ul class="list-group list-group-flush"> -->
				<div class="list-group">
					
					
						<a href="findFriends?userId=<c:out value="${user_id}"/>" class="list-group-item list-group-item-action flex-column align-items-start ">
							&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-user-plus"
							style="font-size: 24px; color: light green"></i> &nbsp;&nbsp;FIND
							FRIENDS
						</a>
					

					<c:forEach items="${users}" var="user">
						<c:if test="${not empty user.getView()}">
							
								<a href="showChat?contact_id=<c:out value="${user.getId()}"/>&user_id=<c:out value="${user_id }"/>" class="list-group-item list-group-item-action flex-column align-items-start ">
									<div class="d-flex w-100 justify-content-between">
									<div class="mb-1" style="margin-top: 0.2rem;">
										<img src="data:image/jpg;base64,${user.getPicture_str()}" alt="" class="rounded-circle my-img"> 
										&nbsp;
											<c:out value="${user.getName() }" /> 
										
										</div>
										<c:choose>
											<c:when test="${empty user.getConversationDealy()}">
												<small></small>
											</c:when>
											<c:when test="${user.getConversationDealy() == 0}">
												<small>today</small>
											</c:when>
											<c:when test="${user.getConversationDealy() != 0 && user.getConversationDealy()<=10}">
												<small>${user.getConversationDealy()} days ago</small>
											</c:when>
											<c:when test="${user.getConversationDealy() > 10}">
												<small>${user.getLastMessage().getDate()}</small>
											</c:when>
										</c:choose>
									</div>
									<span class="badge badge-primary badge-pill float-right">new</span>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<small>${user.getLastMessage().getMsg() } </small>
								</a>
							
						</c:if>
					</c:forEach>

					<c:forEach items="${groups }" var="group">
						<c:if test="${not empty group.getView()}">
							
								<a href="showGroup?group_id=${group.group_id }&user_id=<c:out value="${user_id}"/>" class="list-group-item list-group-item-action flex-column align-items-start ">
									
									<div class="d-flex w-100 justify-content-between">
										<div class="mb-1" style="margin-top: 0.2rem;">
										<i class="fa fa-users" style="font-size: 24px; color: light green"></i> 
										&nbsp;
										
											<c:out value="${group.getGroup_name()}" /> 
										
										</div>
										<c:choose>
											<c:when test="${empty group.getConversationDealy()}">
												<small> </small>
											</c:when>
											<c:when test="${group.getConversationDealy() == 0}">
												<small>today</small>
											</c:when>
											<c:when test="${group.getConversationDealy() != 0 && group.getConversationDealy()<=10}">
												<small>${group.getConversationDealy()} days ago</small>
											</c:when>
											<c:when test="${group.getConversationDealy() > 10}">
												<small>${group.getLastMessage().getDate()}</small>
											</c:when>
										</c:choose>
									</div>
									<span class="badge badge-primary badge-pill float-right">new</span>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<small>${database.getUser(group.getLastMessage().getSender_id()).getName()}:  ${group.getLastMessage().getMsg() }</small>
								</a>
							
						</c:if>
					</c:forEach>

					<c:forEach items="${users}" var="user">
						<c:if test="${empty user.getView()}">
							<a href="showChat?contact_id=<c:out value="${user.getId()}"/>&user_id=<c:out value="${user_id }"/>" class="list-group-item list-group-item-action flex-column align-items-start ">
									<div class="d-flex w-100 justify-content-between">
									
										
										<div class="mb-1" style="margin-top: 0.2rem;">
										<img src="data:image/jpg;base64,${user.getPicture_str()}" alt="" class="rounded-circle my-img"> 
											&nbsp; <c:out value="${user.getName() }" /> 
										</div>
										
										<c:choose>
											<c:when test="${empty user.getConversationDealy()}">
												<small></small>
											</c:when>
											<c:when test="${user.getConversationDealy() == 0}">
												<small>today</small>
											</c:when>
											<c:when test="${user.getConversationDealy() != 0 && user.getConversationDealy()<=10}">
												<small>${user.getConversationDealy()} days ago</small>
											</c:when>
											<c:when test="${user.getConversationDealy() > 10}">
												<small>${user.getLastMessage().getDate()}</small>
											</c:when>
										</c:choose>
									
									</div>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<c:if test="${not empty user.getLastMessage().getMsg() }">
									<small>${user.getLastMessage().getMsg() }</small>
									</c:if>
									<c:if test="${empty user.getLastMessage().getMsg() }">
									no message
									</c:if>
									
								</a>
						</c:if>
					</c:forEach>
					
					<c:forEach items="${groups }" var="group">
						<c:if test="${empty group.getView()}">
							<a href="showGroup?group_id=${group.group_id }&user_id=<c:out value="${user_id}"/>" class="list-group-item list-group-item-action flex-column align-items-start ">
									
									<div class="d-flex w-100 justify-content-between">
										<div class="mb-1" style="margin-top: 0.2rem;">
										<i class="fa fa-users" style="font-size: 24px; color: light green"></i> 
										&nbsp;
										<c:out value="${group.getGroup_name()}" /> 
										
										</div>
										<c:choose>
											<c:when test="${empty group.getConversationDealy()}">
												<small> </small>
											</c:when>
											<c:when test="${group.getConversationDealy() == 0}">
												<small>today</small>
											</c:when>
											<c:when test="${group.getConversationDealy() != 0 && group.getConversationDealy()<=10}">
												<small>${group.getConversationDealy()} days ago</small>
											</c:when>
											<c:when test="${group.getConversationDealy() > 10}">
												<small>${group.getLastMessage().getDate()}</small>
											</c:when>
										</c:choose>
										
									</div>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<c:if test="${not empty group.getLastMessage().getMsg() }">
										<small>${database.getUser(group.getLastMessage().getSender_id()).getName()}: ${group.getLastMessage().getMsg() }</small>
									</c:if>
									<c:if test="${empty group.getLastMessage().getMsg() }">
										<small>no message</small>
									</c:if>
									
								</a>
						</c:if>
					</c:forEach>
					</div>
				<!-- </ul> -->
			
			</div></div></div>
			</div>

			<!-- FROMO HERE CHAT WINDOW WILL START -->

			<c:choose>

				<c:when test="${ not empty groupobj}">
					<!-- THIS IS FOR GROUP CHAT -->
					<div class="col-8">

						<nav
							class="navbar navbar-light my-bg justify-content-left align-items-center align-middle">
							<!-- <a href="groupInformation?user_id=${user_id}&group_id=${groupobj.group_id}"> -->
							<span> &nbsp;&nbsp;&nbsp;<i class="fa fa-users"
								style="font-size: 28px; color: white"></i> &nbsp;&nbsp;<c:out
									value="${group.getGroup_name()}" /> <span
								class="navbar-brand text-white"><c:out
										value="${groupobj.group_name }"></c:out></span>
							</span>



							<!--  -->

							<div style="text-align: left;">


								<a href="#"> <abbr class="fa fa-paperclip"
									style="font-size: 24px; color: black"></abbr> <input
									id="choose" type="file" name="sendPicture"
									style="display: none;"> <script>
								  $("abbr").on("click", function() {
								    $("input").trigger("click");
								  });
							</script>
								</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="dropdown">
									<button onclick="myFunction()" class="dropbtn">
										<i class="fa fa-ellipsis-v"
											style="font-size: 24px; color: black"></i>
									</button>
									<div id="myDropdown" class="dropdown-content">
										
										<a href="groupInformation?user_id=${user_id}&group_id=${groupobj.group_id}">Group Information</a> 
										<!-- <a href="#home">Home</a> 
										<a href="#about">About</a>
										<a href="#contact">Contact</a>  -->
										<a href="refreshGroup?user_id=<c:out value="${user_id}"/>&group_id=<c:out value="${groupobj.group_id}"/>">
											<i class="fa fa-refresh"
											style="font-size: 18px; color: black"></i> refresh
										</a>
									</div>
								</div>

								<script>
						/* When the user clicks on the button, 
						toggle between hiding and showing the dropdown content */
						function myFunction() {
						  document.getElementById("myDropdown").classList.toggle("show");
						}
						
						// Close the dropdown if the user clicks outside of it
						window.onclick = function(event) {
						  if (!event.target.matches('.dropbtn')) {
						    var dropdowns = document.getElementsByClassName("dropdown-content");
						    var i;
						    for (i = 0; i < dropdowns.length; i++) {
						      var openDropdown = dropdowns[i];
						      if (openDropdown.classList.contains('show')) {
						        openDropdown.classList.remove('show');
						      }
						    }
						  }
						}
						</script>
							</div>


							<!--  -->
						</nav>

						<div id="div1" style="height:530px; position:relative;">
						<div id="div2" style="max-height:105%;overflow:auto;">
							<div id="div3" style="height:auto;padding-bottom: 30px;">
							<div class="chats">
						<c:forEach items="${groupobj.getMessages()}" var="message">

							<c:if test="${message.getSender_id() ne user_id }">
								<div class="row m-1 justify-content-start">
									
										<span class="col-md-9 my-received-message p-2 rounded">

											<c:forEach items="${members }" var="member">
												<c:if test="${member.getId() eq message.getSender_id()}">

													<span><c:out value="${member.getName() }" /></span>: 
			 							${message.getMsg() }
			 							
			 						</c:if>
											</c:forEach>

										</span>
									
									<span class="time-right" style="font-size: 10px;"><c:out
											value="${message.getTime()}" /></span>
								</div>
							</c:if>

							<c:if test="${message.getSender_id() eq user_id }">
								<div class="row m-1 justify-content-end">
									
										<span class="col-md-9 my-sender-message p-2 rounded"> <c:forEach
												items="${members }" var="member">
												<c:if test="${member.getId() eq message.getSender_id()}">

													<span><c:out value="${member.getName() }" /></span>: 
			 							${message.getMsg() }
			 								
			 						</c:if>
											</c:forEach>

										</span> <span class="time-left" style="font-size: 10px;"><c:out
												value="${message.getTime()}" /></span>
									
								</div>
							</c:if>

						</c:forEach>
							<div id="bottom"></div>
						</div></div></div></div>
					
						<sf:form modelAttribute="gmessage" id="msgbox"
							action="sentMessageGroup?user_id=${user_id }&group_id=${groupobj.group_id}&tableName=${groupobj.group_msg_table}"
							method="post">
							<div class="form-row">
								<div class="col mb-2">
									<div class="input-group">


										<div class="input-group-prepend  my-bg">
											<button type="submit" class="my-bg">
												<span class="input-group-text fa my-bg text-white"
													id="validationTooltipUsernamePrepend">&#xf1d9;</span>
											</button>
										</div>

										<sf:input data-emoji-input="unicode" type="text" path="msg"
											data-emojiable="true" name="message" class="form-control"
											id="validationTooltipUsername"
											placeholder="Type your message"
											aria-describedby="validationTooltipUsernamePrepend" />

									</div>
								</div>
							</div>
						</sf:form>
					</div>
				</c:when>

				<c:when test="${ not empty receiver}">
					<!-- THIS IS FOR ONE-TO-ONE CHAT -->
					<div class="col-8">


						<nav
							class="navbar navbar-light my-bg justify-content-left align-items-center align-middle">
							<span> <img id="myImg"
								src="data:image/jpg;base64,${receiver.getPicture_str() }" alt=""
								class="rounded-circle my-img my-bg"> <span
								class="navbar-brand text-white"><c:out
										value="${receiver.getName() }"></c:out></span>
							</span>

							<div id="myModal" class="modal">
								<span class="close">&times;</span> <img class="modal-content"
									id="img01">
								<div id="caption"></div>
							</div>

							<script>
						// Get the modal
						var modal = document.getElementById("myModal");
						
						// Get the image and insert it inside the modal - use its "alt" text as a caption
						var img = document.getElementById("myImg");
						var modalImg = document.getElementById("img01");
						var captionText = document.getElementById("caption");
						img.onclick = function(){
						  modal.style.display = "block";
						  modalImg.src = this.src;
						  captionText.innerHTML = this.alt;
						}
						
						// Get the <span> element that closes the modal
						var span = document.getElementsByClassName("close")[0];
						
						// When the user clicks on <span> (x), close the modal
						span.onclick = function() { 
						  modal.style.display = "none";
						}
						</script>



							<div style="text-align: left;">
							<!-- showMedia?user_id=${user_id }&contact_id=${receiver.getId()} -->
								<abbr class="fa fa-paperclip" style="font-size: 24px; color: black" onclick="openFileBox()"></abbr> 
								
									<sf:form action="insertMedia?user_id=${ user_id}&contact_id=${receiver.getId()}&type=picture" modelAttribute="media" method="post" cssStyle="display:none;">
								
									 <sf:input id="choose" type="file" path="filePath" name="sendPicture" style="display: none;" onchange="clickOnSumbit()"/>
								
									 <button type="submit" id="mediaPicture" style="display: none;"> </button>
									
									</sf:form>
						
									<script>
									var  event_media="a";
			
								  		function openFileBox(){
								  			if(event_media=="a"){
								  				
								  			 $("#choose").trigger("click");
								  			event_media = "b";
								  			
								  			}
								  			 
								  		}
								  		
								  		function clickOnSumbit(){
								  			$("#mediaPicture").trigger("click");
								  		}
								
										</script> 
								<div class="dropdown">
									<button onclick="myFunction()" class="dropbtn">
										<i class="fa fa-ellipsis-v"
											style="font-size: 24px; color: black"></i>
									</button>
									<div id="myDropdown" class="dropdown-content">
										<a href="showReceiver?user_id=${user_id }&contact_id=${receiver.getId()}">profile</a>
										<!-- <a href="#home">Home</a> <a href="#about">About</a>  <a
											href="#contact">Contact</a> -->
											<a href="refresh?user_id=<c:out value="${user_id}"/>&contact_id=<c:out value="${receiver.getId()}"/>">
											<i class="fa fa-refresh"
											style="font-size: 18px; color: black"></i> refresh
										</a>
									</div>
								</div>

								<script>
						/* When the user clicks on the button, 
						toggle between hiding and showing the dropdown content */
						function myFunction() {
						  document.getElementById("myDropdown").classList.toggle("show");
						}
						
						// Close the dropdown if the user clicks outside of it
						window.onclick = function(event) {
						  if (!event.target.matches('.dropbtn')) {
						    var dropdowns = document.getElementsByClassName("dropdown-content");
						    var i;
						    for (i = 0; i < dropdowns.length; i++) {
						      var openDropdown = dropdowns[i];
						      if (openDropdown.classList.contains('show')) {
						        openDropdown.classList.remove('show');
						      }
						    }
						  }
						}
						</script>

							</div>


							<!-- 
					
					 -->
						</nav>
						<div id="div1" style="height:530px; position:relative;">
						<div id="div2" style="max-height:105%;overflow:auto;">
							<div id="div3" style="height:auto;padding-bottom: 30px;">
							<div class="chats">
						<c:forEach items="${messages}" var="message">

							<c:if test="${message.getSender() ne  user_id}">
								<div class="row m-1 justify-content-start">
									
										<span class="col-md-9 my-received-message p-2 rounded">
											${message.getMsg() } </span>
									
									<span class="time-right" style="font-size: 10px;"><c:out
											value="${message.getTime()}" /></span>
								</div>
							</c:if>

							<c:if test="${message.getSender() eq  user_id}">
								<div class="row m-1 justify-content-end">
									
										<span class="col-md-9 my-sender-message p-2 rounded">
											${message.getMsg() } </span>
									
									<span class="time-left" style="font-size: 10px;"><c:out
											value="${message.getTime()}" /></span>
								</div>
							</c:if>

						</c:forEach>
						<div id="bottom"></div>
						</div></div></div></div>
						<form id="msgbox"
							action="send-message?user_id=${user_id }&contact_id=${receiver.getId()}"
							method="post">
							<div class="form-row">
								<div class="col mb-2">
									<div class="input-group">
										<!-- 
								<div class="input-group-prepend ">
										<span class="input-group-text" id="validationTooltipUsernamePrepend">&#x1F600;</span>
								</div>
								 -->
										<div class="input-group-prepend  my-bg">
											<button type="submit" class="my-bg">
												<span class="input-group-text fa my-bg text-white"
													id="validationTooltipUsernamePrepend">&#xf1d9;</span>
											</button>
										</div>
										<!--   -->

										<input data-emoji-input="unicode" type="text"
											data-emojiable="true" name="message" class="form-control"
											id="validationTooltipUsername"
											placeholder="Type your message"
											aria-describedby="validationTooltipUsernamePrepend">

									</div>
								</div>
							</div>
						</form>
						<!-- -->
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>

<!--  -->
	<div id="statusId" class="statusModel">
		<span onclick="document.getElementById('statusId').style.display='none'" class="statusstatusstatusstatusClose" title="statusstatusstatusstatusClose statusModel">&times;</span>
		
		
		<sf:form action="addStatus?user_id=${user_id }" method="post"
			modelAttribute="userStatus">

			<div class="container">

				<h1>Status Of Your Friends</h1>
				<hr>

				<abbr class="fa fa-plus-circle"
					style="font-size: 30px; color: #14FF7A; cursor: pointer;"><span>My
						status</span></abbr>
				<p>Click to add status update</p>
				<sf:input id="choose" type="file" path="statusPicture"
					name="sendPicture" style="display: none;" />
				<script>
			  $("abbr").on("click", function() {
			    $("input").trigger("click");
			  });
		</script>
				<input type="submit" value="addStatus" style="display: none;"></input>


				<!-- -------------------------------------------------------- -->

				<!-- SHOW ADMIN STATUS  -->
				<c:if test="${not empty  admin.getStatus()}">
					<c:set var="adminCount" value="1" />
					<div class="row">
						<c:forEach items="${admin.getStatus() }" var="adminStatus">
							<div class="column">
								<img
									src="data:image/jpg;base64,${adminStatus.getStatusPicture() }"
									onclick="openModalForAdmin();currentSlideForAdmin(${adminCount})"
									class="hover-shadow cursor"
									style="width: 10%; border: 1px solid #ddd; border-radius: 50%; padding: 5px; width: 80px; box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);">

								<a
									href="removeStatus?user_id=${admin.getId() }&status_id=${adminStatus.getId()}">remove</a>

								<c:set var="adminCount" value="${adminCount+1 }" />
							</div>
						</c:forEach>
					</div>

					<div id="myModalForAdmin" class="modalForAdmin">
						<h1 style="text-align: center;">MY STATUS</h1>

						<span class="close cursor" onclick="closeModalForAdmin()">&times;</span>

						<div class="adminModal-content">

							<c:set var="totalAdminCount" value="${adminCount-1}" />
							<c:set var="adminCount" value="1" />
							<c:forEach items="${admin.getStatus() }" var="adminStatus">
								<div class="mySlidesForAdmin">
									<div class="numbertext">
										<c:out value="${adminCount }" />
										/
										<c:out value="${totalAdminCount }" />
									</div>
									<img
										src="data:image/jpg;base64,${adminStatus.getStatusPicture() }"
										style="width: 50%; display: block; margin-left: auto; margin-right: auto;">
									<c:set var="adminCount" value="${adminCount+1 }" />
								</div>
							</c:forEach>

							<a class="prev" onclick="plusSlidesForAdmin(-1)">&#10094;</a> <a
								class="next" onclick="plusSlidesForAdmin(1)">&#10095;</a>

							<div class="adminCaption-container">
								<p id="captionForAdmin"></p>
							</div>

							<c:set var="adminCount" value="1" />
							<c:forEach items="${admin.getStatus() }" var="adminStatus">
								<div class="column">
									<img class="demoAdmin cursor"
										src="data:image/jpg;base64,${adminStatus.getStatusPicture() }"
										style="width: 100%;" onclick="currentSlideForAdmin(${adminCount})"
										alt="At: ${adminStatus.getTime() }">
									<c:set var="adminCount" value="${adminCount+1 }" />
								</div>
							</c:forEach>

						</div>
					</div>
					<!-- THis script code is for status display -->
					<script>
	 
		 function openModalForAdmin() {
			  document.getElementById("myModalForAdmin").style.display = "block";
			}
	
			function closeModalForAdmin() {
			  document.getElementById("myModalForAdmin").style.display = "none";
			}
	
			var slideIndex = 1;
			showSlidesForAdmin(slideIndex);
	
			function plusSlidesForAdmin(n) {
			  showSlidesForAdmin(slideIndex += n);
			}
	
			function currentSlideForAdmin(n) {
			  showSlidesForAdmin(slideIndex = n);
			}
	
			function showSlidesForAdmin(n) {
			  var i;
			  var slides = document.getElementsByClassName("mySlidesForAdmin");
			  var dots = document.getElementsByClassName("demoAdmin");
			  var captionText = document.getElementById("captionForAdmin");
			  if (n > slides.length) {slideIndex = 1}
			  if (n < 1) {slideIndex = slides.length}
			  for (i = 0; i < slides.length; i++) {
			      slides[i].style.display = "none";
			  }
			  for (i = 0; i < dots.length; i++) {
			      dots[i].className = dots[i].className.replace(" active", "");
			  }
			  slides[slideIndex-1].style.display = "block";
			  dots[slideIndex-1].className += " active";
			  captionText.innerHTML = dots[slideIndex-1].alt;
			}
		</script>

				</c:if>

				<!-- -------------------------------------------------------- -->
				<HR>
				<h3 style="text-align: left">Friends Status</h3>
				<HR>

				<c:set var="count" value="1" />
				<c:forEach items="${ users}" var="user">
					<c:if test="${not empty user.getStatus() }">
						<div class="row">
							<c:forEach items="${user.getStatus() }" var="status">
								<div class="column">
									<img id="userStatus"
										src="data:image/jpg;base64,${status.getStatusPicture() }"
										onclick="openModal();currentSlide(${count})"
										class="hover-shadow cursor" alt="status"
										style="width: 10%; border: 1px solid #ddd; border-radius: 50%; padding: 5px; width: 80px; box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);">
									<span style="color: white;">Status By: <c:out value="${user.getName() }" /></span><BR>At: <c:out value="${status.getTime()}" />
									<c:set var="count" value="${count+1 }" />
								</div>
							</c:forEach>
						</div>
						<HR>
					</c:if>
				</c:forEach>

				<c:set var="totalStatusByFriends" value="${count-1}"></c:set>
				<c:set var="count" value="1" />
				<div id="myStatusModalId" class="modalStatusClass">
					<h1 style="text-align: center;">STATUS</h1>
					<span class="close cursor" onclick="closeModal()">&times;</span>
					<div class="mymodalStatus-content">

						<c:forEach items="${ users}" var="user">
							<c:if test="${not empty user.getStatus() }">
								<c:forEach items="${user.getStatus() }" var="status">
									<div class="mySlides">
										<div class="numbertext">
											<c:out value="${count }" />
											/
											<c:out value="${totalStatusByFriends }" />
										</div>
										<img src="data:image/jpg;base64,${status.getStatusPicture() }"
											style="width: 50%; display: block; margin-left: auto; margin-right: auto;">
									</div>
									<c:set var="count" value="${count+1 }" />
								</c:forEach>
							</c:if>
						</c:forEach>

						<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a
							class="next" onclick="plusSlides(1)">&#10095;</a>

						<div class="caption-container">
							<p id="captionAdmin"></p>
						</div>

						<c:set var="count" value="1" />
						<c:forEach items="${ users}" var="user">
							<c:if test="${not empty user.getStatus() }">
								<c:forEach items="${user.getStatus() }" var="status">
									<div class="column">
										<img class="demo cursor"  style="width:100%;" src="data:image/jpg;base64,${status.getStatusPicture() }" onclick="currentSlide(${count})" alt="Status By: ${user.getName() }">
									</div>
									<c:set var="count" value="${count+1 }" />
								</c:forEach>
							</c:if>
						</c:forEach>

					</div>
				</div>

				<!-- THis script code is for status display -->
				<script>
	 
     $(function() {
         // Initializes and creates emoji set from sprite sheet
         window.emojiPicker = new EmojiPicker({
           emojiable_selector: '[data-emojiable=true]',
           assetsPath: 'http://onesignal.github.io/emoji-picker/lib/img/',
           popupButtonClasses: 'fa fa-smile-o'
         });
         // Finds all elements with `emojiable_selector` and converts them to rich emoji input fields
         // You may want to delay this step if you have dynamically created input fields that appear later in the loading process
         // It can be called as many times as necessary; previously converted input fields will not be converted again
         window.emojiPicker.discover();
       });
	 
		function openModal() {
		  document.getElementById("myStatusModalId").style.display = "block";
		}
		
		function closeModal() {
		  document.getElementById("myStatusModalId").style.display = "none";
		}
		
		var slideIndex = 1;
		showSlides(slideIndex);
		
		function plusSlides(n) {
		  showSlides(slideIndex += n);
		}
		
		function currentSlide(n) {
		  showSlides(slideIndex = n);
		}
		
		function showSlides(n) {
		  var i;
		  var slides = document.getElementsByClassName("mySlides");
		  var dots = document.getElementsByClassName("demo");
		  var captionText = document.getElementById("captionAdmin");
		  if (n > slides.length) {slideIndex = 1}
		  if (n < 1) {slideIndex = slides.length}
		  for (i = 0; i < slides.length; i++) {
		      slides[i].style.display = "none";
		  }
		  for (i = 0; i < dots.length; i++) {
		      dots[i].className = dots[i].className.replace(" active", "");
		  }
		  slides[slideIndex-1].style.display = "block";
		  dots[slideIndex-1].className += " active";
		  captionText.innerHTML = dots[slideIndex-1].alt;
		}
		</script>


			</div>
		</sf:form>

	</div>


</body>
<script>
// Get the statusModel
var statusModel = document.getElementById('statusId');

// When the user clicks anywhere outside of the statusModel, statusstatusstatusstatusClose it
window.onclick = function(event) {
  if (event.target == statusModel) {
    statusModel.style.display = "none";
  }
}
</script>
</html>