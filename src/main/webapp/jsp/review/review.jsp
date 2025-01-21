<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로손 이벤트 페이지</title>
<link rel="stylesheet" href="css/review.css">
<link rel="stylesheet" href="css/reviewmodal.css">
<script type="text/javascript" src="js/review.js"></script>
<style>
</style>
</head>
<body>
<a href="ReviewRegC2">게시물 등록</a>
	<div class="review-container">
		<c:forEach var="r" items="${reviews}">
			<div class="review-content">
				<div class="review-title"
					onclick="location.href='ReviewDetailC?id=${r.id}'">${r.title }</div>
				<div class="review-img">
					<img alt="" src="${r.r_img }">
				</div>
				<div class="review-sub">${r.r_sub }</div>
				<div class="review-user">
					<div>좋아요</div>
					<!-- 공유 버튼 -->
					<div class="SNS" onclick="openShareModal()">공유</div>

					<div class="modal" id="sns-modal">
						<div class="modal-content">
							<span class="close-btn" onclick="closeModal()">×</span>
							<h4>공유하기</h4>
							<div id="sns-buttons">
								<button>
									<img src="twitter-icon.png" alt="Twitter"> <span>Twitter</span>
								</button>
								<button>
									<img src="facebook-icon.png" alt="Facebook"> <span>Facebook</span>
								</button>
								<button>
									<img src="line-icon.png" alt="Line"> <span>Line</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>


	<section class="pagination-section">
		<div class="pagination">
			<a href="ReviewPageC?p=1">初</a>
			<c:forEach begin="1" end="${pageCount}" var="i">
				<a href="ReviewPageC?p=${i}">${i}</a>
			</c:forEach>
			<a href="ReviewPageC?p=${pageCount}">終</a>
		</div>
	</section>
</body>
</html>



