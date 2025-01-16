<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>세븐일레븐 이벤트 페이지</title>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/event.css">
<style>
.event-info-container {
	border: 1px solid black;
	border-radius: 5px;
	width: 300px;
	height: 300px;
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
}

.event-info img {
	max-width: 80%;
	height: auto;
}
</style>

<div class="event-container">
	<c:forEach var="e" items="${events}">
		<div class="event-wrap"
			onclick="location.href='EventDetailC?no=${r.r_no}'">
			<div class="event-img">
				<img alt="" src="${e.e_img}">
			</div>
			<div class="event-title">${e.e_title}</div>
			<div class="event-name">${e.e_name}</div>
			<div class="event-sub">${e.e_sub}</div>
			<div class="event-text">${e.e_text}</div>
		</div>
	</c:forEach>
	<c:if test="${empty events}">
		<p style="text-align: center"><h2>すみません、現在進行中のコラボはありません。</h2></p>
		</c:if>

	</div>
<section class="pagination-section"
	style="text-align: center; margin-top: 40px;">
	<div class="pagination"
		style="display: flex; justify-content: center; gap: 10px;">
		<a href="EventPageC?p=1">始</a>
		<c:forEach begin="1" end="${pageCount}" var="i">
			<a href="EventPageC?p=${i}">[${i}]</a>
		</c:forEach>
		<a href="EventPageC?p=${pageCount}">終</a>
	</div>

			</body>

		</html>
