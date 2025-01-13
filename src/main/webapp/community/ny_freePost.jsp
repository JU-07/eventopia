<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>自由投稿</h1>
	<div class="form-container">
		<form method="post" action="FreePostC">
			<div>
				<label for="name">名前:</label><br> <input type="text" id="name"
					name="name" required>
			</div>
			<div>
				<label for="content">内容:</label><br>
				<textarea id="content" name="content" required></textarea>
			</div>
			<div>
				<input type="submit" value="投稿する">
			</div>
		</form>
	</div>

	<h2>投稿一覧</h2>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>名前</th>
				<th>内容</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="message" items="${list}">
				<tr>
					<td>${message.id}</td>
					<td>${message.name}</td>
					<td>${message.content}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>




</body>
</html>