<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Page</title>
<link rel="stylesheet" type="text/css" href="css/mypage.css">
</head>
<body>

	<div class="container">
		 <div class="sidebar">
            <div class="slidebar-wrap">
                <a onclick="showTab('home')" class="icon-circle">
                    <img src="icon/login/home.png" alt="Home Icon">
                </a>
            </div>
            <div class="slidebar-wrap">
                <a onclick="showTab('settings')" class="icon-circle">
                    <img src="icon/login/setting.png" alt="Settings Icon">
                </a>
            </div>
        </div>
        <div class="main-content">
			<!-- 메인홈 탭 -->
			<div id="home" class="tab-content">
				<button class="content-button" onclick="alert('좋아요 페이지로 이동')">좋아요</button>
				<button class="content-button" onclick="alert('즐겨찾기 페이지로 이동')">즐겨찾기</button>
				<button class="content-button" onclick="alert('게시글 확인 페이지로 이동')">게시글
					확인</button>
				<button class="content-button" onclick="alert('팔로워 추가/해제 페이지로 이동')">팔로우
					추가 / 해제</button>
			</div>

			<!-- 설정 탭 -->
			<div id="settings" class="tab-content hidden">
				<button class="content-button" onclick="alert('회원 탈퇴 페이지로 이동')">회원
					탈퇴</button>
				<button class="content-button" onclick="alert('ID/PW 변경 페이지로 이동')">ID
					/ PW 변경</button>
				<button class="content-button" onclick="alert('프로필 변경 페이지로 이동')">프로필
					변경</button>
			</div>
		</div>
	</div>

	<!-- JavaScript 연결 -->
	<script src="js/mypage.js"></script>
</body>
</html>
