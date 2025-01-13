<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>自由投稿</title>
<link rel="stylesheet" href="css/ny_freePost.css">
</head>
<body>

	<div class="post-container">
		<h1>自由投稿</h1>
		<div class="form-container">
			<form id="postForm">
				<div>
					<label for="name">名前:</label> <input type="text" id="name"
						name="name" required>
				</div>
				<div>
					<label for="content">内容:</label>
					<textarea id="content" name="content" required></textarea>
				</div>
				<div>
					<input type="submit" value="投稿する">
				</div>
			</form>
		</div>

		<div class="post-list" id="postList">
			<!-- 投稿がここに追加されます -->
		</div>
	</div>
	<script src="js/script.js"></script>
</body>
</html>
