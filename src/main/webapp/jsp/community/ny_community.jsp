<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>投稿一覧</title>
<link rel="stylesheet" href="css/ny_community.css">
<script src="js/ny_community.js" defer></script>
</head>
<body>
	<!-- 投稿一覧 -->
	<div class="posts-container" id="postsContainer">
		<h2>投稿一覧</h2>
		<table>
			<thead>
				<tr>
					<th>題名</th>
					<th>画像</th>
					<th>日付</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="post" items="${posts}">
					<tr>
						<td>${post.name}</td>
						<td><c:choose>
								<c:when test="${post.img != '画像なし'}">
									<img src="${pageContext.request.contextPath}${post.img}"
										alt="画像" width="50" height="50">
								</c:when>
								<c:otherwise>画像なし</c:otherwise>
							</c:choose></td>
						<td><fmt:formatDate value="${post.date}"
								pattern="MM/dd HH:mm:ss" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- 投稿ボタン -->
	<div class="button-container"
		style="text-align: center; margin-top: 20px;">
		<form action="FreePostC" method="get">
			<button class="free-post">投稿</button>
		</form>
	</div>

	<!-- chat -->
	<div class="chat-button-container">
		<button class="chat-button" onclick="openChat()">
			<img alt="chat" src="icon/community/chat.png"
				style="width: 100%; height: 100%; object-fit: cover;">
		</button>
	</div>

</body>
</html>
