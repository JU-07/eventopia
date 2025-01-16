<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록 페이지</title>
<link rel="stylesheet" href="css/review.css">
<style>
.container {
	width: 100%;
	margin: 20px auto;
	background-color: #ffffff;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.form-group {
	margin-bottom: 10px; /* 위아래 요소 간격 최소화 */
	display: flex;
	flex-direction: column;
	align-items: flex-start;
}

.form-group label {
	font-size: 14px;
	margin-bottom: 2px; /* label과 input 사이 간격 최소화 */
}

.form-group input, .form-group textarea {
	width: 100%; /* 너비를 100%로 수정 */
	padding: 6px; /* 내부 여백 */
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box; /* 패딩과 테두리 포함 */
}

.form-group textarea {
	resize: none;
	height: 50px; /* 텍스트 영역 높이를 조금 더 줄임 */
}

.submit-btn {
	background-color: #007bff;
	color: #ffffff;
	border: none;
	padding: 10px; /* 버튼 크기 줄임 */
	font-size: 14px;
	cursor: pointer;
	border-radius: 5px;
	width: 100%; /* 버튼 너비를 폼에 맞춤 */
	transition: background-color 0.3s;
	margin-top: 10px; /* 버튼과 상단 요소 간 간격 줄임 */
}

.submit-btn:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<div style="text-align: center">
		<h1>등록 페이지</h1>
	</div>
	<div class="container">

		<form action="ReviewRegC" method="post">
			<div class="form-group">
				<label for="title">Event Title</label> <input type="text" id="title"
					name="title">
			</div>

			<div class="form-group">
				<label for="company">Company</label> <input type="text" id="company"
					name="company">
			</div>

			<div class="form-group">
				<label for="img">Image</label> <input type="file" id="img"
					name="img">
			</div>

			<div class="form-group">
				<label for="sub">Sub</label>
				<textarea id="sub" name="sub"></textarea>
			</div>

			<div class="form-group">
				<label for="text">Text</label>
				<textarea id="text" name="text"></textarea>
			</div>

			<button type="submit" class="submit-btn">Add</button>
		</form>
	</div>
</body>
</html>
