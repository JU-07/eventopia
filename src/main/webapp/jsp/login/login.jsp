<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eventopia Login</title>
    <link rel="stylesheet" href="css/login.css">
    <!-- 구글 폰트 및 아이콘 사용을 위한 링크 -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="container-wrapper">
        <div class="container">
        
            <!-- Left Panel -->
            <div class="left-panel">
                <h2>Welcome to Eventopia!</h2>
                <p>Join us and explore the best events around you.</p>
                <div class="logo-wrapper">
                    <img src="Icon/eventopia-logo.png" alt="Eventopia Logo">
                </div>
            </div>

            <!-- Right Panel (Login Form) -->
            <div class="right-panel">
                <h2>Login</h2>
                <form id="loginForm" action="LoginC" method="post">
                    <div class="input-group">
                        <i class="fas fa-user"></i>
                        <input type="text" id="username" name="id" placeholder="Username" required>
                    </div>
                    <div class="input-group">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="password" name="pw" placeholder="Password" required>
                    </div>

                    <!-- Error Message -->
                    <p id="errorMsg" style="color:red;"></p>

                    <button type="submit" class="login-btn">Login</button>
                    <p class="signup-link">Don't have an account? <a href="register.jsp">Sign Up</a></p>

                    <!-- Social Login -->
                    <div class="social-login">
                        <p>Or sign in with</p>
                        <div class="social-icons">
                            <i class="fab fa-google"></i>
                            <i class="fab fa-facebook-f"></i>
                            <i class="fab fa-twitter"></i>
                            <i class="fab fa-linkedin-in"></i>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- JavaScript 연결 -->
    <script src="js/login.js"></script>
</body>
</html>