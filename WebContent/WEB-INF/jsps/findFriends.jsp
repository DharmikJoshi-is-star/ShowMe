<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Chat Application</title>
<style type="text/css">
#fb{
  width:500px;
  border:1px solid gray;
  border-radius:5px;
  position:relative;
  height:175px;
}
#fb p{
  font-family:sans-serif;
  margin: 0 0 0 10px;
  line-height:30px;
}

#fb-top span{
  color:#4267B2;
  float:right;
  margin-right:10px;
}
#fb-top{
  background-color:#efefef;
  height:30px;
  width:500px;
  border-radius:5px 5px 0 0;
  position:absolute;
  top:-1px;
  left:-1px;
  border:1px solid gray;
}

#fb img{
  position:absolute;
  left:10px;
  top:52.5px;
}

#info{
  position:absolute;
  left:120px;
  top:75px;
}

#info {
  color:#4267B2;
  line-height:25px;
  font-size:18px;
}

#info span{
  color:#777;
  font-size:14px;
}

#button-block{
  position:absolute;
  right:10px;
  top:85px;
}

#button-block div{
  display:inline-block;
}

#confirm, #delete{
  background-color:#FFFFFF;
  color: white;
  padding:7px;
  border-radius:2px;
  margin-right:10px;
  font-family:sans-serif;
}

#delete{
  color:#222;
  background-color:#bbb;
  border:1px solid #999;
  padding:6px;
  margin-right:0;
}

#button-block div:hover{
  opacity:.8;
  cursor:pointer;
}

</style>
</head>
<body>
<h1>FRIEND REQUESTS</h1><BR>
<h4>
<a href="showHome?user_id=${userId }">Go Home</a>
</h4>

	
	<c:forEach items="${users }" var="user">
	
	<c:set value="0" var="loop"/>
	
	<c:forEach items="${requestedUsers }" var="requested">

			<c:if test="${user.getId() eq requested.request_by}">
				
				<c:if test="${loop eq 0 }">
				
				<c:set value="1" var="loop"/>
				
				<div id="fb">
				  <div id="fb-top">
				    <p><b>Confirm Friend Requests</b><span>Find Friends &bull; Settings</span></p>
				  </div>	  
				  <img src="data:image/jpg;base64,${user.picture_str}" height="100" width="100" alt="Unknown">
				  
				 
				  <p id="info"><b><a href="showFindFriendProfile?user_id=${userId}&f_id=${user.id}&type=accept">
				  <c:out value="${user.name }"/></a> </b><br> </p>
				 
				  
				  <div id="button-block">
				  <div id="confirm" ><a href="addFromFindFriend?userId=${userId}&contactId=${user.id}">Accept Request</a></div>
				  <!-- <div id="delete">Delete Request</div>  -->
				  </div>
				</div>
				</c:if>
			</c:if>
			
	</c:forEach>


	
	
	<c:forEach items="${alreadyRequestedUsers }" var="alreadyRequestedUser">
		
		<c:if test="${loop eq 0 }">
			<c:if test="${user.getId() eq  alreadyRequestedUser.getRequest_to()}">
				<c:set value="1" var="loop"/>
				<div id="fb">
					  <div id="fb-top">
						    <p><b>Already Requested</b><span>Find Friends &bull; Settings</span></p>
						  </div>
						 
						  <img src="data:image/jpg;base64,${user.picture_str}" height="100" width="100" alt="Unknown">
						  <p id="info"><b><a href="showFindFriendProfile?user_id=${userId}&f_id=${user.id}&type=delete">
						  <c:out value="${user.name }"/></a></b> <br></p> 
						  <div id="button-block">
						  <div id="confirm" ><a href="deleteRequest?userId=${userId}&requestId=${user.id}">delete request</a></div>
						 
					  </div>
				</div>
				
			</c:if>
		</c:if>
	</c:forEach>

	<c:if test="${loop eq 0 }">
		<div id="fb">
				  <div id="fb-top">
				    <p><b>Sent Friend Requests</b><span>Find Friends &bull; Settings</span></p>
				  </div>
				 
				  <img src="data:image/jpg;base64,${user.picture_str}" height="100" width="100" alt="Unknown">
				  <p id="info"><b><a href="showFindFriendProfile?user_id=${userId}&f_id=${user.id}&type=request">
				  <c:out value="${user.name }"/></a></b> <br></p> 
				  <div id="button-block">
				  <div id="confirm" ><a href="sentRequest?userId=${userId}&requestId=${user.id}">Sent Request</a></div>
				 
				  </div>
				</div>
	</c:if>

	
			
	</c:forEach>
	
	

</body>
</html>