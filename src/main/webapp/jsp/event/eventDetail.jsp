<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
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
		<c:forEach var="e" items="${events }">
		<div>
			<div>
				<div class="review-reg-col">NAME</div>
				<div class="review-reg-col2">
					<input name="title" value="${e.e_name }" disabled="disabled">
				</div>
			</div>
			<div>
				<div class="review-reg-col">title</div>
				<div class="review-reg-col2">
					<input name="title" value="${e.e_title }" disabled="disabled">
				</div>
			</div>
			<div>
				<div class="review-reg-col">img</div>
				<div class="review-reg-col2">
					<input name="title" value="${e.e_img }" disabled="disabled">
				</div>
			</div>
			<div>
				<div class="review-reg-col">sub</div>
				<div class="review-reg-col2">
					<input name="title" value="${e.e_short_story }" disabled="disabled">
				</div>
			</div>
			<div>
				<div class="review-reg-col">story</div>
				<div class="review-reg-col2">
					<textarea name="txt" maxlength="100" disabled="disabled">${e.e_story }</textarea>
					<br> <span id="cntSpan">0</span> /200
				</div>
			</div>
			<div>
				<div>
					<fmt:formatDate value="${r.r_date }" />
				</div>
			</div>
			<div>
				<div class="review-reg-col">GOOD</div>
				<div class="review-reg-col2">
					<input name="title" value="${e.e_good }" disabled="disabled">
				</div>
			</div>
		</div>
			</c:forEach>
	</div>
</body>
</html>