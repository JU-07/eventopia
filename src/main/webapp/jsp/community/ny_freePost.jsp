<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>自由投稿</title>
<link rel="stylesheet" href="css/ny_community.css">
<script src="js/ny_community.js" defer></script>

</head>
<body>
	<div class="container">
		<!-- 左側: 投稿フォーム -->
		<div class="form-container">
			<h1>情報共有</h1>
			<form id="postForm" method="post" enctype="multipart/form-data"
				action="FreePostC">
				<div>
					<label for="name">名前:</label> <input type="text" id="name"
						name="name" value="${post != null ? post.name : ''}" required>
				</div>
				<div>
					<label for="content">内容:</label>
					<textarea id="content" name="content" required>${post != null ? post.content : ''}</textarea>
				</div>
				<div>
					<label for="img">画像:</label> <input type="file" id="img" name="img">
				</div>
				<div>
					<button type="submit">投稿する</button>
					<c:if test="${post != null}">
						<button type="button" onclick="deletePost(${post.id})">削除する</button>
					</c:if>
				</div>
			</form>
		</div>

		<!-- 右側: 投稿一覧 -->
		<div class="posts-container" id="postsContainer">
			<h2>投稿一覧</h2>
			<table>
				<tbody>
					<jsp:include page="postsTable.jsp" />
				</tbody>
			</table>
		</div>
	</div>

	<!-- 下部: 戻るボタン -->
	<!-- 投稿ボタン -->
	<div class="button-container"
		style="text-align: center; margin-top: 20px;">
		<button onclick="location.href='CommunityC'" class="back-button">戻る</button>
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
