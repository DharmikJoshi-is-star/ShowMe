<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<!-- 
FROM HERE MY OLD DESIGN START
HOME PAGE
<br><br>
<!-- <a href="show-addcontact-form?user_id=<c:out value="${user_id}"/>">-->
<!--  
<a href="findFriends?userId=<c:out value="${user_id}"/>">
findFriends</a>
---
<a href="checkRequest?userId=<c:out value="${user_id}"/>">
friend requests</a>
<br>
<br>

<c:set var="user_id" scope="session" value="${user_id}"> </c:set>

<c:forEach items="${contacts}" var="contact" >
	            
	Chat with: <a href="chat?contact_id=<c:out value="${contact.getContact_id()}"/>&user_id=<c:out value="${contact.getUser_id() }"/>">
		<c:out value="${contact.getName() }"/>
	</a>
	<br>
	<br>
	            	       
</c:forEach>

<c:forEach items="${groups }" var="group">

	Your member of <a href="showgroup?id=${group.group_id }&user_id=<c:out value="${user_id}"/>"><c:out value="${group.getGroup_name() }"/></a> Group
	<br>
	<br>
</c:forEach>

<a href="show-editprofile-form?user_id=<c:out value="${user_id}"/>">
Edit profile</a>
<a href="show-group-form?user_id=<c:out value="${user_id}"/>" >Create a group</a>

</body>
AT THIS POINT MY OLD DESIGN STOPS
-->
<!-- <img src="data:image/jpg;base64,${image}" width="140" height="200"/>
<br>

<sf:form method="post" action="process-editprofile-form" modelAttribute="user">


<sf:input type="file" name="Click to change" path="picture_str"/> <sf:errors path="picture_str"/>

<br><br>
Name: <sf:input type="text" path="name"/> <sf:errors path="name"/>
<br><br>
Email: <sf:input type="text" path="email" /> <sf:errors path="email"/>
<br><br>
Contact: <sf:input type="text" path="contact" /> <sf:errors path="contact"/>
<br><br>
Password: <sf:input type="text" path="password"/> <sf:errors path="password"/>
<br><br>

<input type="submit">

</sf:form> -->

</body>
</html>