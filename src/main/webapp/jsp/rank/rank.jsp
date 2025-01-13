<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
}

h1 {
	text-align: center;
	color: #333;
	margin-top: 20px;
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

.review-row img {
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
<body>
	<h1>랭킹 순위</h1>
	<div style="text-align: center; margin-bottom: 20px; color: #666;">기간한정 Top 5</div>
	<c:forEach items="${product }" var="p">
		<div class="review-row">
			<span>${p.p_name}</span>
			<span>${p.p_price}원</span>
			<span>${p.p_category}</span>
			<img src="${p.image_url}" alt="Sample Image" width="70" height="70" />
		</div>
	</c:forEach>

	<button class="fixed-button" onclick="openModal()">투표하기</button>

	<div class="modal-overlay" id="modal-overlay"></div>
	<form id="voteForm" action="RankC" method="POST">
		<div class="modal" id="modal">
			<div class="modal-header">투표 페이지</div>
			<div class="modal-body">
				<div style="color: black;">
					<c:forEach items="${product }" var="p">
						<div class="review-row">
							<span>${p.p_name}</span>
							<span>${p.p_price}원</span>
							<span>${p.p_category}</span>
							<img src="${p.image_url}" alt="Sample Image" width="70" height="70" />
							<span><input type="checkbox" name="check" value="${p.p_no}" /></span>
						</div>
					</c:forEach>
				</div>
				<div class="modal-footer">
					<button type="button" onclick="submitVote()">투표 완료</button>
					<button type="button" onclick="closeModal()">닫기</button>
				</div>
			</div>
		</div>
	</form>

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
</body>
</html>