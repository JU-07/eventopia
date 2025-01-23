<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${title}</title>
<style>
/* 전체 스타일 */
body {
	font-family: 'Arial', sans-serif;
	background-color: #f9f9f9;
	margin: 0;
	padding: 0;
	color: #333;
	line-height: 1.5;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
}

/* 타이틀 스타일 */
.a1 {
	text-align: center;
	margin-bottom: 15px;
}

.a1 h1 {
	font-size: 2rem; /* 크기 감소 */
	color: #2d2d2d;
	font-weight: 600;
}

/* 본문 스타일 */
.a2 {
	text-align: left;
	padding: 15px;
	font-size: 1rem; /* 크기 감소 */
	line-height: 1.6;
	color: #555;
	background-color: #f9f9f9;
	border-radius: 8px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

.a2 h2 {
	font-size: 1.3rem; /* 크기 감소 */
	color: #007bff;
	margin-bottom: 10px;
}

.a2 img {
	width: 100%;
	height: auto;
	border-radius: 8px;
	margin-bottom: 15px;
}

/* 서브 텍스트 스타일 */
.a3 {
	font-size: 1rem; /* 크기 감소 */
	color: #777;
	text-align: center;
	margin-top: 20px;
}

.custom-button {
	background-color: #2c3e50; /* 차분한 다크 블루 */
	color: #ecf0f1; /* 밝은 톤의 텍스트 */
	border: none; /* 테두리 제거 */
	border-radius: 5px; /* 약간의 둥근 모서리 */
	padding: 10px 20px; /* 버튼 크기 조정 */
	font-size: 16px; /* 적당한 글자 크기 */
	cursor: pointer; /* 클릭 가능한 포인터 */
	text-align: center;
	transition: background-color 0.3s ease, transform 0.2s ease;
	/* 부드러운 전환 효과 */
}

.center-container {
	display: flex;
	justify-content: center; /* 가로 중앙 정렬 */
	align-items: center; /* 세로 중앙 정렬 */
	height: 100vh; /* 화면 전체 높이를 사용 */
}

.custom-button:hover {
	background-color: #34495e; /* 호버 시 약간 밝아지는 효과 */
	transform: scale(1.05); /* 약간 확대 효과 */
}

.custom-button:active {
	background-color: #1a252f; /* 클릭 시 더 어두워짐 */
}

/* 반응형 디자인 */
@media ( max-width : 768px) {
	.a1 h1 {
		font-size: 1.7rem; /* 크기 감소 */
	}
	.a2 {
		padding: 12px;
		font-size: 0.95rem; /* 크기 감소 */
	}
	.a3 {
		font-size: 0.95rem; /* 크기 감소 */
	}
}
</style>
</head>
<body>
	<div class="container">
		<!-- 제목 -->
		<div class="a1">
			<h1>${title}</h1>
		</div>

		<!-- 본문 내용 -->
		<div class="a2">
			<p>${contentt}</p>
		</div>

		<!-- 서브 콘텐츠 -->
		<div class="a3">
			<h2>このコラボについてのあなたのレビュー</h2>
			<p>${sub}</p>
		</div>
		<div class="a3">
			<h2>作成日付</h2>
			<p>${created_at}</p>
			(${created_at_era})
		</div>
	</div>
	<div>
		<button class="custom-button" onclick="location.href='ReviewC'">戻る</button>
	</div>
</body>
</html>

