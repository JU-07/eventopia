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
</head>
<body>
	<div class="title" style="text-align: center">
		<h2 style="font-size: 50px">全てコラボレーション</h2>
	</div>
	<div class="event-container">
		<c:forEach var="e" items="${events }">
			<div class="event-wrap">
				<div class="event-name">
					<h3>편의점이름</h3>
					<div>${e.e_name}</div>
				</div>
				<div class="event-title">
				<h3>제목</h3>
					<div>${e.e_title}</div>
				</div>
				<div class="event-img">
					<div>
						<h3>이미지</h3>
						 <img alt="" src="${e.e_image_url}">
					</div>
				</div>
				<div class="event-text">
				<h3>내용</h3>
				${e.e_story}
				</div>
				<div class="event-text">
				<h3>요약내용</h3>
				${e.e_short_story}
				</div>
				<h3>날짜</h3>
				<fmt:formatDate value="${e.e_date }" />
			</div>
			<div class="event-text">
				<h3>좋아요</h3>
				${e.e_good}
				</div>
		</c:forEach>
		<c:if test="${empty event}">
			<p style="text-align: center">
			<h2 style="text-align: center">すみません、現在レビューがありません。</h2>
			</p>
		</c:if>
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
	<div class="add-event">
		<a href="EventRegC">登録</a>
	</div>

	<br>
</body>
</html>
