<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css" />
<link rel="stylesheet" href="css/main.css" />
</head>
<body>
	<div id="wrap">
		<div class="header">
			<div class="header-item">
				<div>
					<a href="MainC" class="Elogo"> <img alt="Eventopia logo"
						src="Icon/eventopia-logo.png" class="evetopia-logo">
						Eventopia
					</a>
				</div>
				<div class="side-info">
					<div>
						<img src="Icon/user.png" alt="User Icon" />
					</div>
					<div>
						<img src="Icon/heart.png" alt="Heart Icon" />
					</div>
					<div>
						<img src="Icon/search.svg" alt="Search Icon" />
					</div>
					<div>
						<img src="Icon/list.png" alt="Sidebar Icon" />
					</div>
				</div>
			</div>
		</div>
		<div class="nav">
			<div>
				<a href="MainC"> main </a>
			</div>
			<div>event</div>
			<div>
				<a href="CommunityC"> community </a>
			</div>
			<div>
				<a href="RankC"> ranking </a>
			</div>
			<div>review</div>
			<div>
				<a href="MapC"> map </a>
			</div>
		</div>
		<div class="content-container">
			<div>
				<jsp:include page="${content }"></jsp:include>
			</div>
		</div>
		<div class="footer"></div>
	</div>
</body>
</html>
