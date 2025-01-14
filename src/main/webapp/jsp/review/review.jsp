<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f5f5f5;
}
.review-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
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
}

.review-wrap:hover {
    transform: translateY(-5px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

.review-img img {
    width: 100%;
    height: 200px;
    object-fit: cover;
    border-radius: 4px;
    margin-bottom: 10px;
}

.review-title {
    font-size: 18px;
    font-weight: bold;
    color: #333;
    margin: 10px 0;
}

.review-actor {
    font-size: 14px;
    color: #666;
    line-height: 1.6;
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
    <h1>レビュー一覧</h1>
</div>

<div class="add-review">
    <a href="ReviewRegC">리뷰 등록</a>
</div>

<div class="review-container">
    <c:forEach var="r" items="${review}">
        <div class="review-wrap" onclick="location.href='ReviewDetailC?no=${r.p_no}'">
            <div class="review-img">
                <img src="${r.p_img}" alt="${r.p_title}">
            </div>
            <div class="review-title">${r.p_title}</div>
            <div class="review-actor">${r.p_actor}</div>
        </div>
    </c:forEach>
</div>
</body>
</html>
