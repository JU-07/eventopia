<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${title}</title>
<style>
/* 기본 스타일 */
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
	color: #333;
	line-height: 1.6;
}

/* 컨테이너 */
.container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
	padding: 20px;
	box-sizing: border-box;
}

/* 제목 스타일 */
.a1 h1 {
	text-align: center;
	font-size: 2.5rem;
	font-weight: bold;
	margin: 20px 0;
	color: #007BFF; /* 세련된 파란색 */
}

/* 내용 스타일 */
.a2 {
	text-align: center;
	max-width: 600px;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	margin: 20px 0;
}

/* 반응형 레이아웃 */
@media ( max-width : 768px) {
	.a1 h1 {
		font-size: 2rem;
	}
	.a2 {
		padding: 15px;
		font-size: 0.95rem;
	}
}
</style>
</head>
<body>
	<div class="container">
		<div class="a1">
			<h1>${title}</h1>
		</div>
		<div class="a2">${contentt}</div>
		<div class="a3">
			<div>${r.r_sub }</div>
		</div>
	</div>
</body>
</html>
