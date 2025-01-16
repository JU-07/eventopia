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
/* SNS 버튼 컨테이너를 Flexbox로 설정 */
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
	<h2>セブン-イレブン イベントページ</h2>
	<div class="event-container">
		<c:forEach var="e" items="${event}">
			<div class="event-wrap"
				onclick="location.href='EventDetailC?no=${event.e_no}'">
				<div class="event-img">
					<img alt="" src="${event.e_img}">
				</div>
				<div class="event-title">${event.e_title}</div>
				<div class="event-name">${event.e_name}</div>
				<div class="event-sub">${event.e_sub}</div>
				<div class="event-text">${event.e_text}</div>
			</div>
		</c:forEach>
		<c:if test="${empty events}">
			<p style="text-align: center">
			<h2>すみません、現在進行中のコラボはありません。</h2>
			</p>
		</c:if>
	</div>
	<section class="pagination-section"
		style="text-align: center; margin-top: 40px;">
		<div class="pagination"
			style="display: flex; justify-content: center; gap: 10px;">
			<a href="ReviewPageC?p=1">始</a>
			<c:forEach begin="1" end="${pageCount}" var="i">
				<a href="ReviewPageC?p=${i}">[${i}]</a>
			</c:forEach>
			<a href="ReviewPageC?p=${pageCount}">終</a>
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
</body>
</html>

