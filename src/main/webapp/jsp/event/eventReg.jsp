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
		<form action="EventRegC" method="post">
			<div class="event-form">


				<div class="form-group">
					<label for="name">편의점</label> <input id="name" name="name"
						type="text" placeholder="イベント タイトル" value="${e.e_name }">
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
					<label for="short_story">요약내용</label> <input id="short_story"
						name="short_story" type="text" placeholder="요약내용" required>
				</div>

				<div class="form-group">
					<label for="story">내용</label>
					<textarea id="story" name="story" rows="5" maxlength="200"
						placeholder="내용" required></textarea>
				</div>
				<div class="form-group">
					<label for="date">날짜</label>
					<textarea id="date" name="date" placeholder="날짜" required></textarea>
				</div>

				<div class="form-group">
					<button type="submit" class="review-btn">登録</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
