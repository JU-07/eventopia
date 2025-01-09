<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<link rel="stylesheet"  href="css/home.css" >
</head>
<body>
	<div class="container">
		<div class="title"> 
		<img alt="" src="">
		</div>
		<div class="navi">
			<div>
				<a href="RankC">Ranking</a>
			</div>
			<div>
				<a href="ReviewC">Review</a>
			</div>
			<div>
				<a href="CommuC">Community</a>
			</div>
			<div>
				<a href="EventC">Event</a>
			</div>
			<div>
				<a href="MainC">MainPage</a>
			</div>
		</div>
		<div class="content">
			<jsp:include page="${content }"></jsp:include>
		</div>
	</div>





</body>
</html>