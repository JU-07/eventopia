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
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/index.css">
</head>
<body>
	<div class="title" style="text-align: center">
		<h1 style="font-size: 50px">レビュー登録</h1>
	</div>

	<div>
		<a href="ReviewRegC">리뷰 등록</a>
	</div>
	<br>
	<div class="product-list-container"
		style="flex: 1; min-width: 500px; height: 500px; display: flex; flex-direction: column; justify-content: space-between; text-align: center;">
		<h1>コラボ·レビュー目録</h1>
		<div class="product-container">
			<c:forEach var="product" items="${product}">
				<div class="product-wrap">
					<div class="product-img">
						<img alt="${product.p_title}" src="">
					</div>
					<div class="product-title"
						onclick="location.href='EventDetailC?no=${product.p_no}'">
						${product.p_title}</div>
					<div class="product-price">${product.p_price}円</div>
				</div>
			</c:forEach>
		</div>
		<section class="pagination-section">
			<div class="pagination"
				style="display: flex; justify-content: center; gap: 10px;">
				<a href="ReviewPageC?p=1">初</a>
				<c:forEach begin="1" end="${pageCount}" var="i">
					<a href="EventPageC?p=${i}">[${i}]</a>
				</c:forEach>
				<a href="ReviewPageC?p=${pageCount}">末</a>
			</div>
		</section>
	</div>
	
</body>
</html>


