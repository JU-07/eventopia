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
	max-width: 45%; /* 각 카드가 차지하는 최대 너비 */
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
	margin: 5px 0; /* 상하 여백 제거 */
	border-radius: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 150px;
	font-size: 14px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: background-color 0.3s;
}

.SNS button:hover {
	background-color: #f0f0f0;
}

/* SNS 버튼 이미지 */
.SNS button img {
	width: 20px;
	height: 20px;
	margin-right: 10px;
}
</style>
<div class="head" style="text-align: center">
	<h2>全てコラボレーションイベント</h2>
</div>
<br>
<div class="event-row">
	<!-- 이벤트 1 -->
	<div class="event-container">
		<c:forEach items="${event}" var="e">
			<div class="content">
				<div class="title">
					<strong>題目</strong> <input onclick="location.href='EventDetailC'">${event.title}</input>
				</div>
				<div class="date">
					<strong>作成日</strong>
					<fmt:formatDate value="${event.e_date}" pattern="yyyy-MM-dd" />
				</div>
				<div class="img">
					<strong>イメージ</strong> <img alt="Event Image" src="${event.e_img}" />
				</div>
				<div class="text">
					<strong>イベント内容</strong>
					<textarea rows="5" cols="50" readonly>${event.e_text}</textarea>
				</div>
			</div>
		</c:forEach>
		<div class="SNS" style="font-size: 10pt">
			<!-- SNS 공유 버튼 -->
			<button type="button" class="btn-share-tw" data-url="${event.link}">
				<img
					src="https://cdn2.iconfinder.com/data/icons/threads-by-instagram/24/x-logo-twitter-new-brand-512.png"
					alt="X"> X（旧ツイッター）
			</button>
			<button type="button" class="btn-share-fb" data-url="${event.link}">
				<img
					src="https://upload.wikimedia.org/wikipedia/commons/5/51/Facebook_f_logo_%282019%29.svg"
					alt="Facebook"> フェイスブック
			</button>
			<button type="button" class="btn-share-ln" data-url="${event.link}">
				<img
					src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/LINE_logo.svg/1024px-LINE_logo.svg.png"
					alt="Line"> ライン
			</button>
		</div>
	</div>
</div>
</body>
</html>
