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
		<div class="review-content">
			<c:forEach var="r" items="${reviews }" varStatus="status">
				<div id="review${status.index}" class="review-item">
					<div>
						<div class="review-reg-col">NAME</div>
						<div class="review-reg-col2">
							<div name="name" value="${r.r_name }" disabled="disabled">
								${r.r_name }</div>
						</div>
						<div>
							<div class="review-reg-col">Title</div>
							<div class="review-reg-col2">
								<div name="title" value="${r.r_title }" disabled="disabled">
									${r.r_title }</div>
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
									<div name="sub" value="${r.r_sub }">${r.r_sub}</div>
								</div>
							</div>
							<div>
								<div class="review-reg-col">Text</div>
								<div class="review-reg-col2">
									<div name="text" value="${r.r_text}">${r.r_text}</div>
								</div>
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
