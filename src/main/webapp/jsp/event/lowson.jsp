<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>로손 이벤트 페이지</title>
<link rel="stylesheet" href="css/event.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/index.css">
</head>
<body>


	<div class="header">
		<h1>로손 이벤트 페이지</h1>
	</div>

	<div class="movie-form-container">
		<form action="resultRegC" method="post" enctype="multipart/form-data">
			<div class="movie-form">
				<div class="form-group">
					<label for="title">Title</label> <input id="title" name="title"
						type="text" placeholder="이벤트 제목" required>
				</div>

				<div class="form-group">
					<label for="actor">Name</label> <input id="Name" name="Name"
						type="text" placeholder="상품 이름" required>
				</div>

				<div class="form-group">
					<label for="file">File</label> <input id="file" name="file"
						type="file" required>
				</div>

				<div class="form-group">
					<label for="story">Story</label>
					<textarea id="story" name="story" rows="5" placeholder="상품 설명"
						required></textarea>
				</div>
			</div>
		</form>
	</div>
	<div class="product-list-container">
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
	</div>
	</div>

	<div class="pagination">
		<a href="EventPageC?p=1">[begin]</a>
		<c:forEach begin="1" end="${pageCount}" var="i">
			<a href="EventPageC?p=${i}">[${i}]</a>
		</c:forEach>
		<a href="EventPageC?p=${pageCount}">[end]</a>
	</div>

</body>
</html>
