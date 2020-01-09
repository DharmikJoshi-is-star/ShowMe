<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chat Application</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<link href='https://fonts.googleapis.com/css?family=Titillium+Web' rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- START FOR TOOL TIP -->

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
.input-file-container {
	position: relative;
	width: 225px;
}

.js .input-file-trigger {
	display: block;
	padding: 14px 45px;
	background: #39D2B4;
	color: #fff;
	font-size: 1em;
	transition: all .4s;
	cursor: pointer;
}

.js .input-file {
	position: absolute;
	top: 0;
	left: 0;
	width: 225px;
	opacity: 0;
	padding: 14px 0;
	cursor: pointer;
}

.js .input-file:hover+.input-file-trigger, .js .input-file:focus+.input-file-trigger,
	.js .input-file-trigger:hover, .js .input-file-trigger:focus {
	background: #34495E;
	color: #39D2B4;
}

.file-return {
	margin: 0;
}

.file-return:not (:empty ) {
	margin: 1em 0;
}

.js .file-return {
	font-style: italic;
	font-size: .9em;
	font-weight: bold;
}

.js .file-return:not (:empty ):before {
	content: "Selected file: ";
	font-style: normal;
	font-weight: normal;
}

:root {
	font-size: 10px;
}

*, *::before, *::after {
	box-sizing: border-box;
}

body {
	font-family: "Open Sans", Arial, sans-serif;
	min-height: 100vh;
	background-color: #fafafa;
	color: #262626;
	padding-bottom: 3rem;
}

img {
	display: block;
}

.container {
	max-width: 93.5rem;
	margin: 0 auto;
	padding: 0 2rem;
}

.btn {
	display: inline-block;
	font: inherit;
	background: none;
	border: none;
	color: inherit;
	padding: 0;
	cursor: pointer;
}

.btn:focus {
	outline: 0.5rem auto #4d90fe;
}

.visually-hidden {
	position: absolute !important;
	height: 1px;
	width: 1px;
	overflow: hidden;
	clip: rect(1px, 1px, 1px, 1px);
}

/* Profile Section */
.profile {
	padding: 5rem 0;
}

.profile::after {
	content: "";
	display: block;
	clear: both;
}

.profile-image {
	float: left;
	width: calc(33.333% - 1rem);
	display: flex;
	justify-content: center;
	align-items: center;
	margin-right: 3rem;
}

.profile-image img {
	border-radius: 50%;
}

.profile-user-settings, .profile-stats, .profile-bio {
	float: left;
	width: calc(66.666% - 2rem);
}

.profile-user-settings {
	margin-top: 1.1rem;
}

.profile-user-name {
	display: inline-block;
	font-size: 3.2rem;
	font-weight: 300;
}

.profile-edit-btn {
	font-size: 1.4rem;
	line-height: 1.8;
	border: 0.1rem solid #dbdbdb;
	border-radius: 0.3rem;
	padding: 0 2.4rem;
	margin-left: 2rem;
}

.profile-settings-btn {
	font-size: 2rem;
	margin-left: 1rem;
}

.profile-stats {
	margin-top: 2.3rem;
}

.profile-stats li {
	display: inline-block;
	font-size: 1.6rem;
	line-height: 1.5;
	margin-right: 4rem;
	cursor: pointer;
}

.profile-stats li:last-of-type {
	margin-right: 0;
}

.profile-bio {
	font-size: 1.6rem;
	font-weight: 400;
	line-height: 1.5;
	margin-top: 2.3rem;
}

.profile-real-name, .profile-stat-count, .profile-edit-btn {
	font-weight: 600;
}

/* Gallery Section */
.gallery {
	display: flex;
	flex-wrap: wrap;
	margin: -1rem -1rem;
	padding-bottom: 3rem;
}

.gallery-item {
	position: relative;
	flex: 1 0 22rem;
	margin: 1rem;
	color: #fff;
	cursor: pointer;
}

.gallery-item:hover .gallery-item-info, .gallery-item:focus .gallery-item-info
	{
	display: flex;
	justify-content: center;
	align-items: center;
	position: absolute;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.3);
}

.gallery-item-info {
	display: none;
}

.gallery-item-info li {
	display: inline-block;
	font-size: 1.7rem;
	font-weight: 600;
}

.gallery-item-likes {
	margin-right: 2.2rem;
}

.gallery-item-type {
	position: absolute;
	top: 1rem;
	right: 1rem;
	font-size: 2.5rem;
	text-shadow: 0.2rem 0.2rem 0.2rem rgba(0, 0, 0, 0.1);
}

.fa-clone, .fa-comment {
	transform: rotateY(180deg);
}

.gallery-image {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

/* Loader */
.loader {
	width: 5rem;
	height: 5rem;
	border: 0.6rem solid #999;
	border-bottom-color: transparent;
	border-radius: 50%;
	margin: 0 auto;
	animation: loader 500ms linear infinite;
}

/* Media Query */
@media screen and (max-width: 40rem) {
	.profile {
		display: flex;
		flex-wrap: wrap;
		padding: 4rem 0;
	}
	.profile::after {
		display: none;
	}
	.profile-image, .profile-user-settings, .profile-bio, .profile-stats {
		float: none;
		width: auto;
	}
	.profile-image img {
		width: 7.7rem;
	}
	.profile-user-settings {
		flex-basis: calc(100% - 10.7rem);
		display: flex;
		flex-wrap: wrap;
		margin-top: 1rem;
	}
	.profile-user-name {
		font-size: 2.2rem;
	}
	.profile-edit-btn {
		order: 1;
		padding: 0;
		text-align: center;
		margin-top: 1rem;
	}
	.profile-edit-btn {
		margin-left: 0;
	}
	.profile-bio {
		font-size: 1.4rem;
		margin-top: 1.5rem;
	}
	.profile-edit-btn, .profile-bio, .profile-stats {
		flex-basis: 100%;
	}
	.profile-stats {
		order: 1;
		margin-top: 1.5rem;
	}
	.profile-stats ul {
		display: flex;
		text-align: center;
		padding: 1.2rem 0;
		border-top: 0.1rem solid #dadada;
		border-bottom: 0.1rem solid #dadada;
	}
	.profile-stats li {
		font-size: 1.4rem;
		flex: 1;
		margin: 0;
	}
	.profile-stat-count {
		display: block;
	}
}

/* Spinner Animation */
@
keyframes loader {to { transform:rotate(360deg);
	
}

}

/*

The following code will only run if your browser supports CSS grid.

Remove or comment-out the code block below to see how the browser will fall-back to flexbox & floated styling. 

*/
@
supports (display: grid ) { .profile { display:grid;
	grid-template-columns: 1fr 2fr;
	grid-template-rows: repeat(3, auto);
	grid-column-gap: 3rem;
	align-items: center;
}

.profile-image {
	grid-row: 1/-1;
}

.gallery {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(22rem, 1fr));
	grid-gap: 2rem;
}

.profile-image, .profile-user-settings, .profile-stats, .profile-bio,
	.gallery-item, .gallery {
	width: auto;
	margin: 0;
}

@media ( max-width : 40rem) {
	.profile {
		grid-template-columns: auto 1fr;
		grid-row-gap: 1.5rem;
	}
	.profile-image {
		grid-row: 1/2;
	}
	.profile-user-settings {
		display: grid;
		grid-template-columns: auto 1fr;
		grid-gap: 1rem;
	}
	.profile-edit-btn, .profile-stats, .profile-bio {
		grid-column: 1/-1;
	}
	.profile-user-settings, .profile-edit-btn, .profile-settings-btn,
		.profile-bio, .profile-stats {
		margin: 0;
	}
}
}


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
<h1>Profile</h1>
	<BR>
	<img src="data:image/jpg;base64,${user.getPicture_str()}" width="200" height="200" /><BR>
	Name: <c:out value="${user.getName() }"/><BR>
	Email: <c:out value="${user.getEmail() }"/><BR>
	Contact: <c:out value="${user.getContact() }"/><BR>
	Password: <c:out value="${user.getPassword() }"/><BR>
	<HR>
	<H3>Your Posts:</H3>
	<BR>
	
	<c:forEach items="${user.getPosts() }" var="posts">
		<img src="data:image/jpg;base64,${posts.getPost()}" width="200" height="200" />
		<BR>
		<h4>Caption: <c:out value="${posts.caption }"/></h4>
	</c:forEach>
	<BR>
	<HR>
	<BR>
	
	<sf:form method="post" action="addPost?user_id=${user.getId()}" modelAttribute="newPost" >
		<sf:input type="file" path="post" />
		<sf:input type="text" path="caption" />
		<input type="submit" value="add">
	</sf:form>
	
<HR>	
<BR>
<BR>
<a href="show-editprofile-form?user_id=<c:out value="${user.getId()}"/>">Edit</a>
<BR>	
<a href="showHome?user_id=<c:out value="${user.getId()}"/>">Go Home</a>

-->
<header class="container my-bg my-height-nav">
			
<div class="topnav">

  <!-- Centered link -->
  <div class="topnav-centered">
    <font size="6"><a href="#ProfileInformation" class="active"><b>Profile Information</b></a></font>
  </div>
  
  <a class="nav-link text-light my-center" 
	href="javascript:history.go(-1)" style="text-align: left;"
	title="home" data-toggle="tooltip" class="color-tooltip">
	<i class="fa fa-home" style='font-size:48px;color:white'></i>
	</a>

</div>
		
</header>

		<div class="container">
		<div class="profile">

				<div class="profile-image">

					<img src="data:image/jpg;base64,${user.getPicture_str()}"
						alt="profile" width="200" height="200">

				</div>

				<div class="profile-user-settings">

					<h1 class="profile-user-name">${user.getName()}</h1>

					<a
						href="show-editprofile-form?user_id=<c:out value="${user.getId()}"/>">
						<button class="btn profile-edit-btn">Edit Profile</button>
					</a>
					<button class="btn profile-settings-btn"
						aria-label="profile settings">
						<i class="fas fa-cog" aria-hidden="true"></i>
					</button>

				</div>

				<div class="profile-stats">

					<ul>
						<li><span class="profile-stat-count"><c:out
									value="${user.getPosts().size() }" /> </span> posts</li>
						<li><span class="profile-stat-count"><c:out
									value="${user.getContacts().size() }" /> </span> friends</li>
						<li><span class="profile-stat-count">206</span> following</li>
					</ul>

				</div>

				<div class="profile-bio">

					<p>
						<span class="profile-real-name">${user.getEmail()}</span> 📷✈️🏕️
					</p>
					<sf:form class="md-form" method="post"
						action="addPost?user_id=${user.getId()}" modelAttribute="newPost">

						<div class="file-field">

							<a class="btn-floating purple-gradient mt-0 float-left"> <i
								class="fas fa-cloud-upload-alt" aria-hidden="true"></i> <sf:input
									type="file" path="post" />
							</a>
							<div class="file-path-wrapper">
								<sf:input path="caption" type="hidden" placeholder="Add Caption" />
							</div>
							<input type="submit" value="add">

						</div>


					</sf:form>

				</div>



			</div>
			<!-- End of profile section -->

		</div>
		<!-- End of container -->


	<div class="container">

		<div class="gallery">

			<c:forEach items="${user.getPosts() }" var="posts">

				<div class="gallery-item" tabindex="0">

					<img src="data:image/jpg;base64,${posts.getPost()}"
						class="gallery-image" alt="post">

					<div class="gallery-item-info">

						<ul>
							<li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i
								class="fas fa-heart" style="font-size:30px;" aria-hidden="true"></i> ${posts.getLikes().size() }</li>
							<!-- <li class="gallery-item-comments"><span
								class="visually-hidden">Comments:</span><i
								class="fas fa-comment" aria-hidden="true"></i> 0</li> -->
							<li class="gallery-item-comments"><span
								class="visually-hidden"></span>
								<a href="deletePost?user_id=${user.getId()}&post_id=${posts.getId()}">
								<i class="fa fa-trash-o" style="font-size:30px;" aria-hidden="true"></i>
								</a>
								</li>
						</ul>
						
					</div>

				</div>
			</c:forEach>

		</div>
		<!-- End of gallery -->


	</div>
	<!-- End of container -->



</body>

</html>