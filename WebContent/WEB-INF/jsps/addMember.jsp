<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chat Application</title>
</head>

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
<body>

<a href="groupInformation?user_id=${user_id}&group_id=${group.group_id}">
BACK</a>

ADD Members in <c:out value="${group.getGroup_name() }"/> Group


<c:forEach items="${nonMembers }" var="user">
	
	<div id="fb">
	  <div id="fb-top">
	    <p><b>Add Friend In Group</b><span>Add Friends &bull; Settings</span></p>
	  </div>	  
	  <img src="data:image/jpg;base64,${user.picture_str}" height="100" width="100" alt="Unknown">
	  <p id="info"><b><c:out value="${user.name }"></c:out></b> <br> 
	  <div id="button-block">
	  <div id="confirm" ><a href="addFriendToGroup?user_id=${user_id}&contact_id=${user.id}&group_id=${group.group_id}">+ADD</a></div>
	 
	  </div>
	</div>

</c:forEach>

</body>
</html>