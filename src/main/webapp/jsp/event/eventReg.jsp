<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登録</title>
<link rel="stylesheet" href="css/eventreg.css">
</head>
<body>
	<div style="text-align: center">
		<h2 style="font-size: 30pt">イベント登録</h2>
	</div>
	<br>
	<div class="event-form-container">
		<form action="EventRegC" method="post" enctype="multipart/form-data">
			<div class="event-form">

				<div class="form-group">
					<label for="name">コンビ二社名</label>
					<select name="name">
						<option value="ローソン">ローソン</option>
						<option value="セブンイレブン">セブンイレブン</option>
						<option value="ファミリーマート">ファミリーマート</option>
					</select>
				</div>

				<div class="form-group">
					<label for="title">イベント タイトル</label> <input id="title" name="title"
						type="text" placeholder="イベント タイトル" required>
				</div>

				<div class="form-group">
					<label for="file">ファイルアップロード</label> <input id="file"
						name="image_url" type="file" required>
				</div>

				<div class="form-group">
					<label for="story">内容</label>
					<textarea id="story" name="story" rows="5" maxlength="200"
						placeholder="内容" required></textarea>
				</div>

				<div class="form-group">
					<button type="submit" class="review-btn">登録</button>
				</div>

			</div>
		</form>
	</div>
</body>
</html>
