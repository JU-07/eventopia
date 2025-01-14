<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css" />
<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/login.css" />
</head>
<body>
	<div id="wrap">


		<!-- 헤더 -->
		<div class="header-bg">
			<div class="header">
				<!-- 왼쪽: 로고 -->
				<div class="logo-container">
					<a href="MainC" class="Elogo"> <img
						src="Icon/eventopia-logo.png" alt="Eventopia logo"
						class="evetopia-logo" /> <span>Eventopia</span>

					</a>
				</div>

				<!-- 오른쪽: 아이콘 그룹 -->
				<div class="side-info">
					<div>
						<a href="LoginC"><img src="Icon/user.png" alt="User Icon" /></a>
					</div>
					<div>
						<img src="Icon/heart.png" alt="Heart Icon" />
					</div>
					<div>
						<img src="Icon/search.svg" alt="Search Icon" />
					</div>
					<div>
						<img src="Icon/list.png" alt="Menu Icon" />
					</div>
				</div>
			</div>
		</div>

		<!-- 네비게이션 -->
		<div class="nav-bg">
			<div class="nav">
				<div>
					<a href="MainC">main</a>
				</div>
				<div>
					<a href="EventC">event</a>
				</div>
				<div>
					<a href="CommunityC">community</a>
				</div>
				<div>
					<a href="RankC">ranking</a>
				</div>
				<div>
					<a href="ReviewC">review</a>
				</div>
				<div>
					<a href="MapC">map</a>
				</div>
			</div>
		</div>

		<!-- 콘텐츠 -->
		<div class="content-bg">
			<div class="content-container">
				<jsp:include page="${content }"></jsp:include>
			</div>
		</div>

		<!-- 푸터 -->
		<div class="footer-bg">
			<div class="footer">
				<p>&copy; 2025 Eventopia. All rights reserved.</p>
				<p>
					<a href="privacy-policy.html">Privacy Policy</a> | <a
						href="terms-of-service.html">Terms of Service</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>
