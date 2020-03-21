<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chat Application</title>

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Rokkitt" rel="stylesheet"> 
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- START FOR TOOL TIP 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- END FOR TOOL TIP -->

  <script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://code.jquery.com/jquery-1.11.2.min.js"></script>
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

function myFunction() {
  var elmnt = document.getElementById(<%=request.getAttribute("postId")%>);
  elmnt.scrollIntoView();
}

function modalTrigger(){
	var modal = document.getElementById(<%=request.getAttribute("modalId")%>);
	modal.trigger();
	modal.show();
	modal.modal();
}

$(document).ready(function(){
	
    $(<%=request.getAttribute("modalId")%>).modal();
});


</script>

<style type="text/css">

.commentBox:focus{

}

.like-dislike{
	font-size:30px;
	color:#a80000;
}  

.like-dislike:hover, .like-dislike:focus{
font-size: 32px;
color:#a80000;
}

/*START FOR TOOL TIP*/
.color-tooltip + .tooltip > .tooltip-inner {background-color: #1ebea5;}
.color-tooltip + .tooltip > .tooltip-arrow { border-bottom-color:#1ebea5; }
/*END FOR TOOL TIP*/


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
/*
*
* ===========================================================
*     HERO SECTION
* ===========================================================
*
*/
.hero {
  padding: 6.25rem 0px !important;
  margin: 0px !important;
}
.cardbox {
  border-radius: 3px;
  margin-bottom: 20px;
  padding: 0px !important;
}

/* ------------------------------- */
/* Cardbox Heading
---------------------------------- */
.cardbox .cardbox-heading {
  padding: 16px;
  margin: 0;
}
.cardbox .btn-flat.btn-flat-icon {
 border-radius: 50%;
 font-size: 24px;
 height: 32px;
 width: 32px;
 padding: 0;
 overflow: hidden;
 color: #fff !important;
 background: #b5b6b6;
 
display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
text-align: center;
}
.cardbox .float-right .dropdown-menu{
  position: relative;
  left: 13px !important;  
}
.cardbox .float-right a:hover{
  background: #f4f4f4 !important;	
}
.cardbox .float-right a.dropdown-item {
  display: block;
  width: 100%;
  padding: 4px 0px 4px 10px;
  clear: both;
  font-weight: 400;
  font-family: 'Abhaya Libre', serif;
  font-size: 14px !important;
  color: #848484;
  text-align: inherit;
  white-space: nowrap;
  background: 0 0;
  border: 0;
}

/* ------------------------------- */
/* Media Section
---------------------------------- */
.media {
  display: -ms-flexbox;
  display: flex;
  -ms-flex-align: start;
  align-items: flex-start;
}
.d-flex {
  display: -ms-flexbox !important;
  display: flex !important;
}
.media .mr-3{
  margin-right: 1rem !important;
}
.media img{
  width: 48px !important;
  height: 48px !important;
  padding: 2px;
  border: 2px solid #f4f4f4;
} 
.media-body {
  -ms-flex: 1;
  flex: 1;
  padding: .4rem !important;
}
.media-body p{
  font-family: 'Rokkitt', serif;	
  font-weight: 500 !important;
  font-size: 14px;
  color: #88898a;
}
.media-body small span{
  font-family: 'Rokkitt', serif;	
  font-size: 12px;
  color: #aaa;
  margin-right: 10px;
}


/* ------------------------------- */
/* Cardbox Item
---------------------------------- */
.cardbox .cardbox-item {
    position: relative;
    display: block;
}
.cardbox .cardbox-item .cardbox-post img{
 width: 200 ;
 height: 200;
 align: middle;
}

.img-responsive{
    display: block;
    max-width: 100%;
    height: auto;
}	
.fw {
    width: 100% !important;
	height: auto;
}


/* ------------------------------- */
/* Cardbox Base
---------------------------------- */
.cardbox-base{
 border-bottom: 2px solid #f4f4f4;
}	
.cardbox-base ul{
 margin: 10px 0px 10px 15px!important; 
 padding: 10px !important;
 font-size: 0px;	
  display: inline-block;
}
.cardbox-base li {
  list-style: none;
  margin: 0px 0px 0px -8px !important;
  padding: 0px 0px 0px 0px !important;
  display: inline-block;
}

.cardbox-base li a{
  margin: 0px !important;
  padding: 0px !important;
}
.cardbox-base li a i{
 position: relative;
 top: 4px; 
 font-size: 16px;
 color: #8d8d8d;
 margin-right: 15px;
}
.cardbox-base li a span{
 font-family: 'Rokkitt', serif;
 font-size: 14px;
 color: #8d8d8d;
 margin-left: 20px;
 position: relative;
 top: 5px; 
}
.cardbox-base li a em{
 font-family: 'Rokkitt', serif;
 font-size: 14px;
 color: #8d8d8d;
 position: relative;
 top: 3px; 
}
.cardbox-base li a img{
  width: 25px;
  height: 25px;
  margin: 0px !important;
  border: 2px solid #fff;
}


/* ------------------------------- */
/* Cardbox Comments
---------------------------------- */
.cardbox-comments{
  padding: 10px 40px 20px 40px !important;
  font-size: 0px;	
  text-align: center;
  display: inline-block;
}
.cardbox-comments .comment-avatar img{
  margin-top: 1px;
  margin-right: 10px;
  position: relative;
  display: inline-block;
  text-align: center;
  width: 40px;
  height: 40px;
}
.cardbox-comments .comment-body {
  overflow: auto;
}
.search {
 position: relative;
 right: -60px;
 top: -40px;
 margin-bottom: -40px;
 border: 2px solid #f4f4f4;	
 width: 100%;
 overflow: hidden;
}
.search input[type="text"] {
 background-color: #fff;
 line-height: 10px;
 padding: 15px 60px 20px 10px;
 border: none;
 border-radius: 4px;
 width: 350px;
 font-family: 'Rokkitt', serif;
 font-size: 14px;
 color: #8d8d8d;
 height: inherit;
 font-weight: 700;
}
.search button {
 position: absolute;
 right: 0;
 top: 0px;
 border: none;
 background-color: transparent;
 color: #bbbbbb;
 padding: 15px 25px;
 cursor: pointer;
 
 display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
text-align: center;
}
.search button i {
 font-size: 20px;
 line-height: 30px;
 display: block;
}


/* ------------------------------- */
/* Author
---------------------------------- */
.author a{
 font-family: 'Rokkitt', serif;
 font-size: 16px;
 color: #00C4CF;
}
.author p{
 font-family: 'Rokkitt', serif;
 font-size: 16px;
 color: #8d8d8d;
}
 .my-modal-lg {
    max-width: 50% !important;
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


/*For pagiation start*/
.pagination { 
    display: inline-block; 
} 
  
.pagination a { 
    font-weight:bold; 
    font-size:20px; 
    float: center; 
    padding: 8px 16px; 
    text-decoration: none; 
    color: #1ebea5;
} 
.pagination a.active { 
    background-color:#009900; 
} 
.pagination a:hover:not(.active) { 
    background-color: #1ebea5; 
    color: white;
} 
/*For pagiation end*/

	p.prev{
		text-align: center;
	}
	p.next{
		text-align: center;
	}



/*for modal style*/
    .split {
      height: 100%;
      width: 50%;
      position: fixed;
      z-index: 1;
      top: 0;
      overflow-x: hidden;
      
    }
    
    .left {
      left: 0;
      background-color: #eee;;
      border-color: #000;
    }
    
    .right {
      right: 0;
      background-color: #fff;
      overflow-y: scroll; /* Add the ability to scroll */
      border: 1px black;
    }
    
    ::-webkit-scrollbar {
  width: 5px;
}

/* Track */
::-webkit-scrollbar-track {
  box-shadow: inset 0 0 5px grey; 
  border-radius: 10px;
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: rgb(83, 82, 82); 
  border-radius: 10px;
}

    .centered img {
    
      margin-top: 5%;
      
      margin-left: auto;
      margin-right: auto;
      display: block;
      width: 600px;
      height: 620px;
      
      
    }

  
.modal-dialog {
 
          width: 70%;
 
          height:600px !important;
 
        }
 
.modal-content {
 
    /* 80% of window height */
 
    height: 60%;
 
    background-color:#BBD6EC;
 
}       
 
.modal-header {
 
    background-color: #337AB7;
 
    padding:10px 16px;
 
    color:#FFF;
 
    border-bottom:2px dashed #337AB7;
 
 }


 #postProfile {
  overflow: hidden;
  background-color: #FFF;
  width: 50%;
  border-color: #000;
  padding-left: 15px;
}

#postProfile p {
  float: left;
  display: block;
  color: #000;
  text-align: center;
  padding: 20px 16px;
  text-decoration: none;
  font-size: 17px;
}

#postProfile a:hover {
  background-color: #ddd;
  color: black;
}

#postProfile a.active {
  background-color: #4CAF50;
  color: white;
}

.content {
    border-color: 2px black;
background-color: #eee;
  padding: 16px;

}

.content p{
    color: #000;
}

.sticky {
  position: fixed;
  top: 0;
  width: 100%;
}

.sticky + .content {
    padding-top: 100px;
}

.commentSection {
  overflow: hidden;
  background-color:#fff;
  position: fixed;
  bottom: 0;
  width: 50%;
}

.commentSection a{
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}


/**/


/**/


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
	font-size: 40px;/*1.5em;*/
	margin-bottom: 5px;
	color: #1ebea5;
	text-shadow: 3px 0 6px rgba(0, 0, 0, 0.1);
}
.label {
	font-size: 10px;/*0.6em;*/
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

/**/


</style>

		
</head>


<body onload="myFunction(),modalTrigger()">




<header class="container my-bg my-height-nav">
			
<div class="topnav">

  <!-- Centered link -->
  <div class="topnav-centered">
    <font size="6"><a href="#home" class="active"><b>Posts</b></a></font>
  </div>
  
  <a class="nav-link text-light my-center" title="Home" data-toggle="tooltip" data-placement="bottom" class="color-tooltip"
	href="showHome?user_id=${user_id }" style="text-align: left;">
	<i class="fa fa-home" style='font-size:48px;color:white'></i>
	</a>

 
</div>
		
</header>


<!-- -->


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



<!-- -->


<c:set var="adminUser" value="${database.getUser(user_id)}"/>

<!-- 
 <c:forEach items="${posts }" var="post">
	<c:set var="postUser" value="${database.getUser(post.getUser_id()) }"/>
	
		<div class="modal fade" id="${post.getId()}${postUser.getId()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
			<div class="modal-dialog my-modal-lg" role="document" >
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body row">
						<div class="col-lg-8" id="img-11">
							<div class="cardbox shadow-lg bg-white">
								<div class="cardbox-heading">
									<h5 class="float-left"><c:out value="${postUser.getName() }"/></h5>
									<div class="dropdown float-right">
										<button class="btn btn-flat btn-flat-icon" type="button" data-toggle="dropdown" aria-expanded="false">
											<em class="fa fa-ellipsis-h"></em>
										</button>
										<div class="dropdown-menu dropdown-scale dropdown-menu-right" role="menu" style="position: absolute; transform: translate3d(-136px, 28px, 0px); top: 0px; left: 0px; will-change: transform;">
											<a class="dropdown-item" href="#">Hide post</a>
											<a class="dropdown-item" href="#">Stop following</a>
											<a class="dropdown-item" href="#">Report</a>
										</div>
									</div>
								</div>
								<div class="cardbox-item">
									<img class="img-fluid" src="data:image/jpg;base64,${post.getPost()}" alt="Image">
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="cardbox-base">
								<ul class="float-left">
									<li><a><i class="fa fa-thumbs-up"></i></a></li>
									<li><a><span>${post.getLikes().size()+0}Likes</span></a></li>
								</ul>
								<ul>
									<li><a><i class="fa fa-comments"></i></a></li>
									<li><a><em class="mr-5">12</em></a></li>
							
								</ul>			   
							</div>
							<div class="progress" style="height: 60px;">
								Previous comments..
								<div class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
							<div class="search" style="margin-top: 30px;">
								<input placeholder="Write a comment" type="text" style="width: 200%;">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</c:forEach>
 -->
<section class="hero">
	<div class="container">
         <div class="row">
         <c:forEach items="${posts }" var="post">
         
         	<c:set var="postUser" value="${database.getUser(post.getUser_id()) }"/>
         		
			  <!-- offset-lg-3 -->
			   <div class="col-lg-6" >
				
				<div class="cardbox shadow-lg bg-white" >
				 
				 <div class="cardbox-heading">
				  <!-- START dropdown-->
				  <div class="dropdown float-right">
				   <button class="btn btn-flat btn-flat-icon" type="button" data-toggle="dropdown" aria-expanded="false">
					<em class="fa fa-ellipsis-h"></em>
				   </button>
				   <div class="dropdown-menu dropdown-scale dropdown-menu-right" role="menu" style="position: absolute; transform: translate3d(-136px, 28px, 0px); top: 0px; left: 0px; will-change: transform;">
					<c:if test="${user_id ne postUser.getId() }">
						<a class="dropdown-item" href="showReceiver?user_id=${user_id }&contact_id=${postUser.getId()}" >See Profile</a>
					</c:if>
					<c:if test="${user_id eq postUser.getId() }">
						<a class="dropdown-item" href="viewProfile?user_id=<c:out value="${user_id}"/>"
						>See Profile</a>
					</c:if>
					<a class="dropdown-item" href="showChat?user_id=${user_id }&contact_id=${postUser.getId()}">Message</a>
					<a class="dropdown-item" href="#">Stop following</a>
					
				   </div>
				  </div><!--/ dropdown -->
				  <div class="media m-0">
				   <div class="d-flex mr-3">
					<a href="#"><img class="img-fluid rounded-circle" src="data:image/jpg;base64,${postUser.getPicture_str()}" alt="User"></a>
				   </div>
				   <div class="media-body">
				    <p class="m-0"><c:out value="${postUser.getName() }"/> </p>
					<small><span><i class="icon ion-md-pin"></i> ${post.getDate()}</span></small>
					<small><span><i class="icon ion-md-time"></i> ${post.getTime() }</span></small>
				   </div>
				  </div><!--/ media -->
				 </div><!--/ cardbox-heading -->
				  
				 <div id="${post.getId()}" class="cardbox-item" align="center">
					 <div class="cardbox-post">
					  <img class="img-fluid" src="data:image/jpg;base64,${post.getPost()}" width="400" height="400"
					   alt="Image" data-toggle="modal" data-target="#modalForPost${post.getId()}" > 
					 </div> 
				 </div><!--/ cardbox-item -->
				 
				 <div class="cardbox-base">
				  <ul class="float-right">
				   <li><a><i class="fa fa-comments"></i></a></li>
				   <li><a><em class="mr-5">${post.getComments().size()+0 }</em></a></li>
				   <li><a><i class="fa fa-share-alt"></i></a></li>
				   <li><a><em class="mr-3">0</em></a></li>
				  </ul>
				  <ul>
				   <li>
				   		<c:set value="0" var="alreadyLiked"/>
				   		<c:forEach items="${post.getLikes() }" var="plike">
				   			<c:if test="${plike.getUser_id() eq adminUser.getId() }">
				   				<c:set value="1" var="alreadyLiked"/>
				   			</c:if>
				   		</c:forEach>
				   		  
				   		<c:if test="${alreadyLiked eq 0 }">
				   			<a href="likePost?user_id=${adminUser.getId()}&post_id=${post.getId()}&prev=${prev}&next=${next}"
				   			title="like" data-toggle="tooltip" data-placement="bottom" class="color-tooltip">
				   			<i class="fa fa-heart-o like-dislike" style="color:#a80000;"></i></a>
				   		</c:if>
				   		<c:if test="${alreadyLiked eq 1 }">
				   			<a href="disLikePost?user_id=${adminUser.getId()}&post_id=${post.getId()}&prev=${prev}&next=${next}"
				   			title="dislike" data-toggle="tooltip" data-placement="bottom" class="color-tooltip">
				   			<i class="fa fa-heart like-dislike" style="color:#a80000;"></i></a>
				   		</c:if>
				   	
				   </li>
				   
				   <c:if test="${not empty post.getLikes() }">
				   		 <c:if test="${post.getLikes().size() >= 1 }">
				   			<li><a href="#"><img src="data:image/jpg;base64,${database.getUser(post.getLikes().get(0).getUser_id()).getPicture_str()}" class="img-fluid rounded-circle" alt="User"></a></li>
				   		</c:if>
					    <c:if test="${post.getLikes().size() >= 2 }">
					   		<li><a href="#"><img src="data:image/jpg;base64,${database.getUser(post.getLikes().get(1).getUser_id()).getPicture_str()}" class="img-fluid rounded-circle" alt="User"></a></li>
					   </c:if>
					    <c:if test="${post.getLikes().size() >= 3 }">
					   		<li><a href="#"><img src="data:image/jpg;base64,${database.getUser(post.getLikes().get(2).getUser_id()).getPicture_str()}" class="img-fluid rounded-circle" alt="User"></a></li>
					   </c:if>
					    <c:if test="${post.getLikes().size() >= 4 }">
						   <li><a href="#"><img src="data:image/jpg;base64,${database.getUser(post.getLikes().get(3).getUser_id()).getPicture_str()}" class="img-fluid rounded-circle" alt="User"></a></li>
					   </c:if>
				    </c:if>
				   
				   <li><a><span><c:out value="${post.getLikes().size()+0 }"/> Likes</span></a></li>
				  </ul>			   
				 </div><!--/ cardbox-base -->
				 
				 <div class="cardbox-comments">
				  <span class="comment-avatar float-left">
				   <a href=""><img class="rounded-circle" src="data:image/jpg;base64,${adminUser.getPicture_str()}" alt="..."></a>                            
				  </span>
				  <div class="search">
				  
				  <form action="addComment?user_id=${adminUser.getId()}&post_id=${post.getId()}&prev=${prev}&next=${next}" method="post">
				  	 <input class="commentBox" placeholder="Add a comment..." type="text" name="commentOnPost">
				   	 <button type="submit"><i class="fa fa-camera"></i></button>
				  </form>
				  
				  </div><!--/. Search -->
				 </div>		  
			
				<!--/ cardbox-like -->	
				</div><!--/ cardbox -->
	
	           </div><!--/ col-lg-6 -->	
			 
	          
	          
	          
	          <!-- TIME PASS START HERE -->
	          
	          
	          
	          <!-- TIME PASS ENDS HERE -->
	          
	            <!-- Modal -->
  <div class="modal fade bd-example-modal-lg" id="modalForPost${post.getId()}" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg-">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
            <div class="split left">
                <div class="centered">
                  <img src="data:image/jpg;base64,${post.getPost()}" alt="Avatar woman">
                </div>  
                </div>
              </div>
              
              <div class="split right">

				<!-- 	<div class="modal-header" style="position: fixed;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Modal Header</h4>
                  </div> -->
					
                <div id="postProfile" style="position: fixed;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
                    <br>
                    
                    <table>
                        <tr>
            
                            <td rowspan="2">
                                
                                <img src="data:image/jpg;base64,${postUser.getPicture_str()}" style="width: 70px; height: 70px; border-radius: 50%;" alt="${post.getPost()}">
                            </td>
                            <td style="padding-left: 10px; color: black;">
                                <b>${ postUser.getName() }</b>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left: 10px; color: grey;">
                                <small><span><i class="icon ion-md-pin"></i> ${post.getDate()}</span></small>
								<small><span><i class="icon ion-md-time"></i> ${post.getTime() }</span></small>
                            </td>
                        </tr>
                    </table>
                    <br>
                    
                    
                </div>

                <div class="content" style=" padding-top: 150px;">
                  
                  <c:if test="${post.getComments()!=null }">
                   <c:forEach items="${post.getComments()}" var="postCmt">
                        
                        <c:set var="tempUser" value="${database.getUser(postCmt.getUser_id())  }"></c:set>
                        
                        <table>
                            <tr>
                                <td rowspan="2">
                                    <img src="data:image/jpg;base64,${tempUser.getPicture_str()}" style="width: 50px; height: 50px; border-radius: 50%;" alt="Avatar woman">
                                </td>
                                <td style="padding-left: 10px; color: black;">
                                    <b>${tempUser.getName()}</b>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 10px; color: grey;">
                                    ${postCmt.getComment() }
                                </td>
                            </tr>
                        </table>
                  
                    
                    
                        <br>
                        
                   </c:forEach>
                   </c:if>
                        
                    
                
                </div>

                <div class="commentSection">
                   
                        <br>

                        <!-- &nbsp;&nbsp;
                        <i class="fa fa-heart" style="font-size:20px;color:red">
                        &nbsp;247 </i>
                        &nbsp;&nbsp;&nbsp;
                        <i class="far fa-comment" style="font-size:20px;color: black;">
                            &nbsp;247 </i>
                            <br> -->
                        <!-- <i style="color:gray ;font-size: 10;">
                            &nbsp;&nbsp;&nbsp;&nbsp;
                         -->    
                         <div class="cardbox-base">
                         
                         <ul class="float-right">
						   <li><a><i class="fa fa-comments"></i></a></li>
						   <li><a><em class="mr-5">${post.getComments().size()+0 }</em></a></li>
						   <li><a><i class="fa fa-share-alt"></i></a></li>
						   <li><a><em class="mr-3">0</em></a></li>
						  </ul>
                         
                         <ul>
				   <li>
				   		<c:set value="0" var="alreadyLiked"/>
				   		<c:forEach items="${post.getLikes() }" var="plike">
				   			<c:if test="${plike.getUser_id() eq adminUser.getId() }">
				   				<c:set value="1" var="alreadyLiked"/>
				   			</c:if>
				   		</c:forEach>
				   		
				   		<c:if test="${alreadyLiked eq 0 }">
				   			<a href="likePost?user_id=${adminUser.getId()}&post_id=${post.getId()}&prev=${prev}&next=${next}"
				   			title="like" data-toggle="tooltip" data-placement="bottom" class="color-tooltip">
				   			<i class="fa fa-heart-o like-dislike" style="color:#a80000;"></i></a>
				   		</c:if>
				   		<c:if test="${alreadyLiked eq 1 }">
				   			<a href="disLikePost?user_id=${adminUser.getId()}&post_id=${post.getId()}&prev=${prev}&next=${next}"
				   			title="dislike" data-toggle="tooltip" data-placement="bottom" class="color-tooltip">
				   			<i class="fa fa-heart like-dislike" style="color:#a80000;"></i></a>
				   		</c:if>
				   	
				   </li>
				   
				  
	                       <c:if test="${not empty post.getLikes() }">
					   		 <c:if test="${post.getLikes().size() >= 1 }">
					   			<li><a href="#"><img src="data:image/jpg;base64,${database.getUser(post.getLikes().get(0).getUser_id()).getPicture_str()}" class="img-fluid rounded-circle" width="50" height="50" alt="User"></a></li>
					   		</c:if>
						    <c:if test="${post.getLikes().size() >= 2 }">
						   		<li><a href="#"><img src="data:image/jpg;base64,${database.getUser(post.getLikes().get(1).getUser_id()).getPicture_str()}" class="img-fluid rounded-circle" width="50" height="50" alt="User"></a></li>
						   </c:if>
						    <c:if test="${post.getLikes().size() >= 3 }">
						   		<li><a href="#"><img src="data:image/jpg;base64,${database.getUser(post.getLikes().get(2).getUser_id()).getPicture_str()}" class="img-fluid rounded-circle" width="50" height="50" alt="User"></a></li>
						   </c:if>
						    <c:if test="${post.getLikes().size() >= 4 }">
							   <li><a href="#"><img src="data:image/jpg;base64,${database.getUser(post.getLikes().get(3).getUser_id()).getPicture_str()}" class="img-fluid rounded-circle" width="50" height="50" alt="User"></a></li>
						   </c:if>
					    </c:if>
				   
				   <li><a><span><c:out value="${post.getLikes().size()+0 }"/> Likes</span></a></li>
                        
                        </ul>	
                        </div>
                        <br>
                        
					 <form action="addComment?user_id=${adminUser.getId()}&post_id=${post.getId()}&prev=${prev}&next=${next}&modalId=#modalForPost${post.getId()}" method="post">
                        <input style="width: 615px; height: 50px;" type="text" id="commentBox" name="commentOnPost" placeholder="   Add a comment..." aria-describedby="basic-addon2" >
                    
                        <button style="width: 100px; height: 50px; color : #fff;" class="btn btn-outline-secondary" id="commentButton" type="submit"> <b style="color: rgb(124, 194, 255);">Post</b>  </button>
                     </form>
                      
                      
                </div>
                  

              </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
 
	          
	          
	          
	          
          </c:forEach>
          
   </div><!--/ row -->
 	
	     	

	

	
		 
<%--           <c:if test="${prev>0 }">
			<a href="viewAllPosts?user_id=${user_id}&prev=${prev - 1 }&next=${next - 1 }&postId=#"><< prev</a>
			&nbsp;&nbsp;&nbsp;&nbsp;
		</c:if>
		<c:if test="${ 20 == posts.size() }">
			<a href="viewAllPosts?user_id=${user_id}&prev=${prev + 1 }&next=${next + 1 }&postId=#">next >></a>	
		</c:if>
     --%>
     </div>
</section>
<div class="container-fluid">

 <div class="row">
    <div class="col-sm-6" style=" text-align: right ;">
    <div class="pagination"> 
	 	<c:if test="${prev>0 }">
			<a href="viewAllPosts?user_id=${user_id}&prev=${prev - 1 }&next=${next - 1 }&postId=#">${prev} << prev</a>
		</c:if>
	</div>
	</div>
    
    <div class="col-sm-6" style=" text-align: left;">
    <div class="pagination"> 
    		<c:if test="${ 20 == posts.size() }">
			<a href="viewAllPosts?user_id=${user_id}&prev=${prev + 1 }&next=${next + 1 }&postId=#">next >> ${next+1}</a>	
		</c:if>
   	</div>
    </div>
  </div>
</div>



<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

		
		<!-- 
		<script>
			function loc(param){
				location.replace("http://localhost:8080/whatsapp/social?user_id=1&postId=#"+param);
			 }
		</script>*/
		 -->
<script>

//script
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


