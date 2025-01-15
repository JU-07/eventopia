<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>自由投稿</title>
<link rel="stylesheet" href="css/ny_freePost.css">
<script src="js/ny_community.js"></script>
</head>
<body>
	<div class="container">
		<!-- 左側: 投稿フォーム -->
		<div class="form-container">
			<h1>自由投稿</h1>
			<form id="postForm" method="post" enctype="multipart/form-data"
				action="FreePostC">
				<div>
					<label for="name">名前:</label> <input type="text" id="name"
						name="name" required>
				</div>
				<div>
					<label for="content">内容:</label>
					<textarea id="content" name="content" required></textarea>
				</div>
				<div>
					<label for="img">画像:</label> <input type="file" id="img" name="img">
				</div>
				<div>
					<button type="submit">投稿する</button>
				</div>
			</form>
		</div>

		<!-- 右側: 投稿一覧 -->
		<div class="posts-container" id="postsContainer">
			<h2>投稿一覧</h2>
			<table>
				<thead>
					<tr>
						<th>名前</th>
						<th>画像</th>
						<th>内容</th>
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
							<td>${post.content}</td>
							<td><fmt:formatDate value="${post.date}"
									pattern="MM/dd HH:mm:ss" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>
