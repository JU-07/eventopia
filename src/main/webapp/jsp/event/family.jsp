<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>패밀리마트 이벤트 페이지</title>
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

<div class="event-info-container">
	<div class="event-info">
		<div class="form-group">
			<label for="title">이벤트 제목</label>
			<p>${event.e_title}</p>
		</div>

		<div class="form-group">
			<label for="Name">상품 이름</label>
			<p>${event.e_name}</p>
		</div>

		<div class="form-group">
			<label for="file">파일</label>
			<p>
				<img src="${event.e_filePath}" alt="상품 이미지"
					style="max-width: 100%; height: auto;" />
			</p>
		</div>

		<div class="form-group">
			<label for="story">상품 설명</label>
			<p>${event.e_story}</p>
		</div>
	</div>
</div>
<section class="pagination-section"
		style="text-align: center; margin-top: 40px;">
		<div class="pagination"
			style="display: flex; justify-content: center; gap: 10px;">
			<a href="LowsonPageC?p=1">[처음]</a>
			<c:forEach begin="1" end="${pageCount}" var="i">
				<a href="LowsonPageC?p=${i}">[${i}]</a>
			</c:forEach>
			<a href="LowsonC?p=${pageCount}">[끝]</a>
		</div>
	</section>
</body>
</html>
