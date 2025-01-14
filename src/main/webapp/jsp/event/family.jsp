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
</head>
<body>
	<div class="header" style="text-align: center; margin-top: 20px;">
		<h1>ローソン·イベント·ページ</h1>
	</div>


	<section class="event-info-section"
		style="display: flex; justify-content: center; gap: 20px; margin: 40px auto;">
		<div class="movie-info-container" style="flex: 1; min-width: 350px;">
			<div class="movie-info">
				<div class="form-group">
					<label for="title">이벤트 제목</label>
					<p>${event.title}</p>
			
				</div>

				<div class="form-group">
					<label for="Name">상품 이름</label>
					<p>${event.name}</p>
					
				</div>

				<div class="form-group">
					<label for="file">파일</label>
					<p>
						<img src="${event.filePath}" alt="상품 이미지"
							style="max-width: 100%; height: auto;" />
					</p>
				</div>
				<div class="form-group">
					<label for="story">상품 설명</label>
					<p>${event.story}</p>
				</div>
			</div>
		</div>
	</section>


	<section class="pagination-section"
		style="text-align: center; margin-top: 40px;">
		<div class="pagination"
			style="display: flex; justify-content: center; gap: 10px;">
			<a href="ReviewPageC?p=1">[처음]</a>
			<c:forEach begin="1" end="${pageCount}" var="i">
				<a href="ReviewPageC?p=${i}">[${i}]</a>
			</c:forEach>
			<a href="ReviewPageC?p=${pageCount}">[끝]</a>
		</div>
	</section>

</body>
</html>
