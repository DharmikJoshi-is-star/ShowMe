<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ShowMe</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
<style>



.my-margin{
	margin-top: 6rem;
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
.header-text{
color: gray;
}

.slidecontainer {
  width: 100%;
}

.slider {
  -webkit-appearance: none;
  width: 50%;
  height: 25px;
  background: linear-gradient(117deg,#ffffff 0,#1ebea5 50%);
  border-radius : 25px;
  outline: none;
  opacity: 0.7;
  -webkit-transition: .2s;
  transition: opacity .2s;
}

.slider:hover {
  opacity: 1;
}

.slider::-webkit-slider-thumb {
  -webkit-appearance: none;
  appearance: none;
  width: 35px;
  height: 35px;
  border-radius: 50%;
  background: #f1f1f1;
  cursor: pointer;
}

.slider::-moz-range-thumb {
  width: 25px;
  height: 25px;
  background: #4CAF50;
  cursor: pointer;
}

</style>

</head>
<body>


<a href="viewProfile?user_id=<c:out value="${user.getId()}"/>"><< home</a>

<div align="center" style="background-color:lightgray;">
<h1 style="text-align:center;" class="header-text">CheckOut Interest</h1>


	<h1>Customise Your area of interest</h1>
	<p>Drag the slider to set the value of interest.</p>
	
	<form method="post" action="updateProfileInterest?user_id=${user.getId()}">	
		<c:set var="c" value="0"/>
		<c:forEach items="${user.getUserInterest() }" var="interest">
			<c:set var="c" value="${c+1}"/>
			<div class="slidecontainer">
				<b>${interestName.get(c-1) } : </b>
			  <input type="range" min="1" max="10" value="${interest }" class="slider" name="myInterest${ c }" id="myInterest${ c }">
			  Value: <span id="demo${ c }"></span>
			  <br>
			</div>
		</c:forEach>	
		<BR>
		<input type="submit" value="SET">
		<BR>
		<BR>
	</form>
</div>


</body>


<script>
//1
var slider1 = document.getElementById("myInterest1");
var output1 = document.getElementById("demo1");
output1.innerHTML = slider1.value;

slider1.oninput = function() {
  output1.innerHTML = this.value;
}
/////////

//2
var slider2 = document.getElementById("myInterest2");
var output2 = document.getElementById("demo2");
output2.innerHTML = slider2.value;

slider2.oninput = function() {
  output2.innerHTML = this.value;
}
/////////

//3
var slider3 = document.getElementById("myInterest3");
var output3 = document.getElementById("demo3");
output3.innerHTML = slider3.value;

slider3.oninput = function() {
  output3.innerHTML = this.value;
}
/////////

//4
var slider4 = document.getElementById("myInterest4");
var output4 = document.getElementById("demo4");
output4.innerHTML = slider4.value;

slider4.oninput = function() {
  output4.innerHTML = this.value;
}
/////////

//5
var slider5 = document.getElementById("myInterest5");
var output5 = document.getElementById("demo5");
output5.innerHTML = slider5.value;

slider5.oninput = function() {
  output5.innerHTML = this.value;
}
/////////

//6
var slider6 = document.getElementById("myInterest6");
var output6 = document.getElementById("demo6");
output6.innerHTML = slider6.value;

slider6.oninput = function() {
  output6.innerHTML = this.value;
}
/////////

//7
var slider7 = document.getElementById("myInterest7");
var output7 = document.getElementById("demo7");
output7.innerHTML = slider7.value;

slider7.oninput = function() {
  output7.innerHTML = this.value;
}
/////////

//8
var slider8 = document.getElementById("myInterest8");
var output8 = document.getElementById("demo8");
output8.innerHTML = slider8.value;

slider8.oninput = function() {
  output8.innerHTML = this.value;
}
/////////

//9
var slider9 = document.getElementById("myInterest9");
var output9 = document.getElementById("demo9");
output9.innerHTML = slider9.value;

slider9.oninput = function() {
  output9.innerHTML = this.value;
}
/////////

//10
var slider10 = document.getElementById("myInterest10");
var output10 = document.getElementById("demo10");
output10.innerHTML = slider10.value;

slider10.oninput = function() {
  output10.innerHTML = this.value;
}
/////////





</script>

</html>