<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>event page</title>
<link rel="stylesheet" href="css/event.css">
<link rel="stylesheet" href="review.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/event.js"></script>
</head>
<body>
	<div class="event-container">

		<div class="event-content lawson">
			<div class="event-title">이벤트 제목</div>
			<img src="icon/main/lawson_event1.jpg" class="event-img" />
			<div class="event-txt">이벤트 내용</div>
			<div class="event-user">
				<div>좋아요</div>
				<div>공유</div>
			</div>
		</div>

		<c:if test="${empty events}">
			<h2 style="text-align: center">すみません、現在レビューがありません。</h2>
		</c:if>
	</div>
	<section class="pagination-section">
		<div class="pagination">
			<a href="EventPageC?p=1"><span><<</span></a>
			<c:forEach begin="1" end="${pageCount}" var="i">
				<a href="EventPageC?p=${i}">[${i}]</a>
			</c:forEach>
			<a href="EventPageC?p=${pageCount}">>></a>
		</div>
	</section>
	<div class="add-event">
		<a href="EventRegC">登録</a>
	</div>
</body>
</html>
