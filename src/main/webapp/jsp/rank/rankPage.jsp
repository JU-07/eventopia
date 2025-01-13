<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="width: 100%; display: flex; justify-content: center;">
		<div class="movie-container">
		<c:forEach var="movie" items="${movies }">
		<div class="movie-wrap">
		<div class="movie-img"><img alt="" src="jsp/movie/movieFile/${movie.m_img }"></div>
	<div class="movie-title" onclick="location.href='MovieDetailC?no=${movie.m_no}'">${movie.m_title}</div>
		<div class="movie-actor">${movie.m_actor }</div>
		
	</div>	</c:forEach>
</body>
</html>