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
			<tbody>
				<jsp:include page="postsTable.jsp" />
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
			<img alt="chat" src="Icon/community/chat.png"
				style="width: 100%; height: 100%; object-fit: cover;">
		</button>
	</div>

</body>
</html>
