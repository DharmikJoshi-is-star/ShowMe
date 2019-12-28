<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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

<script type="text/javascript">



function myFunction() {
  var elmnt = document.getElementById(<%=request.getAttribute("postId")%>);
  elmnt.scrollIntoView();
}
</script>


<style type="text/css">
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
.cardbox .cardbox-item img{
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
</style>
		
</head>


<body onload="myFunction()">
<c:set var="adminUser" value="${database.getUser(user_id)}"/>

<h4><a href="showHome?user_id=${user_id }">Home</a> </h4>
<h1 style="text-align:center;">See Posts</h1>



<section class="hero">
	<div class="container">
         <div class="row">
         <c:forEach items="${posts }" var="post">
         	<c:set var="postUser" value="${database.getUser(post.getUser_id()) }"/>
         		
         		
	          	
			  <!-- offset-lg-3 -->
			   <div class="col-lg-6 ">
				
				<div class="cardbox shadow-lg bg-white">
				 
				 <div class="cardbox-heading">
				  <!-- START dropdown-->
				  <div class="dropdown float-right">
				   <button class="btn btn-flat btn-flat-icon" type="button" data-toggle="dropdown" aria-expanded="false">
					<em class="fa fa-ellipsis-h"></em>
				   </button>
				   <div class="dropdown-menu dropdown-scale dropdown-menu-right" role="menu" style="position: absolute; transform: translate3d(-136px, 28px, 0px); top: 0px; left: 0px; will-change: transform;">
					<c:if test="${user_id ne postUser.getId() }">
						<a class="dropdown-item" href="showReceiver?user_id=${user_id }&contact_id=${postUser.getId()}">See Profile</a>
					</c:if>
					<c:if test="${user_id eq postUser.getId() }">
						<a class="dropdown-item" href="viewProfile?user_id=<c:out value="${user_id}"/>">See Profile</a>
					</c:if>
					<a class="dropdown-item" href="#">Stop following</a>
					<a class="dropdown-item" href="#">Report</a>
				   </div>
				  </div><!--/ dropdown -->
				  <div class="media m-0">
				   <div class="d-flex mr-3">
					<a href=""><img class="img-fluid rounded-circle" src="data:image/jpg;base64,${postUser.getPicture_str()}" alt="User"></a>
				   </div>
				   <div class="media-body">
				    <p class="m-0"><c:out value="${postUser.getName() }"/> </p>
					<small><span><i class="icon ion-md-pin"></i> ${post.getDate()}</span></small>
					<small><span><i class="icon ion-md-time"></i> ${post.getTime() }</span></small>
				   </div>
				  </div><!--/ media -->
				 </div><!--/ cardbox-heading -->
				  
				 <div id="${post.getId()}" class="cardbox-item">
				  <img class="img-fluid" src="data:image/jpg;base64,${post.getPost()}" alt="Image">
				 </div><!--/ cardbox-item -->
				 <div class="cardbox-base">
				  <ul class="float-right">
				   <li><a><i class="fa fa-comments"></i></a></li>
				   <li><a><em class="mr-5">0</em></a></li>
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
				   			<a href="likePost?user_id=${adminUser.getId()}&post_id=${post.getId()}"><i class="fa fa-thumbs-up" style="font-size:36px;"></i></a>
				   		</c:if>
				   		<c:if test="${alreadyLiked eq 1 }">
				   			<a href="disLikePost?user_id=${adminUser.getId()}&post_id=${post.getId()}"><i class="fa fa-thumbs-up" style="font-size:36px;color:blue"></i></a>
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
				 <!-- 
				 <div class="cardbox-comments">
				  <span class="comment-avatar float-left">
				   <a href=""><img class="rounded-circle" src="data:image/jpg;base64,${adminUser.getPicture_str()}" alt="..."></a>                            
				  </span>
				  <!-- <div class="search">
				   <input placeholder="Write a comment" type="text">
				   <button><i class="fa fa-camera"></i></button>
				  </div><!--/. Search -->
				 <!--  
				 </div>		  
				-->
				<!--/ cardbox-like -->	
				</div><!--/ cardbox -->
	
	           </div><!--/ col-lg-6 -->	
			 
	          
	          
	          
	          <!-- TIME PASS START HERE -->
	          
	          
	          
	          <!-- TIME PASS ENDS HERE -->
	          
          </c:forEach>
          
          </div><!--/ row -->
	</div><!--/ container -->
</section>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	
</script>
</body>

</html>


