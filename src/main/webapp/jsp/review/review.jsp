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
<link rel="stylesheet" href="css/review.css">
<script type="text/javascript" src="js/reviewdetail.js"></script>
<style>
</style>
</head>
<body>

	<div class="review-container">
		<c:forEach var="r" items="${reviews}">
			<div class="review-content">
				<div class="review-title" onclick="location.href='ReviewDetailC?no=${r.r_no}'">${r.r_title }</div>
				<div class="review-img">
				<img alt="" src="${r.r_img }">
				</div>
				<div class="review-sub">${r.r_sub }</div>
				<div class="review-txt">${r.r_text }</div>
				<div class="review-user">
					<div>좋아요</div>
					<div>공유</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="SNS">
		<button type="button" class="btn-share-tw" data-url="${event.link}">
			<img
				src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/X_icon.svg/2048px-X_icon.svg.png"
				alt="X">
		</button>
		<button type="button" class="btn-share-fb" data-url="${event.link}">
			<img
				src="https://upload.wikimedia.org/wikipedia/commons/5/51/Facebook_f_logo_%282019%29.svg"
				alt="Facebook">
		</button>
		<button type="button" class="btn-share-ln" data-url="${event.link}">
			<img
				src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/LINE_logo.svg/1024px-LINE_logo.svg.png"
				alt="Line">
		</button>
	</div>
	<section class="pagination-section">
		<div class="pagination">
			<a href="ReviewPageC?p=1">初</a>
			<c:forEach begin="1" end="${pageCount}" var="i">
				<a href="ReviewPageC?p=${i}">[${i}]</a>
			</c:forEach>
			<a href="ReviewPageC?p=${pageCount}">終</a>
		</div>
	</section>
	<div class="add-review">
		<a href="ReviewRegC">登録</a>
	</div>
</body>
</html>



