<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Add Contact</h1> <br>
<c:out value="${user_id }"/>
<sf:form method="post" action="process-addcontact-form" modelAttribute="addcontact">

<input type="hidden" name="user_id" value="<c:out value="${user_id }"/>">

Name: <sf:input type="text" path="name"/> <sf:errors path="name"/>
<br><br>
Email: <sf:input type="text" path="email"/> <sf:errors path="email"/>
<br><br>
Contact: <sf:input type="text" path="contact"/> <sf:errors path="contact"/>
<br><br>

<input type="submit">
</sf:form>


</body>
</html>