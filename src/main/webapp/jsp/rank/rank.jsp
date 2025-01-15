<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body.rank-page .content-container {
   background-color: rgb(255, 243, 219); /* 원하는 색상 */
}
body {
	font-family: Arial, sans-serif;
	/* margin: 0;
	padding: 0; */
	background-color: rgb(255, 243, 219);
}

h1 {
	text-align: center;
	color: #333;
	margin-top: 20px;
}

.container {
  display: flex;
  justify-content: space-between; /* 좌우 공간 나누기 */
  margin: 20px auto;
  width: 90%; /* 컨테이너 너비 */
}

.left, .right {
  width: 60%; /* 좌우 영역 각각 48% */
}

.review-row {
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 80%;
	margin: 10px auto;
	padding: 10px;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
.review-row2 {
	
	flex-direction: column;
	gap: 10px;
	

}

.review-row img {
	
	  width: 300px;
    height: 300px;
    object-fit: cover;
    border-radius: 4px;
}

.modal {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 1000;
	background: white;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	border-radius: 8px;
	width: 90%;
	max-width: 400px;
}

.modal-content {
	max-height: 400px; /* 모달 내용의 최대 높이 */
	overflow-y: auto; /* 내용이 넘칠 경우 스크롤 활성화 */
}

.modal-overlay {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 999;
}

.modal-header {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
	color: #333;
}

.modal-footer {
	margin-top: 20px;
	text-align: right;
}

.modal-footer button {
	padding: 5px 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.modal-footer button:first-child {
	background-color: #4CAF50;
	color: white;
	margin-right: 10px;
}

.modal-footer button:last-child {
	background-color: #f44336;
	color: white;
}

.fixed-button {
	position: fixed;
	right: 20px;
	top: 50%;
	transform: translateY(-50%);
	z-index: 100;
	background-color: #007BFF;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	cursor: pointer;
}

.fixed-button:hover {
	background-color: #0056b3;
}
</style>

</head>
<body class="rank-page">
<div id="wrap">
<a href="RankPageC">역대랭킹</a> 
	<h1>랭킹 순위</h1>
	
	<div class="container">
	<div class="left">
	<div style="text-align: center;; margin-bottom: 20px; color: #666;">콜라보 Top 5</div>
	<c:forEach items="${product }" var="p">
		<div class="review-row">
			<div class="review-row2">
			<div>${p.p_title}</div>
			<div>${p.p_actor}</div>
			</div>
			<img src="${p.p_img}" alt="Sample Image" width="150" height="150" />
		</div>
	</c:forEach>
	</div>
	 <div class="right">
	
	</div>
</div>
	<button class="fixed-button" onclick="openModal()">투표하기</button>

	<div class="modal-overlay" id="modal-overlay"></div>
	<form id="voteForm" action="RankC" method="POST">
		<div class="modal" id="modal">
			<div class="modal-header">투표 페이지</div>
			<div class="modal-body">
				<div class="modal-content">
				<div style="color: black;">
					<c:forEach items="${product }" var="p">
						<div class="review-row">
							<span>${p.p_title}</span>
							<span>${p.p_actor}원</span>
							
							<img src="${p.p_img}" alt="Sample Image" width="70" height="70" />
							<span><input type="checkbox" name="check" value="${p.p_no}" /></span>
						</div>
					</c:forEach>
					<c:forEach items="${product }" var="p">
						<div class="review-row">
							<span>${p.p_title}</span>
							<span>${p.p_actor}원</span>
							<img src="${p.p_img}" alt="Sample Image"/>
							<span><input type="checkbox" name="check" value="${p.p_no}" /></span>
						</div>
					</c:forEach>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" onclick="submitVote()">투표 완료</button>
					<button type="button" onclick="closeModal()">닫기</button>
				</div>
			</div>
		</div>
	</form>
</div>
</body>
	<script>
		// 모달 열기 함수
		function openModal() {
			document.getElementById('modal').style.display = 'block';
			document.getElementById('modal-overlay').style.display = 'block';
		}

		// 모달 닫기 함수
		function closeModal() {
			document.getElementById('modal').style.display = 'none';
			document.getElementById('modal-overlay').style.display = 'none';
		}

		function submitVote() {
			const form = document.getElementById('voteForm');
			form.submit();
		}
	</script>
</html>