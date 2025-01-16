<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.btn-share-tw').forEach(button => {
        button.addEventListener('click', (event) => {
            const sendText = '편의점 콜라보';
            const pageUrl = event.target.dataset.url;
            window.open(`https://twitter.com/intent/tweet?text=${sendText}&url=${pageUrl}`);
        });
    });
    document.querySelectorAll('.btn-share-fb').forEach(button => {
        button.addEventListener('click', (event) => {
            const pageUrl = event.target.dataset.url;
            window.open(`http://www.facebook.com/sharer/sharer.php?u=${pageUrl}`);
        });
    });
    document.querySelectorAll('.btn-share-ln').forEach(button => {
        button.addEventListener('click', (event) => {
            const pageUrl = event.target.dataset.url;
            window.open(`https://social-plugins.line.me/lineit/share?url=${pageUrl}`);
        });
    });
});
</script>
</head>
<body>
	<div class="review-wrap">
		<div>
			<div>
				<div class="review-reg-col">Name</div>
				<div class="review-reg-col2">
					<input name="title" value="${review.r_name }" disabled="disabled">
				</div>
			</div>
			<div>
				<div class="review-reg-col">Img</div>
				<div class="review-reg-col2">
					<img alt="" src="${review.r_img }">
				</div>
			</div>
			<div>
				<div class="review-reg-col">Title</div>
				<div class="review-reg-col2">
					<input name="title" value="${review.r_title }" disabled="disabled">
				</div>
			</div>
			<div>
				<div class="review-reg-col">Sub</div>
				<div class="review-reg-col2">
					<input name="title" value="${review.r_sub }" disabled="disabled">
				</div>
			</div>
			<div>
				<div class="review-reg-col">Text</div>
				<div class="review-reg-col2">
					<input name="title" value="${review.r_text }" disabled="disabled">
				</div>
			</div>
			<div>
				<fmt:formatDate value="${review.r_date }" />
			</div>
		</div>
	</div>
</body>
</html>