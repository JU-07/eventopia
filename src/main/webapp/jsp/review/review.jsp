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
<link rel="stylesheet" href="css/event.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/index.css">
</head>
<body>
<div class="title" style="text-align: center">
	<h1 style="font-size: 50px">レビュー登録</h1>
</div>
	<section class="event-form-section"
		style="display: flex; justify-content: space-between; gap: 20px; flex-wrap: wrap;">
	
		<div class="movie-form-container" style="flex: 1; min-width: 300px;">
			<form action="resultRegC" method="post" enctype="multipart/form-data">
				<div class="movie-form">
					<div class="form-group">
						<label for="title">イベント タイトル</label> <input id="title" name="title"
							type="text" placeholder="イベント タイトル" required>
					</div>

					<div class="form-group">
						<label for="Name">商品名</label> <input id="Name" name="Name"
							type="text" placeholder="商品名" required>
					</div>

					<div class="form-group">
						<label for="file">ファイルアップロード</label> <input id="file" name="file"
							type="file" required>
					</div>

					<div class="form-group">
						<label for="story">商品説明</label>
						<textarea id="story" name="story" rows="5" maxlength="200"
							placeholder="商品説明" required></textarea>
					</div>

					<div class="form-group">
						<button type="submit" class="movie-btn">イベント登録</button>
					</div>
				</div>
			</form>
		</div>

		<!-- 상품 목록 -->
		<div class="product-list-container" style="flex: 2; min-width: 500px; style="text-align: center"">
			<h1>商品目録</h1>
			<div class="product-container">
				<c:forEach var="product" items="${product}">
					<div class="product-wrap">
						<div class="product-img">
							<img alt="${product.p_title}" src="">
						</div>
						<div class="product-title"
							onclick="location.href='EventDetailC?no=${product.p_no}'">
							${product.p_title}</div>
						<div class="product-price">${product.p_price}원</div>
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
	</section>

</body>
</html>
