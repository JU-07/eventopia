<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로손 이벤트 페이지</title>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/event.css">
<style>
.event-info-container {
	border: 1px solid black;
	border-radius: 5px;
	width: 300px;
	height: auto; /* 높이는 내용에 따라 자동 조정 */
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding: 20px;
	margin: 20px auto;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

/* 개별 요소들 간 간격 유지 */
.form-group {
	margin-bottom: 20px; /* 요소들 간 여백 */
	text-align: center;
	width: 100%;
}

/* 구분선 스타일 */
.form-group:not(:last-child) {
	border-bottom: 1px solid #ddd; /* 구분선 추가 */
	padding-bottom: 10px; /* 구분선 위 여백 */
	margin-bottom: 20px; /* 구분선 아래 여백 */
}

/* 이미지 크기 제한 */
.event-info img {
	max-width: 80%;
	height: auto;
}

.img {
	font-size: 5px;
}
.p{
text-align: center;
}
</style>

<div class="review-container">
		<c:forEach var="r" items="${reviews}">
			<div class="review-wrap"
				onclick="location.href='ReviewDetailC?no=${r.r_no}'">
				<div class="review-img">
					<img alt="" src="${r.r_img}">
				</div>
				<div class="review-title">${r.r_title}</div>
				<div class="review-name">${r.r_name}</div>
				<div class="review-sub">${r.r_sub}</div>
				<div class="review-text">${r.r_text}</div>
			</div>
		</c:forEach>
		<c:if test="${empty reviews}">
			<p style="text-align: center"><h1>現在進行中のコラボはありません。</h1></p>
		</c:if>

	</div>
<section class="pagination-section"
	style="text-align: center; margin-top: 40px;">
	<div class="pagination"
		style="display: flex; justify-content: center; gap: 10px;">
		<a href="ReviewPageC?p=1">[始]</a>
		<c:forEach begin="1" end="${pageCount}" var="i">
			<a href="ReviewPageC?p=${i}">[${i}]</a>
		</c:forEach>
		<a href="ReviewPageC?p=${pageCount}">[終]</a>
	</div>
</section>
</body>
</html>
