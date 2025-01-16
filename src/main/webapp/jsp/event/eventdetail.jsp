<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="event-wrap">
		<div>
			<div>
				<div class="event-reg-col">Name</div>
				<div class="event-reg-col2">
					<input name="title" value="${event.e_name }" disabled="disabled">
				</div>
			</div>
			<div>
				<div class="event-reg-col">Img</div>
				<div class="event-reg-col2">
					<img alt="" src="${event.e_img }">
				</div>
			</div>
			<div>
				<div class="event-reg-col">Title</div>
				<div class="event-reg-col2">
					<input name="title" value="${event.e_title }" disabled="disabled">
				</div>
			</div>
			<div>
				<div class="review-reg-col">Sub</div>
				<div class="review-reg-col2">
					<input name="title" value="${event.e_sub }" disabled="disabled">
				</div>
			</div>
			<div>
				<div class="review-reg-col">Text</div>
				<div class="review-reg-col2">
					<input name="title" value="${event.e_text }" disabled="disabled">
				</div>
			</div>
			<div>
				<fmt:formatDate value="${event.e_date }" />
			</div>
		</div>
	</div>
</body>
</html>