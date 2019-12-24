<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

<BR>
<a href="backToFindFriend?user_id=${user_id}">back</a>
<BR>

<h1>Profile</h1>

<img src="data:image/jpg;base64,${request.getPicture_str()}" width="200" height="200" />
<BR><BR>
<c:out value="${request.getName() }"/>

<BR>
</body>
</html>