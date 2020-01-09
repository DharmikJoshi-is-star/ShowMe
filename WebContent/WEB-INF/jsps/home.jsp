
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
	<!-- START FOR TOOL TIP -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- END FOR TOOL TIP -->

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

<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet"
	href="https://onesignal.github.io/emoji-picker/lib/css/emoji.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	
 <script src='https://kit.fontawesome.com/a076d05399.js'></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		
	
	
<!-- 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
 -->
 
<!--   
  <span class="entypo-user-add"></span>
   <span class="entypo-thumbs-up"></span>
   <span class="entypo-picture"></span>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->

<script type="text/javascript">
function openNav() {
  document.getElementById("myNav").style.display = "block";
}

/*START FOR TOOL TIP*/
$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();   
});
/*END FOR TOOL TIP*/

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


/*START FOR TOOL TIP*/
.color-tooltip + .tooltip > .tooltip-inner {background-color: #1ebea5;}
.color-tooltip + .tooltip > .tooltip-arrow { border-bottom-color:#1ebea5; }
/*END FOR TOOL TIP*/


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
	height: 40px;
	width: 40px;
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

.sticky {
  position: -webkit-sticky;
  position: sticky;
  top: 0;
  }
  
 body { 
    /* Image Location */ 
    background-image: C:\Users\Dharmik joshi\Pictures\Saved Picturesbackground.png;/*url("https%3A%2F%2Fcrew.bet%2Fwp-content%2Fuploads%2F2017%2F02%2Fbet-blocks-bg-purple.png%3Fid%3D2014"); */
  
    /* Background image is centered vertically and horizontally at all times */ 
    background-position: center center; 
    background-repeat: no-repeat; 
    background-attachment: fixed; 
    background-size: cover; 
    background-color: #f2f2f2; 
    /* Font Colour */ 
    color:white; 
} 

</style>
		


</head>
<body onload="seeBottom()">

	<c:set var="user_id" value="${user_id}" />

	<div id="myNav" class="overlay">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<div class="overlay-content">
			<a href="show-group-form?user_id=<c:out value="${user_id}"/>" >New
				group</a>
			<a href="social?user_id=${user_id}&postId=#"><i class="fa fa-globe" style="font-size:40px;"></i>Posts</a>
			<a href="viewProfile?user_id=<c:out value="${user_id}"/>"><i class="fa fa-user-circle-o" style="font-size:40px;"></i>Profile</a>
			<a href="checkRequest?userId=<c:out value="${user_id}"/>">Friend Requests</a> 
			<a href="<c:url value="/logout"/>"><i class='fas fa-sign-out-alt fa-rotate-180' style='font-size:40px;'></i>LogOut</a>
				
		</div>
	</div>

	<div class="container min-vh-100 border mt-0 " style="background-color: #ffffff;">
		<div class="row m-4 border">
			<div class="col-4 border-right pl-0 pr-0">
				<nav class="navbar navbar-light my-bg justify-content-center">
					<span class="navbar-brand text-white"
						style="font-size: 20px; cursor: pointer; text-align: left;"
						onclick="openNav()" title="menu" data-toggle="tooltip" data-placement="bottom" class="color-tooltip">&#9776;</span> <span
						class="navbar-brand text-white">WhatsApp</span> <span
						class="navbar-brand text-white"
						style="font-size: 20px; cursor: pointer; text-align: right;">

						<span class="material-icons"
						style="font-size: 30px; color: white; width: 10px;"
						onclick="document.getElementById('statusId').style.display='block'">
						
							
								<a data-toggle="tooltip" data-placement="bottom" class="color-tooltip"><i class="fa fa-spinner" 
								title=status data-toggle="tooltip" data-placement="bottom" class="color-tooltip"></i></a>
						
						</span>
					</span>

				</nav>
			
				<div id="div1" style="height: 500px;position:relative;">
					
						
					<!-- 
					 <a href="findFriends?userId=<c:out value="${user_id}"/>" class="list-group d-flex w-100 justify-content-between">
							&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-user-plus"
							style="font-size: 40px; color: light green"></i> &nbsp;&nbsp;FIND
							FRIENDS
					</a>
					  -->
						<div id="div2" style="max-height:115%;overflow:auto;">
						
							<div id="div3" style="height:auto;">

				<!-- <ul class="list-group list-group-flush"> -->
				<div class="list-group">
					
					<a href="findFriends?userId=<c:out value="${user_id}"/>" class="list-group-item list-group-item-action flex-column align-items-start sticky">
							&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-user-plus"
							style="font-size: 35px; color: light green;"></i> &nbsp;&nbsp;
							<b>FIND FRIENDS</b>
					</a>
					
					<c:forEach items="${conversationList}" var="conversation">
						
						<c:choose>
							<c:when test="${not empty conversation.getUser() }">
							
								<a href="showChat?contact_id=<c:out value="${conversation.getUser().getId()}"/>&user_id=<c:out value="${user_id }"/>" class="list-group-item list-group-item-action flex-column align-items-start ">
									<div class="d-flex w-100 justify-content-between">
									<div class="mb-1" style="margin-top: 0.2rem;">
										<img src="data:image/jpg;base64,${conversation.getUser().getPicture_str()}" alt="" class="rounded-circle my-img"> 
										&nbsp;
											<c:out value="${conversation.getUser().getName() }" /> 
										
										</div>
										<c:choose>
											<c:when test="${empty conversation.getConversationDealy()}">
												<small></small>
											</c:when>
											<c:when test="${conversation.getConversationDealy() == 0}">
												<small>today</small>
											</c:when>
											<c:when test="${conversation.getConversationDealy() == 1}">
												<small>yesterday</small>
											</c:when>
											<c:when test="${conversation.getConversationDealy() != 0 && conversation.getConversationDealy()<=10}">
												<small>${conversation.getConversationDealy()} days ago</small>
											</c:when>
											<c:when test="${conversation.getConversationDealy() > 10}">
												<small>${conversation.getUser().getLastMessage().getDate()}</small>
											</c:when>
										</c:choose>
									</div>
									<c:if test="${not empty conversation.getUser().getView()}">
									<span class="badge badge-primary badge-pill float-right">new</span>
									</c:if>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<c:choose>
										<c:when  test="${not empty conversation.getUser().getLastMessage().getMediaType() }">
										
											<c:if  test="${conversation.getUser().getLastMessage().getMediaType() == 'PICTURE' }">
											
												<i class="fa fa-camera" style="color:lightgray"></i> &nbsp;	photo
											</c:if>
											<c:if  test="${conversation.getUser().getLastMessage().getMediaType() == 'DOCUMENT' }">
											
												<i class="fa fa-file-pdf-o" style="color:lightgray"></i> &nbsp;  ${conversation.getUser().getLastMessage().getMediaFileName() } PDF
										
											</c:if>
										</c:when>
										
										<c:when  test="${empty conversation.getUser().getLastMessage().getMediaType() }">
											<small>${conversation.getUser().getLastMessage().getMsg() }</small>
										</c:when>
										<c:when test="${empty conversation.getUser().getLastMessage().getMsg() }">
											no message
										</c:when>
										
									</c:choose>
									
								</a>
						
								
							</c:when>
							
							<c:when test="${not empty conversation.getGroup() }">
							
							
							
							<a href="showGroup?group_id=${conversation.getGroup().group_id }&user_id=<c:out value="${user_id}"/>" class="list-group-item list-group-item-action flex-column align-items-start ">
									
									<div class="d-flex w-100 justify-content-between">
										<div class="mb-1" style="margin-top: 0.2rem;">
										<i class="fa fa-users" style="font-size: 35px; color: light green"></i> 
										&nbsp;
										
											<c:out value="${conversation.getGroup().getGroup_name()}" /> 
										
										</div>
										<c:choose>
											<c:when test="${empty conversation.getConversationDealy()}">
												<small> </small>
											</c:when>
											<c:when test="${conversation.getConversationDealy() == 0}">
												<small>today</small>
											</c:when>
											<c:when test="${conversation.getConversationDealy() != 0 && conversation.getConversationDealy()<=10}">
												<small>${conversation.getConversationDealy()} days ago</small>
											</c:when>
											<c:when test="${conversation.getConversationDealy() > 10}">
												<small>${conversation.getGroup().getLastMessage().getDate()}</small>
											</c:when>
										</c:choose>
									</div>
									<c:if test="${not empty conversation.getGroup().getView()}">
									<span class="badge badge-primary badge-pill float-right">new</span>
									</c:if>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									
									<c:choose>
										
										<c:when  test="${not empty conversation.getGroup().getLastMessage().getMediaType() }">
										
											<c:if  test="${conversation.getGroup().getLastMessage().getMediaType() == 'PICTURE' }">
											
												 ${conversation.getGroup().getLastMessage().getSender_name()}: <i class="fa fa-camera" style="color:lightgray"></i> &nbsp;	Photo
											</c:if>
											
										
											<c:if  test="${conversation.getGroup().getLastMessage().getMediaType() == 'DOCUMENT' }">
											
												${conversation.getGroup().getLastMessage().getSender_name()}: <i class="fa fa-file-text" style="color:lightgray"></i> &nbsp; ${group.getLastMessage().getMediaFileName() } PDF
										
											</c:if>
											
										</c:when>
										
										<c:when  test="${empty conversation.getGroup().getLastMessage().getMediaType() }">
											<c:if test="${not empty conversation.getGroup().getLastMessage().getMsg() }">
												${conversation.getGroup().getLastMessage().getSender_name()}: <small>${conversation.getGroup().getLastMessage().getMsg() }</small>
											</c:if>
											
											<c:if test="${empty conversation.getGroup().getLastMessage().getMsg() }">
												no message
											</c:if>
										</c:when>
									
									</c:choose>
									
								</a>
					
							
							</c:when>
						</c:choose>
		
					</c:forEach>
<!-- 
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
									<c:choose>
										<c:when  test="${not empty user.getLastMessage().getMediaType() }">
										
											<c:if  test="${user.getLastMessage().getMediaType() == 'PICTURE' }">
											
												<i class="fa fa-camera" style="color:lightgray"></i> &nbsp;	Photo
											</c:if>
											<c:if  test="${user.getLastMessage().getMediaType() == 'DOCUMENT' }">
											
												<i class="fa fa-file-text" style="color:lightgray"></i> &nbsp; ${user.getLastMessage().getMediaFileName() } PDF
										
											</c:if>
										</c:when>
										
										<c:when  test="${empty user.getLastMessage().getMediaType() }">
											
											<c:if test="${ not empty user.getLastMessage().getMsg() }">
												<small>${user.getLastMessage().getMsg() }</small>
											</c:if>
										
											<c:if test="${empty user.getLastMessage().getMsg() }">
												no message
											</c:if>
											
										</c:when>
									
									</c:choose>
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
									<c:choose>
										<c:when  test="${not empty group.getLastMessage().getMediaType() }">
										
											<c:if  test="${group.getLastMessage().getMediaType() == 'PICTURE' }">
											
												 ${group.getLastMessage().getSender_name()}: <i class="fa fa-camera" style="color:lightgray"></i> &nbsp;	Photo
											</c:if>
											<c:if  test="${group.getLastMessage().getMediaType() == 'DOCUMENT' }">
											
												${group.getLastMessage().getSender_name()}: <i class="fa fa-file-text" style="color:lightgray"></i> &nbsp; ${group.getLastMessage().getMediaFileName() } PDF
										
											</c:if>
										</c:when>
										
										<c:when  test="${empty group.getLastMessage().getMediaType() }">
										
											<c:if test="${not empty group.getLastMessage().getMsg() }">
												${group.getLastMessage().getSender_name()}: <small>${group.getLastMessage().getMsg() }</small>
											</c:if>
											
											<c:if test="${empty group.getLastMessage().getMsg() }">
												no message
											</c:if>
											
										</c:when>
										
									</c:choose>
									
								</a>
						</c:if>
					</c:forEach>
					-->
					</div>
				<!-- </ul> -->
			
			</div></div></div>
			</div>

			<!-- FROMO HERE CHAT WINDOW WILL START -->

			<c:choose>


				<c:when test="${groupobj == null && receiver == null}">
					<div class="col-8" style="background-color: #ffffff;">
					
						
							<div style="text-align: center; padding-top: 20px; padding-bottom: 20px;">
							
						
							<img width="600" align="middle" height="600" style='opacity: 0.5;filter: alpha(opacity=50);' src="data:image/jpg;base64,${admin.getPicture_str()}"> 
							
								<!--<img width="600" align="middle" height="600" style='opacity: 0.5;filter: alpha(opacity=50); ' 
							src="https%3A%2F%2Fcrew.bet%2Fwp-content%2Fuploads%2F2017%2F02%2Fbet-blocks-bg-purple.png%3Fid%3D2014&imgrefurl=https%3A%2F%2Fcrew.bet%2F&docid=vlXieFs5pN2iyM&tbnid=b1rnPBZBPJ2juM%3A&vet=10ahUKEwjqteaHiPTmAhVP63MBHcrJAfwQMwiQASgdMB0..i&w=1800&h=1200&bih=722&biw=1536&q=background%20images%20for%20a%20chat%20applications&ved=0ahUKEwjqteaHiPTmAhVP63MBHcrJAfwQMwiQASgdMB0&iact=mrc&uact=8">
							-->
								
					
						</div>
						
					</div>
				</c:when>

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
								
								
								<abbr class="fa fa-paperclip" id="chooseDocGroup" style="font-size: 24px; cursor: pointer;color: white" 
								title="select pdf" data-toggle="tooltip" data-placement="bottom" class="color-tooltip"></abbr>
							 &nbsp; &nbsp;	
							<sf:form 
								action="insertMediaToGroup?user_id=${ user_id}&group_id=${groupobj.group_id}&type=document" 
									modelAttribute="media" 
										method="post" 
											cssStyle="display:none;"
												name = "mediaFormForDocumentGroup"
												autocomplete="on">
								
							 <sf:input id="chooseDocumentGroup" type="file" path="filePath" name="sendDocument"  style="display: none;" />
					
							 <button type="submit" id="mediaDocumentGroup" style="display: none;"> </button>
							
							</sf:form>
					
						
								<script>
									var  event_media="a";
											
									 $("#chooseDocGroup").on("click", function(e) {
										  e.preventDefault();
										  e.stopPropagation();
									    $("#chooseDocumentGroup").trigger("click");
									  });
									 
									 $("#chooseDocumentGroup").on("change", function(e) {
										  e.preventDefault();
										  e.stopPropagation();
									    $("#mediaDocumentGroup").trigger("click");
									  });
									
								</script> 
								
								<abbr class="fa fa-camera" id="choosePictureGroup" style="font-size: 24px; color: white ; cursor: pointer;" 
								title="select picture" data-toggle="tooltip" data-placement="bottom" class="color-tooltip"></abbr> 
								 &nbsp; &nbsp;	
									<sf:form action="insertMediaToGroup?user_id=${ user_id}&group_id=${groupobj.group_id}&type=picture" modelAttribute="media" method="post" cssStyle="display:none;">
								
									 <sf:input id="chooseGroup" type="file" path="filePath" name="sendPicture" style="display: none;" 
									/>
								
									 <button type="submit" id="mediaPictureGroup" style="display: none;"> </button>
									
									</sf:form>
						
									<script>

									var  event_media="a";
									
									 $("#choosePictureGroup").on("click", function(e) {
										  e.preventDefault();
										  e.stopPropagation();
									    $("#chooseGroup").trigger("click");
									  });
									
									 $("#chooseGroup").on("change", function(e) {
										  e.preventDefault();
										  e.stopPropagation();
									    $("#mediaPictureGroup").trigger("click");
									  });
									
									</script> 
										
								
								
								<div class="dropdown">
									<button onclick="myFunction()" class="dropbtn">
										<i class="fa fa-ellipsis-v"
											style="font-size: 24px; "></i>
									</button>
									<div id="myDropdown" class="dropdown-content">
										
										<a href="groupInformation?user_id=${user_id}&group_id=${groupobj.group_id}">Group Information</a> 
										<!-- <a href="#home">Home</a> 
										<a href="#about">About</a>
										<a href="#contact">Contact</a>  -->
										<a href="refreshGroup?user_id=<c:out value="${user_id}"/>&group_id=<c:out value="${groupobj.group_id}"/>">
											<i class="fa fa-refresh"
											style="font-size: 18px; color:black;"></i> refresh
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

													<span style="font-size: 10px; color: green;font-family:inherit;"><b><c:out value="${member.getName() }" /></b></span>
													<br>
													<c:choose>
												<c:when test="${empty message.getMediaType() }">
													${message.getMsg() }
												</c:when>
												
												<c:when test="${not empty message.getMediaType() }">
												
													<c:if test="${message.getMediaType() == 'PICTURE' }">
													<a href="data:image/jpg;base64,${message.getMediaPicture() }" 
													title="click to download picture" data-toggle="tooltip" data-placement="bottom" class="color-tooltip"
													download="${message.getMediaFileName()}.jpg">
															<img width="200" height="200" src="data:image/jpg;base64,${message.getMediaPicture() }"
															download="${message.getMediaFileName()}.jpg">
														</a>
													</c:if>
													
													<c:if test="${message.getMediaType() == 'DOCUMENT' }">
														 <p>
														 
														 <!-- href="data:application/pdf;base64,${message.getMediaDocument() }" -->
														<a  
														target="_blank" onclick="OpenSesame(${message.getMediaDocument()})"
														href="data:application/pdf;base64,${message.getMediaDocument() }"
														title="click to download pdf" data-toggle="tooltip" data-placement="bottom" class="color-tooltip"
														download="${message.getMediaFileName()}.pdf" >
														
														<i class="far fa-file-pdf" style="font-size:48px"></i>
														${message.getMediaFileName()}.pdf</a> 
														 
														 </p>
													<script>
														function OpenSesame(fileName) {
														 
														  var dataURI = "data:application/pdf;base64," +fileName;
														  window.open(dataURI);
														 
														}
													</script>
														<!-- <object width="200" height="200" data="data:application/pdf;base64,${message.getMediaDocument() }"></object>
													 -->
												</c:if>
												
												</c:when>
												
												
											</c:choose>
												
			 									</c:if>
							</c:forEach>

										</span>
									
									<span class="time-right" style="font-size: 10px;"><c:out
											value="${message.getTime()}" /></span>
								</div>
							</c:if>

							<c:if test="${message.getSender_id() eq user_id }">
								<div class="row m-1 justify-content-end">
									
										<span class="col-md-9 my-sender-message p-2 rounded"> 
										<c:forEach
												items="${members }" var="member">
												<c:if test="${member.getId() eq message.getSender_id()}">
													<span style="font-size: 10px; color: red;font-family:inherit;"><b><c:out value="${member.getName() }" /></b></span>
													<br>
													
			 									<c:choose>
												<c:when test="${empty message.getMediaType() }">
													${message.getMsg() }
												</c:when>
												
												<c:when test="${not empty message.getMediaType() }">
												
													<c:if test="${message.getMediaType() == 'PICTURE' }">
													<a href="data:image/jpg;base64,${message.getMediaPicture() }" 
													title="click to download picture" data-toggle="tooltip" data-placement="bottom" class="color-tooltip"
													download="${message.getMediaFileName()}.jpg">
															<img width="200" height="200" src="data:image/jpg;base64,${message.getMediaPicture() }"
															download="${message.getMediaFileName()}.jpg">
														</a>
													</c:if>
													
													<c:if test="${message.getMediaType() == 'DOCUMENT' }">
														 <p>
														 
														 <!-- href="data:application/pdf;base64,${message.getMediaDocument() }" -->
														<a  
														target="_blank" onclick="OpenSesame(${message.getMediaDocument()})"
														href="data:application/pdf;base64,${message.getMediaDocument() }"
														title="click to download picture" data-toggle="tooltip" data-placement="bottom" class="color-tooltip"
														download="${message.getMediaFileName()}.pdf" >
														
														<i class="far fa-file-pdf" style="font-size:48px"></i>
														${message.getMediaFileName()}.pdf</a> 
														 
														 </p>
													<script>
														function OpenSesame(fileName) {
														 
														  var dataURI = "data:application/pdf;base64," +fileName;
														  window.open(dataURI);
														 
														}
													</script>
														<!-- <object width="200" height="200" data="data:application/pdf;base64,${message.getMediaDocument() }"></object>
													 -->
												</c:if>
												
												</c:when>
												
												
											</c:choose>
												
			 								
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
								class="rounded-circle my-img my-bg" style="cursor: pointer;"
								title="click to view profile" data-toggle="tooltip" data-placement="bottom" class="color-tooltip"> <span
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
							<!-- onclick="openFileBoxForDocument()" onchange="clickOnDocumentSumbit()"-->
							<abbr class="fa fa-paperclip" id="chooseDoc" style="font-size: 24px; cursor: pointer;color: white" 
							title="select pdf" data-toggle="tooltip" data-placement="bottom" class="color-tooltip"></abbr>
							 &nbsp; &nbsp;	
							<sf:form 
								action="insertMedia?user_id=${ user_id}&contact_id=${receiver.getId()}&type=document" 
									modelAttribute="media" 
										method="post" 
											cssStyle="display:none;"
												name = "mediaFormForDocument"
												autocomplete="on">
								
							 <sf:input id="chooseDocument" type="file" path="filePath" name="sendDocument"  style="display: none;" />
					
							 <button type="submit" id="mediaDocument" style="display: none;"> </button>
							
							</sf:form>
					
							<!--
							<form 
								action="insertMedia?user_id=${ user_id}&contact_id=${receiver.getId()}&type=document" 
								  enctype="multipart/form-data"
									
										method="post" 
											style="display:none;"
												autocomplete="on">
								
							 <input id="chooseDocument" type="file" name="filePath" style="display: none;" >
						
							 <button type="submit" id="mediaDocument" style="display: none;"> </button>
							
							</form>
							-->
								<script>
									var  event_media="a";
											
									 $("#chooseDoc").on("click", function(e) {
										  e.preventDefault();
										  e.stopPropagation();
									    $("#chooseDocument").trigger("click");
									  });
									 
									 $("#chooseDocument").on("change", function(e) {
										  e.preventDefault();
										  e.stopPropagation();
									    $("#mediaDocument").trigger("click");
									  });
									 
									 
									/*
								  		function openFileBoxForDocument(){
								  			if(event_media=="a"){
								  				
								  			 $("#chooseDocument").trigger("click");
								  			event_media = "b";
								  			
								  			}
								  			 
								  		}
								  		
								  		function clickOnDocumentSumbit(){
								  			$("#mediaDocument").trigger("click");
								  		}
								*/
								</script> 
							
							<!-- onclick="openFileBox()" onchange="clickOnSumbit()"-->
							<!-- showMedia?user_id=${user_id }&contact_id=${receiver.getId()} -->
								<abbr class="fa fa-camera" id="choosePicture" style="font-size: 24px; color: white ; cursor: pointer;" 
								title="select picture" data-toggle="tooltip" data-placement="bottom" class="color-tooltip"></abbr> 
								 &nbsp; &nbsp;	
									<sf:form action="insertMedia?user_id=${ user_id}&contact_id=${receiver.getId()}&type=picture" modelAttribute="media" method="post" cssStyle="display:none;">
								
									 <sf:input id="choose" type="file" path="filePath" name="sendPicture" style="display: none;" 
									/>
								
									 <button type="submit" id="mediaPicture" style="display: none;"> </button>
									
									</sf:form>
						
									<script>

									var  event_media="a";
									
									 $("#choosePicture").on("click", function(e) {
										  e.preventDefault();
										  e.stopPropagation();
									    $("#choose").trigger("click");
									  });
									
									 $("#choose").on("change", function(e) {
										  e.preventDefault();
										  e.stopPropagation();
									    $("#mediaPicture").trigger("click");
									  });
									 
									 /*
								  		function openFileBox(){
								  			if(event_media=="a"){
								  				
								  			 $("#choose").trigger("click");
								  			event_media = "b";
								  			
								  			}
								  			 
								  		}
								  		
								  		function clickOnSumbit(){
								  			
								  			$("#mediaPicture").trigger("click");
								  		}
								*/
										</script> 
										
								<div class="dropdown">
									<button onclick="myFunction()" class="dropbtn">
										<i class="fa fa-ellipsis-v"
											style="font-size: 24px; "></i>
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
											
											<c:choose>
												<c:when test="${empty message.getMediaType() }">
													${message.getMsg() }
												</c:when>
												
												<c:when test="${not empty message.getMediaType() }">
												
													<c:if test="${message.getMediaType() == 'PICTURE' }">
													<a href="data:image/jpg;base64,${message.getMediaPicture() }"
													title="click to download picture" data-toggle="tooltip" data-placement="bottom" class="color-tooltip"
													download="${message.getMediaFileName()}.jpg">
														<img width="200" height="200" src="data:image/jpg;base64,${message.getMediaPicture() }" 
														download="${message.getMediaFileName()}.jpg">
														</a>	
													</c:if>
													
													<c:if test="${message.getMediaType() == 'DOCUMENT' }">
														<p>
														<a  
														target="_blank" onclick="OpenSesame(${message.getMediaDocument()})"
														href="data:application/pdf;base64,${message.getMediaDocument() }"
														title="click to download pdf" data-toggle="tooltip" data-placement="bottom" class="color-tooltip"
														download="${message.getMediaFileName()}.pdf" >
														
														<i class="far fa-file-pdf" style="font-size:48px;"></i>
														${message.getMediaFileName()}.pdf</a> 
														</p>
												<!-- 
													<script>
														function OpenSesame(fileName) {
														 
														  var dataURI = "data:application/pdf;base64," +fileName;
														  window.open(dataURI);
														 
														}
													</script>
													 -->
													</c:if>
												
												</c:when>
												
												
											</c:choose>
											
											
											</span>
									
									<span class="time-right" style="font-size: 10px;"><c:out
											value="${message.getTime()}" /></span>
								</div>
							</c:if>

							<c:if test="${message.getSender() eq  user_id}">
								<div class="row m-1 justify-content-end">
									
										<span class="col-md-9 my-sender-message p-2 rounded">
											<c:choose>
												<c:when test="${empty message.getMediaType() }">
													${message.getMsg() }
												</c:when>
												
												<c:when test="${not empty message.getMediaType() }">
												
													<c:if test="${message.getMediaType() == 'PICTURE' }">
													<a href="data:image/jpg;base64,${message.getMediaPicture() }" 
													title="click to download picture" data-toggle="tooltip" data-placement="bottom" class="color-tooltip"
													download="${message.getMediaFileName()}.jpg">
															<img width="200" height="200" src="data:image/jpg;base64,${message.getMediaPicture() }" 
															download="${message.getMediaFileName()}.jpg">
														</a>
													</c:if>
													
													<c:if test="${message.getMediaType() == 'DOCUMENT' }">
														 <p>
														 
														 <!-- href="data:application/pdf;base64,${message.getMediaDocument() }" -->
														<a  
														target="_blank" onclick="OpenSesame(${message.getMediaDocument()})"
														href="data:application/pdf;base64,${message.getMediaDocument() }"
														title="click to download pdf" data-toggle="tooltip" data-placement="bottom" class="color-tooltip"
														download="${message.getMediaFileName()}.pdf" >
														
														<i class="far fa-file-pdf" style="font-size:48px"></i>
														${message.getMediaFileName()}.pdf</a> 
														 
														 </p>
													<script>
														function OpenSesame(fileName) {
														 
														  var dataURI = "data:application/pdf;base64," +fileName;
														  window.open(dataURI);
														 
														}
													</script>
														<!-- <object width="200" height="200" data="data:application/pdf;base64,${message.getMediaDocument() }"></object>
													 -->
												</c:if>
												
												</c:when>
												
												
											</c:choose>
											
											
										</span>
									
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

				<abbr class="fa fa-plus-circle" id="clickOnNewStatus"
					style="font-size: 30px; color: #14FF7A; cursor: pointer;" ><span title="click to add status update" data-toggle="tooltip" data-placement="bottom" class="color-tooltip">My
						status</span></abbr>
					
				<p>Click to add status update</p>
				<sf:input id="chooseStatus" type="file" path="statusPicture"
					name="sendPicture" style="display: none;" />
				
				<input type="submit" id="submitStatus" value="addStatus" style="display: none;"></input>

					
				<script>
					  $("#clickOnNewStatus").on("click", function(e) {
						  e.preventDefault();
					    $("#chooseStatus").trigger("click");
					  });
					  $("#chooseStatus").on("change", function(e) {
						  e.preventDefault();
					    $("#submitStatus").trigger("click");
					  });
				</script>

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