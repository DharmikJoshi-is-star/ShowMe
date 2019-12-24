<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chat Application</title>
<style>
img {
  border-radius: 50%;
}
</style>
</head>
<body>
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
</body>
</html>