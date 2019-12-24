<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Group form</h1>

<h4>
<a href="showHome?user_id=<c:out value="${user_id}"/>">Go Home</a>
</h4>

<c:set var="user_id" value="${user_id }"></c:set>
<c:set var="admin_id" value="${user_id }"></c:set>
<c:set var="contacts" value="${contacts }"></c:set>

<sf:form action="create-group" method="post" modelAttribute="group">

	<sf:hidden path="admin_id" name="admin_id" />
	Group name : <sf:input path="group_name" name="group_name"/>
	<br><br>
	Description : <sf:input path="description" name="description"/>
	<br><br>
	Select Group Members:
	<br><br>
	<c:forEach items="${contacts}" var="contact">
		<sf:checkbox  path="Members_id" name="Members_id" value="${contact.getContact_id() }" label="${contact.getName()}"/>
		<br>		<br>
	</c:forEach>
	<input type="submit" value="Create Group">
	
</sf:form>



</body>
</html>