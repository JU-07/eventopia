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
<!-- main.css로 기본 스타일 유지 -->
<link rel="stylesheet" href="css/event.css">
<!-- 필요시 이벤트 페이지 전용 스타일 추가 -->
</head>
<body>

	<!-- 헤더 -->
	<div class="header" style="text-align: center; margin-top: 20px;">
		<h1>로손 이벤트 페이지</h1>
	</div>

	<!-- 등록된 정보 표시 -->
	<section class="event-info-section"
		style="display: flex; justify-content: center; gap: 20px; margin: 40px auto;">
		<div class="movie-info-container" style="flex: 1; min-width: 350px;">
			<div class="movie-info">
				<div class="form-group">
					<label for="title">이벤트 제목</label>
					<p>${event.title}</p>
					<!-- 이벤트 제목을 출력 -->
				</div>

				<div class="form-group">
					<label for="Name">상품 이름</label>
					<p>${event.name}</p>
					<!-- 상품 이름을 출력 -->
				</div>

				<div class="form-group">
					<label for="file">파일</label>
					<p>
						<img src="${event.filePath}" alt="상품 이미지"
							style="max-width: 100%; height: auto;" />
					</p>
					<!-- 이미지 출력 -->
				</div>

				<div class="form-group">
					<label for="story">상품 설명</label>
					<p>${event.story}</p>
					<!-- 상품 설명을 출력 -->
				</div>
			</div>
		</div>
	</section>

	<!-- 상품 목록 -->
	<section class="product-list-section"
		style="text-align: center; margin-top: 40px;">
		<h2>상품 목록</h2>
		<div class="product-list-container">
			<div class="product-container">
				<c:forEach var="product" items="${product}">
					<div class="product-wrap">
						<div class="product-img">
							<img alt="${product.p_title}" src="" />
						</div>
						<div class="product-title"
							onclick="location.href='EventDetailC?no=${product.p_no}'">
							${product.p_title}</div>
						<div class="product-price">${product.p_price}원</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<!-- 페이지 네비게이션 -->
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
