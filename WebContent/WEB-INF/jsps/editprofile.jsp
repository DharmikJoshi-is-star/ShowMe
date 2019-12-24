<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
<h1>Edit Profile</h1>

<sf:form method="post" action="process-editprofile-form?image=${image}" modelAttribute="user">
	
	<img src="data:image/jpg;base64,${image}" width="200" height="200" />
	<br>
	<sf:input type="hidden" path="id"/> 
	
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
	
</sf:form>
<c:out value="${image }"></c:out><hr>

<a href="viewProfile?user_id=<c:out value="${user_id}"/>">back</a>
</body>
</html>