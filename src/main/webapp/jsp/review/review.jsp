<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰 페이지</title>
<link rel="stylesheet" href="css/review.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/index.css">
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
<style type="text/css">
.review-container {
	display: grid;
	gap: 20px;
	padding: 40px;
	max-width: 1200px;
	margin: 0 auto;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.review-wrap {
	background: #ffffff;
	border: 1px solid #e0e0e0;
	border-radius: 8px;
	overflow: hidden;
	text-align: center;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	cursor: pointer;
	padding: 15px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.review-wrap:hover {
	transform: translateY(-5px);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

.review-img img {
	width: 100%;
	height: 180px;
	object-fit: cover;
	border-radius: 4px;
	margin-bottom: 10px;
}

.review-title {
	font-size: 18px;
	font-weight: bold;
	color: #333;
	margin: 10px 0;
	cursor: pointer;
}

.review-name {
	font-size: 14px;
	color: #777;
	margin-bottom: 10px;
}

.review-sub {
	font-size: 12px;
	color: #888;
	margin-bottom: 15px;
	word-wrap: break-word;
	text-overflow: ellipsis;
}

.review-text {
	font-size: 14px;
	color: #555;
	line-height: 1.5;
}

.add-review {
	display: flex;
	justify-content: center;
	margin: 20px 0;
}

.add-review a {
	display: inline-block;
	padding: 10px 20px;
	background-color: #007bff;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.add-review a:hover {
	background-color: #0056b3;
}

.SNS {
	display: flex; /* 버튼 나란히 배치 */
	gap: 10px; /* 버튼 간 간격 */
	justify-content: center; /* 중앙 정렬 */
	margin-top: 20px;
	margin-bottom: 20px;
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

/* SNS 버튼 이미지 스타일 */
.SNS button img {
	width: 16px; /* 이미지 가로 크기 */
	height: 16px; /* 이미지 세로 크기 */
	margin-right: 10px; /* 텍스트와의 간격 */
}
</style>
</head>
<body>



	<div class="review-title">
		<a href="ReviewRegC"><h2>レビューリスト</h2></a>
	</div>
	<div class="review-container">
		<c:forEach var="r" items="${review}">
			<div class="review-wrap">
				<span onclick="location.href='ReviewDetailC?no=${review.r_no}'"></span>
			</div>
			<div class="review-title">${review.r_title}</div>
			<div class="review-img">
				<img alt="" src="${review.r_img}">
			</div>
			<div class="review-name">${review.r_name}</div>
			<div class="review-sub">${review.r_sub}</div>
			<div class="review-text">${review.r_text}</div>
	</c:forEach>
		<c:if test="${empty review}">
			<p style="text-align: center">
			<h2 style="text-align: center">すみません、現在レビューがありません。</h2>
			</p>
		</c:if>
	</div><div class="SNS" style="font-size: 10pt">
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

	<!-- レビュー登録 버튼 -->
	<div class="add-review">
		<a href="ReviewRegC">レビュー登録</a>
	</div>
	</div>
</body>
</html>
