<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<style>
.im {
	position: relative;
	top: 30px;
}

span {
	
}

.review-row {
	align-items: center;
	width: 400px;
	justify-content: center;
	margin-left: 20%;
}

body {
	font-family: Arial, sans-serif;
}
/* 모달 스타일 */
.modal {
	display: none; /* 처음에는 숨김 */
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 1000;
	background: white;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	border-radius: 8px;
	width: 400px;
	height: 500px;
	text-align: center;
}

.modal-overlay {
	display: none; /* 처음에는 숨김 */
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
	color: black;
}

.modal-footer {
	margin-top: 20px;
	text-align: right;
}

.modal-footer button {
	padding: 5px 10px;
}
</style>

</head>
<body>
	<h1 style="text-align: center;">랭킹 순위</h1>
	<div style="margin-left: 30%;">TOP10</div>
	<c:forEach items="${product }" var="p">
		<div class="review-row">
			<span>${p.p_name} </span> <span> ${p.p_price }원 </span> <span>
				${p.p_category } </span> <span class="im"><img src="${p.image_url}" alt="Sample Image"
				width="70" height="70" display="column" /> </span>

		</div>
	</c:forEach>

	<button onclick="openModal()">모달</button>
	<div class="modal-overlay" id="modal-overlay"></div>
	<form id="voteForm" action="RankC" method="POST">
		<div class="modal" id="modal">
			<div class="modal-header">모달 창</div>
			<div class="modal-body">
				<div style="color: black;">
					<c:forEach items="${product }" var="p">
						<div class="review-row">
							<span>${p.p_name}</span><span>${p.p_price }원</span> <span>${p.p_category }</span><span class="im"><img
								src="${p.image_url}" alt="Sample Image" width="70" height="70"
								display="column" /> </span> <span><input type="checkbox"
								name="check" value="${p.p_no }"></span>
						</div>
					</c:forEach>

				</div>
				<div class="modal-footer">
					<button onclick="submitVote()">투표완료</button>
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