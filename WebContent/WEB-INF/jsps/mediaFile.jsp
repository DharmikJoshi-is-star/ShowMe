<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<!-- THIS LINK ARE FOR MODAL  -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<style>
.round {border-radius: 50%;}
</style>
<body>

<!-- /
/
/
/
/
/ -->



<div class="container">
  <h2>Simple Collapsible</h2>
  <p>Click on the button to toggle between showing and hiding content.</p>
  <button type="button" class="btn btn-info round" data-toggle="collapse" data-target="#mediaMenuBar">Simple collapsible</button>
  
  <div id="mediaMenuBar" class="collapse">
  <ul>
  <button class="button round"><li class="fa fa-file-pdf-o" style="font-size:48px"> </li></button>
 
  <BR>
 <button class="button round"><li class="fa fa-file-pdf-o" style="font-size:48px"> </li></button>
  <BR>
  <button class="button round"><li class="fa fa-file-picture-o" style="font-size:48px"> </li></button>
 
  </ul>
  </div>
</div>


<!-- /
/
/
/
/
/
/ -->
<!--  -->
<div class="container">
  <h2>Large Modal</h2>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalToDisplayForm">myModalToDisplayForm</button>

  <!-- Modal -->
  <div class="modal fade" id="myModalToDisplayForm" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Select Picture </h4>
        </div>
        <div class="modal-body">
          
	<sf:form action="insertMedia?user_id=${ user_id}&contact_id=${contact_id}&type=picture" modelAttribute="media" method="post">
	
	Select Picture: <sf:input type="file" path="filePath" name="mediaFile"  onchange="readURL(this);"/><BR><BR>
	Selected file:
	
	<BR>
	
		<img id="blah" src="http://placehold.it/180" width="400" height="400" alt="your image" align="middle"/>
		<BR>
	Description: <sf:input  type="text" path="description" /><BR><BR>
	<input  type="submit">
	</sf:form>
	<script type="text/javascript">
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah')
                    .attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
	</script>
	<HR>
	    </div>
      
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
        </div>
      </div>
    </div>
  </div>
</div>



<div class="container">
  <h2>Large Modal</h2>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalToDisplayFormForDocumentFile">#myModalToDisplayFormForDocumentFile</button>

  <!-- Modal -->
  <div class="modal fade" id="myModalToDisplayFormForDocumentFile" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Select File</h4>
        </div>
        <div class="modal-body">
		<sf:form action="insertMedia?user_id=${ user_id}&contact_id=${contact_id}&type=document" modelAttribute="media" method="post">
		2
		Select Picture: <sf:input  type="file" path="filePath" onchange="readDocument(this);"/><BR><BR>
		<iframe id="documentId" src="" width="500px" height="500px"></iframe>
		Description: <sf:input  type="text" path="description" /><BR><BR>
		<input  type="submit">
		
		</sf:form>
	
	
	
		<script type="text/javascript">
    function readDocument(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#documentId')
                    .attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
	</script>
	<HR>
	
	
	
        </div>
      
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
        </div>
      </div>
    </div>
  </div>
</div>




<BR><BR>
<HR>
<BR><BR>

Previous Transfers:
<BR>

<c:forEach items="${mediaList}" var="media">


<div class="container">
  <h2>Large Modal</h2>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalFor${media.getId() }">myModalFor${media.getId() }</button>

  <!-- Modal -->
  <div class="modal fade" id="myModalFor${media.getId() }" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>This is a large modal.</p>
          
	Sender: <c:out value="${media.getSender() }"/><BR>
	Receiver: <c:out value="${media.getReceiver() }"/><BR>
	MEDIA: 
	
	<c:out value="${media.getPicture() }"/><BR>
	
	<c:if test="${media.getType() == 'PICTURE' }">
	
	  <img src="data:image/jpg;base64,${media.getPicture()}" alt="hhj" width="100px" height="100px"> 
					
	</c:if>
	
	<c:if test="${media.getType() == 'DOCUMENT' }">
		<iframe src="data:application/pdf;base64,${media.getDocument() }" width="100%" height="500px"></iframe>
	</c:if>
	

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
        </div>
      </div>
    </div>
  </div>
</div>


	
</c:forEach>

</body>
</html>