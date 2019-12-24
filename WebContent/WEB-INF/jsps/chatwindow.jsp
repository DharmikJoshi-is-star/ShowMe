<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="d" uri="http://java.sun.com/jsp/jstl/sql"%>
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

<img src="data:image/jpg;base64,${contact_image}" width="200" height="200" />

<h1>Hello <c:out value="${contact_name }"/></h1> &nbsp; &nbsp; <a href="refresh?user_id=<c:out value="${user_id}"/>&contact_id=<c:out value="${contact_id}"/>">Refresh</a>
<br>
<br>

Previous chats

<br><br>

<d:setDataSource driver="com.mysql.jdbc.Driver"  password="" user="root" url="jdbc:mysql://localhost:3306/whatsapp_msg_db" var="chat_messages"/>

 <!-- <button>Click for last message!</button> 
 -->
<c:forEach items="${messages}" var="message" >
	
	            <c:if test="${message.getSender() eq  contact_id}">
		            <div class="container">
		  				<img src="data:image/jpg;base64,${contact_image}" alt="Avatar" style="width:100%;">
		  				<p><c:out value="${message.getMsg() }"/></p>
		  				<span class="time-right"><c:out value="${message.getTime()}"/></span>
					</div>
				</c:if>
				<c:if test="${message.getSender() eq  user_id}">
				<div class="container darker">
					  <img src="data:image/jpg;base64,${user_image}" alt="Avatar" class="right" style="width:100%;">
					  <p><c:out value="${message.getMsg() }"/></p>
					  <span class="time-left"><c:out value="${message.getTime()}"/></span>
				</div>
				</c:if>
	<!-- 
	Sender: <c:out value="${message.getSender()}"/> Message: <c:out value="${message.getMsg() }"/>
	<br>
	<br>
	 -->            	       
</c:forEach>

<form id="msgbox" action="send-message" method="post">
<input type="hidden" name="user_id" value="<c:out value="${user_id }"/>">
<input type="hidden" name="contact_id" value="<c:out value="${contact_id }"/>">
<input type="text" name="message"> <br>
<input type="submit" value="sent">
</form>

<br>
<br>
<c:out value="${msg }"/>

</body>
</html>