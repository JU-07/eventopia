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
<script type="text/javascript" src="js/reviewModal.js"></script>
<style>
</style>
</head>
<body>
	<a href="ReviewRegC2" class="btn">レビュー登録</a>
	<div class="review-container">
		<!-- 리뷰를 2개씩 보여주기 -->
		<c:forEach var="r" items="${reviews}" varStatus="status">
			<!-- 2개씩 나누어 보여주기 -->
			<c:if test="${status.index % 2 == 0}">
				<div class="review-content">
					<div class="review-title"
						onclick="location.href='ReviewDetailC?id=${r.id}'">${r.title}</div>
					<div class="review-img">
						<img alt="" src="${r.r_img}">
					</div>
					<div class="review-sub">${r.r_sub}</div>
					<!-- 공유 버튼 클릭 시 모달 열기 -->
					<div class="review-user">
						<div>いい</div>
						<div class="SNS" onclick="openShareModal(${r.id})">共有</div>
					</div>

					<!-- 모달을 각 리뷰별로 고유하게 ID 설정 -->
					<div class="modal" id="sns-modal-${r.id}" style="display: none;">
						<div class="modal-content">
							<span class="close-btn" onclick="closeModal(${r.id})">×</span>
							<h4>共有</h4>
							<div id="sns-buttons">
								<button>
									<img src="twitter-icon.png" alt="Twitter" width="16">
									Twitter
								</button>
								<button>
									<img src="facebook-icon.png" alt="Facebook" width="16">
									Facebook
								</button>
								<button>
									<img src="line-icon.png" alt="Line" width="16"> Line
								</button>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>

	<div class="pagination-container">
		<a href="ReviewPageC?p=1" class="pagination-button first">初</a>
		<c:forEach begin="1" end="${pageCount}" var="i">
			<a href="ReviewPageC?p=${i}" class="pagination-button">${i}</a>
		</c:forEach>
		<a href="ReviewPageC?p=${pageCount}" class="pagination-button last">末</a>
	</div>
</body>
</html>
