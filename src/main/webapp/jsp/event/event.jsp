<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Page</title>
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
</head>
<style>
/* 부모 컨테이너를 Flexbox로 설정 */
.event-row {
	display: flex; /* Flexbox로 수평 정렬 */
	gap: 20px; /* 이벤트 카드 간 간격 */
	justify-content: center; /* 가운데 정렬 */
	margin-bottom: 40px; /* 행 간 간격 */
}

/* 각 이벤트 카드 크기 */
.event-container {
	flex: 1; /* 동일한 크기로 확장 */
	max-width: 100%; /* 각 카드가 차지하는 최대 너비 */
	border: 1px solid #ddd;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	font-family: Arial, sans-serif;
}

/* SNS 버튼 컨테이너 */
.SNS {
	display: flex; /* Flexbox로 버튼 나란히 정렬 */
	gap: 10px; /* 버튼 간 간격 */
	justify-content: center; /* 가운데 정렬 */
	margin-top: 20px; /* 위 콘텐츠와 간격 */
}

/* SNS 버튼 스타일 */
.SNS button {
	background-color: #fff;
	border: none;
	padding: 10px;
	cursor: pointer;
	margin: 5px;
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
<body>
	<div class="head" style="text-align: center">
		<h2>全てコラボレーションイベント</h2>
	</div>
	<br>
	<div class="event-row">
		<div class="event-container">
			<c:forEach items="${event}" var="e">
				<div class="content">
					<div class="event-content">
						<div class="event-title">이벤트 제목</div>
						<div>${event.e_title }</div>
						<div class="event-img">사진</div>
						<div>${event.e_img }</div>
						<div class="event-txt">이벤트 내용</div>
						<div>${event.e_text }</div>
						<div class="event-user">
							<div>좋아요</div>
							<div>공유</div>
						</div>
					</div>
			</c:forEach>
			<c:if test="${empty event}">
				<div style="text-align: center; margin-bottom: 20px;">
					<h2>すみません、現在進行中のコラボはありません。</h2>
				</div>
			</c:if>
		</div>


	</div>
	<!-- SNS 공유 버튼 -->
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
