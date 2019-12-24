<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src= 
"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"> 
    </script> 
<script> 
        $(document).ready(function() { 
            $("body").click(function() { 
                $(document).scrollTop($(document).height()); 
            }); 
        }); 
 </script> 
<style>
body {
  margin: 0 auto;
  max-width: 800px;
  padding: 0 20px;
}

.container {
  border: 2px solid #dedede;
  background-color: #f1f1f1;
  border-radius: 5px;
  padding: 10px;
  margin: 10px 0;
}

.darker {
  border-color: #ccc;
  background-color: #ddd;
}

.container::after {
  content: "";
  clear: both;
  display: table;
}

.container img {
  float: left;
  max-width: 60px;
  width: 100%;
  margin-right: 20px;
  border-radius: 50%;
}

.container img.right {
  float: right;
  margin-left: 20px;
  margin-right:0;
}

.time-right {
  float: right;
  color: #aaa;
}

.time-left {
  float: left;
  color: #999;
}
img {
  border-radius: 50%;
}
</style>

</head>
<body>

<h4>
<a href="showGroup?group_id=<c:out value="${group.group_id}"/> &user_id=<c:out value="${user_id}"/>">Go Home</a>
</h4>

<h1>Welcome in Group <c:out value="${group. group_name }"/></h1> &nbsp; &nbsp; 

<br>
<br>

<h1>
Group Description: <c:out value="${group. description}"/>
<BR><BR>

</h1>

<h5>
<a href="leaveGroup?user_id=${user_id }&group_id=${group.group_id}">Leave Group
</a>
</h5>

<BR><BR>
Total Members: <c:out value="${group. total_members}"/>
<BR><BR>

<c:if test="${user_id eq group.getAdmin_id() }">
	Since you are Admin of this Group you have the privilege of adding members<BR>
	<a href="addMember?user_id=<c:out value="${user_id}"/>&group_id=${group.group_id}">+ADD MEMBER</a>
	
</c:if>
<BR><BR>

Group Members :
<c:forEach items="${users }" var="member">
     
    <div class="container">
			<img src="data:image/jpg;base64,${member.picture_str}" alt="Avatar" style="width:100%;">
			<p><c:out value="${member.name}"/>
			<c:if test="${group.getAdmin_id() ne member.getId() }">
				<c:if test="${user_id eq group.getAdmin_id() }">
					<a href="removeMember?member_id=${member.getId() }&group_id=${group.group_id }&user_id=${user_id}">
						Remove
					</a>
				</c:if>
			</c:if>
			</p>
			
			<c:if test="${member.getId() eq group.getAdmin_id() }">
				ADMIN
			</c:if>
			<c:if test="${member.getId() ne group.getAdmin_id() }">
				MEMBER
			</c:if>
	</div>

</c:forEach> 
<BR><BR>


</body>
</html>