<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Chat Application</title>
<style type="text/css">
.my-margin{
	margin-top: 12rem;
}
.my-width{
	width:70%;
}
.my-bg{
	background-color: #1ebea5;
	color: #fff;
}
.my-text{
	color: #1ebea5;
}

</style>
</head>
<body>
<h1>Group form</h1>

<h4>
<a href="showHome?user_id=<c:out value="${user_id}"/>">Go Home</a>
</h4>

<c:set var="user_id" value="${user_id }"></c:set>
<c:set var="admin_id" value="${user_id }"></c:set>
<c:set var="contacts" value="${contacts }"></c:set>
<div class="container my-margin">
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">Create a Group</h5>
			<p class="card-text">Create a group for your family, friends and closed ones.</p>
			<sf:form action="create-group" method="post" modelAttribute="group">
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">Group Name</label>
					<div class="col-sm-10">
						<sf:hidden path="admin_id" name="admin_id" />
						<sf:input path="group_name" class="form-control" id="inputName" name="group_name" placeholder="ex: School Gang"/>
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword" class="col-sm-2 col-form-label">Description</label>
					<div class="col-sm-10">
						<sf:input path="description" class="form-control" name="description" placeholder="ex: Besties forever"/>
					</div>
				</div>
				Select Group Members:
				<ul class="list-group list-group-flush">
					<c:forEach items="${contacts}" var="contact">
						<div class="input-group container">
							<div class="input-group-prepend">
								<div class="input-group-text">
									
									<sf:checkbox style="font-size: 5px;" class="form-control" path="Members_id" name="Members_id" value="${contact.getContact_id() }" label="${contact.getName()}"/>
									
								</div>
							</div>
						</div>
					</c:forEach>	
				</ul>
				<div class="card-body">
					<input type="submit" class="btn my-bg align-self-center" value="Create new Group">
				</div>
			</sf:form>
		</div>
	</div>	
</div>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>