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

<h1>Profile of <c:out value="${receiver.getName() }"/></h1>
<a href="data:image/jpg;base64,${receiver.getPicture_str()}"  download="${receiver.getName()} profile">
	<img src="data:image/jpg;base64,${receiver.getPicture_str()}" width="200" height="200" />
</a>
<br><br>	
Name: <c:out value="${receiver.getName() }"/>
<br><br>
Email: <c:out value="${receiver.getEmail() }"/>
<br><br>
Contact: <c:out value="${receiver.getContact() }"/>
<br><br>

<a href="removeFriend?user_id=<c:out value="${user_id }"/>&contact_id=<c:out value="${receiver.getId() }"/>">Click Here!</a> To remove as a friend
<BR><BR>
<a href="showChat?user_id=<c:out value="${user_id }"/>&contact_id=<c:out value="${receiver.getId() }"/>">Home</a>

</body>
</html>