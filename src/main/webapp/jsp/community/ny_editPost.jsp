<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>投稿編集</title>
<link rel="stylesheet" href="css/ny_community.css">
<style>
/* 投稿編集ページ専用のスタイル */
body {
	font-family: "Arial", sans-serif;
	background-color: #fef6e4; /* 背景色：アイボリー */
	margin: 0;
	display: flex;
	justify-content: center; /* 横方向の中央揃え */
	align-items: center; /* 縦方向の中央揃え */
	height: 100vh; /* 全画面の高さ */
}
</style>
</head>
<body>

	<div class="edit-container">
		<h1>投稿編集</h1>
		<form action="EditPostC" method="post" enctype="multipart/form-data">
			<input type="hidden" name="p_id" value="${post.id}"> <label
				for="name">名前:</label> <input type="text" id="name" name="name"
				value="${post.name}" required> <label for="content">内容:</label>
			<textarea id="content" name="content" required>${post.content}</textarea>
			<label for="img">画像:</label> <input type="file" id="img" name="img">
			<div>
				<button type="submit" class="update-btn">更新</button>
				<button type="button" class="back-btn" onclick="history.back()">戻る</button>
			</div>
		</form>
		<form action="DeletePostC" method="post">
			<input type="hidden" name="p_id" value="${post.id}">
			<button type="submit" class="delete-btn">削除</button>
		</form>
	</div>

</body>
</html>
