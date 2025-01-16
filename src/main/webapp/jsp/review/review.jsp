<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰 페이지</title>
<link rel="stylesheet" href="css/review.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/index.css">
<style type="text/css">
.review-container {
	display: grid;
	gap: 20px;
	padding: 40px;
	max-width: 1200px;
	margin: 0 auto;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.review-wrap {
	background: #ffffff;
	border: 1px solid #e0e0e0;
	border-radius: 8px;
	overflow: hidden;
	text-align: center;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	cursor: pointer;
	padding: 15px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.review-wrap:hover {
	transform: translateY(-5px);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

.review-img img {
	width: 100%;
	height: 180px;
	object-fit: cover;
	border-radius: 4px;
	margin-bottom: 10px;
}

.review-title {
	font-size: 18px;
	font-weight: bold;
	color: #333;
	margin: 10px 0;
	cursor: pointer;
}

.review-name {
	font-size: 14px;
	color: #777;
	margin-bottom: 10px;
}

.review-sub {
	font-size: 12px;
	color: #888;
	margin-bottom: 15px;
	word-wrap: break-word;
	text-overflow: ellipsis;
}

.review-text {
	font-size: 14px;
	color: #555;
	line-height: 1.5;
}

.add-review {
	display: flex;
	justify-content: center;
	margin: 20px 0;
}

.add-review a {
	display: inline-block;
	padding: 10px 20px;
	background-color: #007bff;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.add-review a:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>

	<div class="header">
		<h1>리뷰 목록</h1>
	</div>


	<div class="review-container">
		<c:forEach var="r" items="${reviews}">
			<div class="review-wrap"
				onclick="location.href='ReviewDetailC?no=${r.r_no}'">
				<div class="review-img">
					<img alt="" src="${r.r_img}">
				</div>
				<div class="review-title" onclick="location.href='ReviewDetailC?no=${r.r_no}'">${r.r_title}</div>
				<div class="review-name">${r.r_name}</div>
				<div class="review-sub">${r.r_sub}</div>
				<div class="review-text">${r.r_text}</div>
			</div>
		</c:forEach>
		<c:if test="${empty reviews}">
			<p><h2>現在レビューがありません。</h2></p>
		</c:if>

	</div>
	<div class="add-review">
		<a href="ReviewRegC">리뷰 등록</a>
	</div>

</body>
</html>
