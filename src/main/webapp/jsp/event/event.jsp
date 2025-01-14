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
</style>

<div class="event-row">
	<!-- 이벤트 1 -->
	<div class="event-container">
		<div class="head">
			<h1>Event Page 1</h1>
		</div>
		<div class="content">
			<div class="date">
				<strong>作成日</strong>
				<fmt:formatDate value="${event.sysdate}" pattern="yyyy-MM-dd" />
			</div>
			<div class="img">
				<strong>イメージ</strong> <a href="${event.imageLink}"> <img
					alt="Event Image" src="${event.imageSrc}" />
				</a>
			</div>
			<div class="text">
				<strong>イベント内容</strong>
				<textarea rows="5" cols="50" readonly>${event.description}</textarea>
			</div>
			<div class="link">
				<strong>イベントリンク</strong> <a href="${event.link}" target="_blank">イベントをよく見る</a>
			</div>
			<div class="SNS">
				<button type="button" class="btn-share-tw" data-url="${event.link}">ツイッター共有</button>
				<button type="button" class="btn-share-fb" data-url="${event.link}">フェイスブック共有</button>
				<button type="button" class="btn-share-ln" data-url="${event.link}">ライン共有</button>
			</div>
		</div>
	</div>

	<!-- 이벤트 2 -->
	<div class="event-container">
		<div class="head">
			<h1>Event Page 2</h1>
		</div>
		<div class="content">
			<div class="date">
				<strong>作成日</strong>
				<fmt:formatDate value="${event.sysdate}" pattern="yyyy-MM-dd" />
			</div>
			<div class="img">
				<strong>イメージ</strong> <a href="${event.imageLink}"> <img
					alt="Event Image" src="${event.imageSrc}" />
				</a>
			</div>
			<div class="text">
				<strong>イベント内容</strong>
				<textarea rows="5" cols="50" readonly>${event1.description}</textarea>
			</div>
			<div class="link">
				<strong>イベントリンク</strong> <a href="${lowson.link}" target="_blank">イベントをよく見る</a>
			</div>
			<div class="SNS">
				<button type="button" class="btn-share-tw" data-url="${event.link}">ツイッター共有</button>
				<button type="button" class="btn-share-fb" data-url="${event.link}">フェイスブック共有</button>
				<button type="button" class="btn-share-ln" data-url="${event.link}">ライン共有</button>
			</div>
		</div>
	</div>
</div>

<div class="event-row">
	<!-- 이벤트 3 -->
	<div class="event-container">
		<div class="head">
			<h1>Event Page 3</h1>
		</div>
		<div class="content">
			<div class="date">
				<strong>作成日</strong>
				<fmt:formatDate value="${event.sysdate}" pattern="yyyy-MM-dd" />
			</div>
			<div class="img">
				<strong>イメージ</strong> <a href="${event.imageLink}"> <img
					alt="Event Image" src="${event.imageSrc}" />
				</a>
			</div>
			<div class="text">
				<strong>イベント内容</strong>
				<textarea rows="5" cols="50" readonly>${event.description}</textarea>
			</div>
			<div class="link">
				<strong>イベントリンク</strong> <a href="${event.link}" target="_blank">イベントをよく見る</a>
			</div>
			<div class="SNS">
				<button type="button" class="btn-share-tw" data-url="${event.link}">ツイッター共有</button>
				<button type="button" class="btn-share-fb" data-url="${event.link}">フェイスブック共有</button>
				<button type="button" class="btn-share-ln" data-url="${event.link}">ライン共有</button>
			</div>
		</div>
	</div>

	<div class="event-container">
		<div class="head">
			<h1>Event Page 4</h1>
		</div>
		<!-- 이벤트 4 내용 -->
		<div class="content">
			<div class="date">
				<strong>作成日</strong>
				<fmt:formatDate value="${event1.sysdate}" pattern="yyyy-MM-dd" />
			</div>
			<div class="img">
				<strong>イメージ</strong> <a href="${event1.imageLink}"> <img
					alt="Event Image" src="${event1.imageSrc}" />
				</a>
			</div>
			<div class="text">
				<strong>イベント内容</strong>
				<textarea rows="5" cols="50" readonly>${event1.description}</textarea>
			</div>
			<div class="link">
				<strong>イベントリンク</strong> <a href="${event1.link}" target="_blank">イベントをよく見る</a>
			</div>
			<div class="SNS">
				<button type="button" class="btn-share-tw" data-url="${event.link}">ツイッター共有</button>
				<button type="button" class="btn-share-fb" data-url="${event.link}">フェイスブック共有</button>
				<button type="button" class="btn-share-ln" data-url="${event.link}">ライン共有</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>
