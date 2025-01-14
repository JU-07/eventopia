<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: flex-start;
	background-color: #f9f9f9;
}

.rnakPage-container {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
	gap: 16px;
	padding: 20px;
	max-width: 1280px;
	width: 100%;
	margin-left: 50px;
	margin-right: 50px;
}

.rankPage-wrap {
	background: #ffffff;
	border: 1px solid #e0e0e0;
	border-radius: 8px;
	overflow: hidden;
	text-align: center;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	cursor: pointer;
	padding: 12px;
}

.rankPage-wrap:hover {
	transform: translateY(-5px);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
}

.rankPage-img img {
	width: 100%;
	height: 180px;
	object-fit: cover;
	border-radius: 4px;
}

.movie-title {
	font-size: 16px;
	font-weight: bold;
	color: #333333;
	margin: 10px 0 5px;
}

.rnakPage-actor {
	font-size: 14px;
	color: #777777;
	word-wrap: break-word; /* 단어가 길 경우 줄바꿈 */
	white-space: normal; /* 텍스트가 칸을 넘어가면 자동 줄바꿈 */
	line-height: 1.4; /* 줄 간격 조절 */
	overflow-wrap: break-word; /* 추가로 긴 단어를 잘라서 줄바꿈 */
}
</style>
</head>
<body>
	<a href="RankRegC">게시글 등록</a>
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