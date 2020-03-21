<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chat Application</title>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">


<script src="https://kit.fontawesome.com/81c2c05f29.js" crossorigin="anonymous"></script>
<style>

:root {
    font-size: 10px;
}

*,
*::before,
*::after {
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

.profile-user-settings,
.profile-stats,
.profile-bio {
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

.profile-real-name,
.profile-stat-count,
.profile-edit-btn {
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

.gallery-item:hover .gallery-item-info,
.gallery-item:focus .gallery-item-info {
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

.fa-clone,
.fa-comment {
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

    .profile-image,
    .profile-user-settings,
    .profile-bio,
    .profile-stats {
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

    .profile-edit-btn,
    .profile-bio,
    .profile-stats {
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

@keyframes loader {
    to {
        transform: rotate(360deg);
    }
}

/*

The following code will only run if your browser supports CSS grid.

Remove or comment-out the code block below to see how the browser will fall-back to flexbox & floated styling. 

*/

@supports (display: grid) {
    .profile {
        display: grid;
        grid-template-columns: 1fr 2fr;
        grid-template-rows: repeat(3, auto);
        grid-column-gap: 3rem;
        align-items: center;
    }

    .profile-image {
        grid-row: 1 / -1;
    }

    .gallery {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(22rem, 1fr));
        grid-gap: 2rem;
    }

    .profile-image,
    .profile-user-settings,
    .profile-stats,
    .profile-bio,
    .gallery-item,
    .gallery {
        width: auto;
        margin: 0;
    }

    @media (max-width: 40rem) {
        .profile {
            grid-template-columns: auto 1fr;
            grid-row-gap: 1.5rem;
        }

        .profile-image {
            grid-row: 1 / 2;
        }

        .profile-user-settings {
            display: grid;
            grid-template-columns: auto 1fr;
            grid-gap: 1rem;
        }

        .profile-edit-btn,
        .profile-stats,
        .profile-bio {
            grid-column: 1 / -1;
        }

        .profile-user-settings,
        .profile-edit-btn,
        .profile-settings-btn,
        .profile-bio,
        .profile-stats {
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


<header class="container my-bg my-height-nav">
			
<div class="topnav">

  <!-- Centered link -->
  <div class="topnav-centered">
    <font size="6"><a href="#ProfileInformation" class="active"><b>Profile Information</b></a></font>
  </div>
  
  <a class="nav-link text-light my-center" 
	href="javascript:history.go(-1)" style="text-align: left;">
	<i class="fa fa-home" style='font-size:48px;color:white'></i>
	</a>

</div>
		
</header>

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

	<div class="container">

		<div class="profile">

			<div class="profile-image">
				
				<img src="data:image/jpg;base64,${request.getPicture_str()}" alt="profile" width="200" height="200">
				
			</div>

			<div class="profile-user-settings">

				<h1 class="profile-user-name">${request.getName()}</h1>

				<c:if test="${type == 'accept' }">
					<a href="addFromFindFriend?userId=${user_id}&contactId=${request.id}">
						<button class="btn profile-edit-btn">Accept Request</button>
					</a>
				</c:if>	
				
				<c:if test="${type == 'delete' }">
					<a href="deleteRequest?userId=${user_id}&requestId=${request.id}">
						<button class="btn profile-edit-btn">Delete Request</button>
					</a>
				</c:if>
				
				<c:if test="${type == 'request' }">
					<a href="sentRequest?userId=${user_id}&requestId=${request.id}">
						<button class="btn profile-edit-btn">Sent Request</button>
					</a>
				</c:if>
				
			</div>

			<div class="profile-stats">

				<ul>
					<li><span class="profile-stat-count"><c:out value="${request.getPosts().size() }" /></span> posts</li>
					<li><span class="profile-stat-count"><c:out value="${request.getContacts().size() }" /></span> friends</li>
					<!-- <li><span class="profile-stat-count">206</span> following</li> -->
				</ul>

			</div>

			<div class="profile-bio">

				<p>Username: <span class="profile-real-name">${request.getEmail()}</span>  </p>
			</div>
		</div>
		<!-- End of profile section -->

	</div>
	<!-- End of container -->



	<div class="container">

		<div class="gallery">
			<c:if test="${empty request.getPosts() }">
				<h1>No Photos available</h1>
			
			</c:if>
		
			<c:if test="${not empty request.getPosts() }">
				<c:forEach items="${request.getPosts() }" var="posts">
				
					<div class="gallery-item" tabindex="0">
					
						<img src="data:image/jpg;base64,${posts.getPost()}" class="gallery-image" alt="post">
						
						<div class="gallery-item-info">
						
							<ul>
								<li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden="true"></i> ${posts.getLikes().size() }</li>
								<li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden="true"></i> ${posts.getComments().size() }</li>
							 
							</ul>
							
						</div>
					
					</div>
				</c:forEach>
			</c:if>
			
			
			
		</div>
		<!-- End of gallery -->
	

	</div>
	<!-- End of container -->

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