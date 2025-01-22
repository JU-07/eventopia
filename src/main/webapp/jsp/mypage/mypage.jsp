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
   <!-- 사이드바 -->
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
        
        <!-- 기능 섹션 -->
       	<div class="action-sidebar">
	    <!-- Home 버튼 그룹 -->
	    <div id="home-buttons" class="tab-buttons">
	        <div class="user-profile">
	            <img src="icon/login/user.jpeg" alt="User Test">
	            <div>TEST USER</div>
	        </div>
	        <button class="content-button" onclick="alert('게시글 확인 페이지로 이동')">게시글 확인</button>
	        <button class="content-button" onclick="alert('좋아요 / 즐겨찾기 페이지로 이동')">좋아요 / 즐겨찾기</button>
	        <button class="content-button" onclick="alert('팔로워 추가 / 해제 페이지로 이동')">팔로우 추가 / 해제</button>
	    </div>
	    
	    <!-- Settings 버튼 그룹 -->
	    <div id="settings-buttons" class="tab-buttons hidden">
	        <div class="user-profile">
	            <img src="icon/login/user.jpeg" alt="User Test">
	            <div>TEST USER</div>
	        </div>
	        <button class="content-button" onclick="alert('프로필 변경 페이지로 이동')">프로필 변경</button>
	        <button class="content-button" onclick="alert('ID / PW 변경 페이지로 이동')">ID / PW 변경</button>
	        <button class="content-button" onclick="alert('회원 탈퇴 페이지로 이동')">회원 탈퇴</button>
	        <button class="content-button" onclick="alert('회원 관리 페이지')">회원 관리</button>
	    </div>
	</div>

        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <div id="home" class="tab-content">
                <p>Welcome to Main Content</p>
            </div>
            <div id="settings" class="tab-content hidden">
                <p>Welcome to Settings</p>
            </div>
        </div>
    </div>

    <!-- JavaScript 파일 연결 -->
    <script src="js/mypage.js"></script>
</body>
</html>
