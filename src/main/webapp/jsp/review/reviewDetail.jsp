<%@ page contentType="text/html; charset=UTF-8" language="java"%>
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
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
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
			<h2>상세 내용</h2>
			<p>${contentt}</p>
		</div>

		<!-- 서브 콘텐츠 -->
		<div class="a3">
			<h2>요약 내용</h2>
			<p>${sub}</p>
		</div>
	</div>
	<div>
		<button onclick="location.href='ReviewC'">돌아가기</button>
	</div>
</body>
</html>

