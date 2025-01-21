<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/rankPage.css">
</head>

<body>
<div class="nav-bar">
<div class="nav-items">
<a href="RankC">콜라보 랭킹</a>
<a href="LimitedC">콜라보 랭킹</a>
<a href="RankPageC">역대 콜라보 랭킹</a>
<a href="LimitedPageC">역대 기간한정 랭킹</a>
<a href="#">미니 게임</a>
<a href="RankRegC">게시물 등록</a>
</div>
</div>

	<div class="rnakPage-container">
		<c:forEach var="r" items="${rank}">
			<div class="rankPage-wrap"
				onclick="location.href='RankDetailC?no=${r.p_no}'">
				<div class="rankPage-img">
					<img alt="${r.p_title}" src="${r.p_img}">
				</div>
				<div class="movie-title">${r.p_title}</div>
				<div class="rnakPage-actor">${r.p_actor}</div>
			</div>
		</c:forEach>
	</div>



</body>
</html>