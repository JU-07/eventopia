<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>리뷰 등록 페이지</title>
<link rel="stylesheet" href="css/review.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/main.css">
<style>
/* 전체 컨테이너 스타일 */
.container {
	width: 100%;
	max-width: 600px; /* 최대 너비 설정 */
	margin: 40px auto; /* 중앙 정렬 */
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

/* 폼 그룹 (라벨과 입력 필드 묶음) */
.form-group {
	margin-bottom: 20px; /* 요소 간격 */
	display: flex;
	flex-direction: column;
	align-items: flex-start;
}

/* 라벨 스타일 */
.form-group label {
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 8px; /* 입력 필드와 간격 */
	color: #333;
}

/* 입력 필드 스타일 */
.form-group input, .form-group textarea {
	width: 100%; /* 100% 너비 */
	padding: 12px; /* 충분한 패딩 */
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box; /* 패딩과 테두리 포함 */
	background-color: #f9f9f9;
	transition: border-color 0.3s ease; /* 포커스 시 테두리 색상 변화 */
}

/* 포커스 시 테두리 색상 */
.form-group input:focus, .form-group textarea:focus {
	border-color: #007bff;
	outline: none;
}

/* 텍스트 영역의 크기 및 스타일 */
.form-group textarea {
	resize: vertical;
	height: 120px; /* 텍스트 영역 높이 */
	font-family: Arial, sans-serif;
}

/* 버튼 스타일 */
.submit-btn {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 12px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px;
	width: 100%; /* 버튼 너비를 폼에 맞춤 */
	transition: background-color 0.3s ease;
	margin-top: 20px; /* 버튼과 상단 요소 간 간격 */
}

/* 버튼 hover 효과 */
.submit-btn:hover {
	background-color: #0056b3;
}

/* 헤더 스타일 */
h1 {
	font-size: 24px;
	font-weight: bold;
	color: #333;
	margin-bottom: 30px;
}

/* 모바일 대응을 위한 반응형 스타일 */
@media ( max-width : 768px) {
	.container {
		width: 90%; /* 모바일에서 너비가 90%로 자동 조정 */
		padding: 15px;
	}
	.form-group label {
		font-size: 14px;
	}
	.submit-btn {
		padding: 10px;
	}
}
</style>
</head>
<body>
	<div style="text-align: center">
		<h1 style="font-size: 30pt" >レビュー登録ページ</h1>
	</div>

	<div class="container">
		<form action="ReviewRegC" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="title">Event Title</label> <input type="text" id="title"
					name="title" required>
			</div>

			<div class="form-group">
				<label for="company">Company</label> <input type="text" id="company"
					name="company" required>
			</div>

			<div class="form-group">
				<label for="img">Image</label> <input type="file" id="img"
					name="img">
			</div>

			<div class="form-group">
				<label for="sub">Sub</label>
				<textarea id="sub" name="sub" required></textarea>
			</div>

			<div class="form-group">
				<label for="text">Text</label>
				<textarea id="text" name="text" required></textarea>
			</div>

			<button type="submit" class="submit-btn">Add</button>
		</form>
	</div>
</body>
</html>
