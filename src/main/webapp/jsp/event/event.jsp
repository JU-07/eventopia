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
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', () => {
    // 트위터 공유
    document.querySelectorAll('.btn-share-tw').forEach(button => {
        button.addEventListener('click', (event) => {
            const sendText = '편의점 콜라보';
            const pageUrl = event.target.dataset.url;
            window.open(`https://twitter.com/intent/tweet?text=${sendText}&url=${pageUrl}`);
        });
    });

    // 페이스북 공유
    document.querySelectorAll('.btn-share-fb').forEach(button => {
        button.addEventListener('click', (event) => {
            const pageUrl = event.target.dataset.url;
            window.open(`http://www.facebook.com/sharer/sharer.php?u=${pageUrl}`);
        });
    });

    // 라인 공유
    document.querySelectorAll('.btn-share-ln').forEach(button => {
        button.addEventListener('click', (event) => {
            const pageUrl = event.target.dataset.url;
            window.open(`https://social-plugins.line.me/lineit/share?url=${pageUrl}`);
        });
    });
});
</script>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
	color: #333;
}

div.title {
	text-align: center;
	padding: 20px 0;
	background-color: #007bff;
	color: white;
	margin-bottom: 30px;
}

div.event-container {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	gap: 20px;
	padding: 20px;
	max-width: 1200px;
	margin: 0 auto;
}

div.event-wrap {
	background: #fff;
	border: 1px solid #e0e0e0;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	padding: 20px;
}

div.event-wrap:hover {
	transform: translateY(-5px);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

div.event-wrap img {
	width: 100%;
	height: auto;
	border-radius: 4px;
	margin-bottom: 15px;
}

div.event-wrap h3 {
	font-size: 18px;
	font-weight: bold;
	color: #007bff;
	margin-bottom: 10px;
}

div.event-wrap div {
	margin-bottom: 15px;
	font-size: 14px;
	color: #555;
}

.pagination-section {
	text-align: center;
	margin-top: 30px;
}

.pagination a {
	display: inline-block;
	padding: 8px 12px;
	background-color: #007bff;
	color: white;
	text-decoration: none;
	border-radius: 4px;
	margin: 0 5px;
	transition: background-color 0.3s;
}

.pagination a:hover {
	background-color: #0056b3;
}

.SNS {
	display: flex;
	justify-content: center;
	gap: 10px;
	margin: 20px 0;
}

.SNS button {
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 50%;
	width: 40px;
	height: 40px;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: background-color 0.3s;
}

.SNS button:hover {
	background-color: #f0f0f0;
}

.SNS button img {
	width: 20px;
	height: 20px;
}

.add-event {
	text-align: center;
	margin: 30px 0;
}

.add-event a {
	display: inline-block;
	padding: 10px 20px;
	background-color: #28a745;
	color: white;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s;
}

.add-event a:hover {
	background-color: #218838;
}
</style>
</head>
<body>
	<div class="title">
		<h2>全てコラボレーション</h2>
	</div>
	<div class="event-container">
		<c:forEach var="e" items="${events }">
			<div class="event-wrap">
				<h3>편의점 이름</h3>
				<div>${e.e_name}</div>
				<h3>제목</h3>
				<div>${e.e_title}</div>
				<h3>이미지</h3>
				<img alt="" src="${e.e_image_url}">
				<h3>내용</h3>
				<div>${e.e_story}</div>
				<h3>요약내용</h3>
				<div>${e.e_short_story}</div>
				<h3>날짜</h3>
				<fmt:formatDate value="${e.e_date }" />
				<h3>좋아요</h3>
				<div>${e.e_good}</div>
			</div>
		</c:forEach>
	</div>
	<section class="pagination-section">
		<div class="pagination">
			<a href="EventPageC?p=1">初</a>
			<c:forEach begin="1" end="${pageCount}" var="i">
				<a href="EventPageC?p=${i}">[${i}]</a>
			</c:forEach>
			<a href="EventPageC?p=${pageCount}">終</a>
		</div>
	</section>
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
	<div class="add-event">
		<a href="EventRegC">登録</a>
	</div>
</body>
</html>
