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
<link rel="stylesheet" href="css/rank.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<script type="text/javascript" src="js/main.js" defer></script>
</head>
<body style="position: relative; z-index: 0;">
	<div id="wrap">
		<!-- 헤더 -->
		<div class="header-bg">
			<div class="header">
				<!-- 왼쪽: 로고 -->
				<div class="logo-container">
					<a href="MainC" class="Elogo"> <img
						src="Icon/logo/eventopia_logo.png" alt="Eventopia logo"
						class="evetopia-logo" /> <span>EVENTOPIA</span>
					</a>
				</div>

				<!-- 오른쪽: 아이콘 그룹 -->
				<div class="side-info">
					<div>
						<a href="LoginC"><img src="icon/index/user-icon.png"
							alt="User Icon" class="user-img" /></a>
					</div>
					<div>
						<img src="icon/index/heart-icon.png" alt="Heart Icon"
							class="heart-img" />
					</div>
					<div>
						<img src="icon/index/search-icon.png" alt="Search Icon"
							class="search-img" />
					</div>
					<div>
						<img src="icon/index/sidebar-icon.png" alt="Menu Icon"
							class="sidebar-img" />
					</div>
				</div>
			</div>
		</div>

		<!-- 네비게이션 -->
		<div class="nav-bg">
			<div class="nav">
				<div>
					<a href="MainC">メイン</a>
				</div>
				<div>
					<a href="EventC">イベント</a>
				</div>
				<div>
					<a href="CommunityC">コミュニティー</a>
				</div>
				<div>
					<a href="RankC">ランキング</a>
				</div>
				<div>
					<a href="ReviewC">レビュー</a>
				</div>
				<div>
					<a href="MapC">マップ</a>
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
