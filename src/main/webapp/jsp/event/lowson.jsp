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
	width: 1000px;
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

.SNS {
	display: flex;
	justify-content: center; /* 가운데 정렬 */
	gap: 10px; /* 버튼 간 간격 */
	margin-top: 20px;
}

/* SNS 버튼 스타일 */
.SNS button {
	background-color: #fff;
	border: none;
	padding: 0;
	cursor: pointer;
	border-radius: 50%; /* 원형 버튼 만들기 */
	display: flex;
	align-items: center;
	justify-content: center;
	width: 50px; /* 버튼 크기 */
	height: 50px; /* 버튼 크기 */
	font-size: 14px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: background-color 0.3s;
}

/* SNS 버튼 이미지 크기 */
.SNS button img {
	width: 24px; /* 이미지 크기 조정 */
	height: 24px; /* 이미지 크기 조정 */
}

/* 호버 효과 */
.SNS button:hover {
	background-color: #f0f0f0;
}
</style>

<div style="text-align: center">
	<h2>現在のローソンコラボレーションイヴェント</h2>
</div>


<div class="event-info-container">
	<div class="event-info">
		<c:forEach items="${event }" var="e">
			<div class="form-group">
				<label for="title">이벤트 제목</label>
				<p>${event.e_title}</p>
			</div>
			<div class="form-group">
				<label for="Name">상품 이름</label>
				<p>${event.e_name}</p>
			</div>
			<div class="form-group">
				<label for="file">이미지</label>
				<p>
					<img src="${event.e_img}" />
				</p>
			</div>
			<div class="form-group">
				<label for="story">상품 설명</label>
				<p>${event.e_text}</p>
			</div>
			<div class="form-group">
				<label for="sub">상품 요약 설명</label>
				<p>${event.e_sub}</p>
			</div>
			<div class="form-group">
				<label for="date">날짜</label>
				<p>${ sysdate}</p>
			</div>

		</c:forEach>
		<c:if test="${empty event}">
			<p style="text-align: center">
			<h2 style="text-align: center">すみません、現在レビューがありません。</h2>
			</p>
		</c:if>
	</div>
</div>
<section class="pagination-section"
	style="text-align: center; margin-top: 40px;">
	<div class="pagination"
		style="display: flex; justify-content: center; gap: 10px;">
		<a href="EventPageC?p=1">初</a>
		<c:forEach begin="1" end="${pageCount}" var="i">
			<a href="EventPageC?p=${i}">[${i}]</a>
		</c:forEach>
		<a href="EventPageC?p=${pageCount}">終</a>
	</div>
</section>
<div class="SNS"
	style="font-size: 10pt; text-align: center; margin-top: 20px;">
	<button type="button" class="btn-share-tw" data-url="${event.link}"
		style="padding: 0; border: none;">
		<img
			src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/X_icon.svg/2048px-X_icon.svg.png"
			alt="X" style="width: 100%; height: 100%; object-fit: cover;">
	</button>
	<button type="button" class="btn-share-fb" data-url="${event.link}"
		style="padding: 0; border: none;">
		<img
			src="https://upload.wikimedia.org/wikipedia/commons/5/51/Facebook_f_logo_%282019%29.svg"
			alt="Facebook" style="width: 100%; height: 100%; object-fit: cover;">
	</button>
	<button type="button" class="btn-share-ln" data-url="${event.link}"
		style="padding: 0; border: none;">
		<img
			src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/LINE_logo.svg/1024px-LINE_logo.svg.png"
			alt="Line" style="width: 100%; height: 100%; object-fit: cover;">
	</button>
</div>
</body>
</html>
