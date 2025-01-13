<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="display: flex; justify-content: center;">
		<div class="movie-detail">
			<div>
				<div class="col-1">No.</div>
				<div class="col-2"></div>
			</div>
			<div>
				<div>
					<img alt="" src="">
				</div>
			</div>
			<div>
				<div class="col-1">Title</div>
				<div class="col-2">${movie.m_title}</div>
			</div>
			<div>
				<div class="col-1">Name</div>
				<div class="col-2"></div>
			</div>
			<div>
				<div class="col-1">Text</div>
				<div class="col-2"></div>
			</div>
		</div>
	</div>
</body>
</html>