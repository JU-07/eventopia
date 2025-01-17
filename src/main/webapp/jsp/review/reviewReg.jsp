<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/review.css">
</head>
<body>
	<div style="text-align: center">
		<h2 style="font-size: 30pt">レビュー登録</h2>
	</div>
	<br>
	<div class="review-form-container"
		style="flex: 1; min-width: 300px; height: 500px; display: flex; flex-direction: column; justify-content: space-between;">
		<form action="ReviewC" method="post" enctype="multipart/form-data">
			<div class="review-form">
				<div class="form-group">
					<label for="title">イベント タイトル</label> <input id="title" name="title"
						type="text" placeholder="イベント タイトル" required>
				</div>

				<div class="form-group">
					<label for="Name">商品名</label> <input id="Name" name="Name"
						type="text" placeholder="商品名" required>
				</div>

				<div class="form-group">
					<label for="file">ファイルアップロード</label> <input id="file" name="file"
						type="file" required>
				</div>

				<div class="form-group">
					<label for="story" style="display: block; margin-bottom: 8px;">レビュー</label>
					<textarea id="story" name="story" rows="5" maxlength="200"
						placeholder="商品説明" required style="width: 100%; height: 150px;"></textarea>
				</div>
				<br>
				<div class="form-group">
					<button type="submit" class="review-btn">登録</button>
				</div>
			</div>
		</form>
	</div>


</body>
</html>