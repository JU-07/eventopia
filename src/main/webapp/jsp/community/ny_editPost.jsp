<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>投稿編集</title>
<link rel="stylesheet" href="css/ny_community.css">
</head>
<body>
	<h1>投稿編集</h1>
	<form action="EditPostC" method="post" enctype="multipart/form-data">
		<input type="hidden" name="p_id" value="${post.id}"> <label>名前:
			<input type="text" name="name" value="${post.name}" required>
		</label><br> <label>内容: <textarea name="content" required>${post.content}</textarea></label><br>
		<label>画像: <input type="file" name="img"></label><br>
		<button type="submit">更新</button>
	</form>
	<form action="DeletePostC" method="post">
		<input type="hidden" name="p_id" value="${post.id}">
		<button type="submit">削除</button>
	</form>
</body>
</html>
