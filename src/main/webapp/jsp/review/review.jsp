<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이벤트 리뷰 페이지</title>
<link rel="stylesheet" href="css/review.css">
<link rel="stylesheet" href="css/reviewmodal.css">
<script type="text/javascript" src="js/review.js"></script>
<script type="text/javascript" src="js/reviewModal.js"></script>
</head>
<body>
	<div class="register-container">
		<a href="ReviewRegC2" class="register-btn">登録</a>
	</div>
	<div class="review-container">
		<c:forEach var="r" items="${reviews}">
			<div class="review-content">
				<div class="review-title"
					onclick="location.href='ReviewDetailC?id=${r.id}'">${r.title}</div>
				<div class="review-img">
					<img alt="" src="${r.r_img}">
				</div>
				<div class="review-sub">${r.r_sub}</div>
				<div class="review-user">
					<div>良い</div>
					<!-- 좋아요 버튼 -->
					<div class="SNS" onclick="openShareModal(${r.id})">共有</div>
					<!-- 共有 버튼 -->
				</div>

				<!-- 각 리뷰별 모달창 -->
				<div class="modal" id="sns-modal-${r.id}">
					<div class="modal-content">
						<span class="close-btn" onclick="closeModal(${r.id})">×</span>
						<h4>공유하기</h4>
						<div id="sns-buttons">
							<button onclick="shareOnTwitter(${r.id})">
								<img src="Icon/sns/images.png" alt="Twitter">
							</button>
							<button onclick="shareOnFacebook(${r.id})">
								<img src="Icon/sns/images (1).png" alt="Facebook">
							</button>
							<button onclick="shareOnLine(${r.id})">
								<img
									src="Icon/sns/png-transparent-line-messaging-apps-logo-sticker-line-text-rectangle-logo-thumbnail.png"
									alt="Line">
							</button>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<div class="pagination">
		<a href="ReviewPageC?p=1"><<</a>
		<c:forEach begin="1" end="${pageCount}" var="i">
			<a href="ReviewPageC?p=${i}">${i}</a>
		</c:forEach>
		<a href="ReviewPageC?p=${pageCount}">>></a>
	</div>

</body>
</html>
