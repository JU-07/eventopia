<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review Page</title>
<link rel="stylesheet" href="css/reviewDetail.css">
<script type="text/javascript" src="js/reviewdetail.js"></script>
</head>
<body>
	<div class="review-wrap">
		<!-- 목차 -->
		<div class="toc" id="toc">
			<h3>
				목차
				<button onclick="toggleTOC()">접기/펼치기</button>
			</h3>
			<c:forEach var="r" items="${reviews }" varStatus="status">
				<a href="#review${status.index}">${r.r_sub }</a>
			</c:forEach>
		</div>

		<div class="review-wrap">
			<!-- 목차 -->
			<div class="toc" id="toc">
				<h3>
					목차
					<button onclick="toggleTOC()">접기/펼치기</button>
				</h3>
				<c:forEach var="r" items="${reviews }" varStatus="status">
					<a href="#review${status.index}">${r.r_sub }</a>
				</c:forEach>
			</div>

			<div class="review-content">
				<c:forEach var="r" items="${reviews }" varStatus="status">
					<div id="review${status.index}" class="review-item">
						<div>
							<div class="review-reg-col">NAME</div>
							<div class="review-reg-col2">
								<input name="name" value="${r.r_name }" disabled="disabled">
							</div>
						</div>
						<div>
							<div class="review-reg-col">Title</div>
							<div class="review-reg-col2">
								<input name="title" value="${r.r_title }" disabled="disabled">
							</div>
						</div>
						<div>
							<div class="review-reg-col">Image</div>
							<div class="review-reg-col2">
								<img src="${r.r_img }" alt="Review Image">
							</div>
						</div>
						<div>
							<div class="review-reg-col">Summary</div>
							<div class="review-reg-col2">
								<textarea name="sub" maxlength="100" disabled="disabled">${r.r_sub }</textarea>
								<br> <span id="cntSpan">0</span> /200
							</div>
						</div>
						<div>
							<div class="review-reg-col">Text</div>
							<div class="review-reg-col2">
								<textarea name="text" maxlength="100" disabled="disabled">${r.r_text }</textarea>
								<br> <span id="cntSpan">0</span> /200
							</div>
						</div>
						<div>
							<div class="review-reg-col">Date</div>
							<div class="review-reg-col2">
								<fmt:formatDate value="${r.r_date }" pattern="yyyy-MM-dd" />
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
</body>
</html>
