<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="RankRegC">게시글 등록</a>
<div style="width: 100%; display: flex; justify-content: center;">
		<div class="rnakPage-container">
		<c:forEach var="r" items="${rank }">
		
		<div class="rankPage-wrap" onclick="location.href='RankDetailC?no=${r.p_no}'">
		<div class="rankPage-img"><img alt="" src="${r.p_img }" style="width:250px; height: 250px; object-fit: contain;"> </div>
	<div class="movie-title">${r.p_title}</div>
		<div class="rnakPage-actor">${r.p_actor }</div>
		
	</div> </div>	</c:forEach>
</body>
</html>