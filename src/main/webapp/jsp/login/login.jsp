<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Eventopia Login</title>
<link rel="stylesheet" href="css/login.css">
<!-- 구글 폰트 및 아이콘 사용을 위한 링크 -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	<link rel="stylesheet" href="css/login.css" />
</head>
<body>
	<div class="container-wrapper">
		<div class="container">
			<div class="left-panel">
				<h2>Welcome to Eventopia!</h2>
				<br>
				<p>
					Join us and explore <br> the best events around you.
				</p>
				<div class="logo-wrapper">
					<img src="icon/logo/eventopia-logo.png" alt="Eventopia Logo">
				</div>
			</div>

			<div class="right-panel">
				<h2>Login</h2>
				<form id="loginForm" action="LoginC" method="post"> <!-- 서블릿 경로 수정 -->
					<div class="input-group">
						<i class="fas fa-user"></i>
						<input type="text" id="username" name="id" placeholder="Username"> <!-- id 속성 추가 -->
					</div>
					<div class="input-group">
						<i class="fas fa-lock"></i>
						<input type="password" id="password" name="pw" placeholder="Password"> <!--  pw 속성 추가 --> 
					</div>
					<p id="errorMsg" class="error-msg"></p> <!-- 에러 메시지 -->
					<button type="submit" class="login-btn">Login</button>
					<p class="signup-link">
						Don't have an account? <a href="RegisterC">Sign Up</a>
					</p>
				</form>
			</div>
		</div>
	</div>

	<!-- Modal -->
    <div id="errorModal" class="modal">
        <div class="modal-content">
            <span class="close-btn">&times;</span>
            <p id="modalMessage"></p>
        </div>
    </div>
    
    <!-- JavaScript 연결 -->
    <script> 
    	const loginErrorMessage = "<%= request.getAttribute("loginError") != null ? request.getAttribute("loginError") : "" %>";
    	console.log("Login Error Message:", loginErrorMessage); // 디버깅용 콘솔 출력
    </script>
    <script src="js/login.js"> </script>
    

    
</body>
</html>
