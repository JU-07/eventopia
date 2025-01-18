<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eventopia Sign Up</title>
    <link rel="stylesheet" href="css/register.css">
    <!-- Google Fonts & Icons -->
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

            <!-- Right Panel (Sign Up Form) -->
            <div class="right-panel">
                <h2>Sign Up</h2>
                <form id="registerForm" action="RegisterC" method="post" enctype="multipart/form-data">
                    <!-- ID -->
                    <div class="input-group">
                        <i class="fas fa-user"></i>
                        <input type="text" id="userId" name="userId" placeholder="Username" required>
                        <button type="button" id="checkIdBtn" class="round-btn">Check</button>
                    </div>
                    <p id="idCheckMsg" style="color:red;"></p>

                    <!-- Password -->
                    <div class="input-group">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="password" name="userPw" placeholder="Password" required>
                    </div>

                    <!-- Password Confirm -->
                    <div class="input-group">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="confirmPassword" placeholder="Confirm Password" required>
                    </div>
                    <p id="pwCheckMsg" style="color:red;"></p>

                    <!-- Name -->
                    <div class="input-group">
                        <i class="fas fa-user-tag"></i>
                        <input type="text" id="userName" name="userName" placeholder="Full Name" required>
                    </div>

                    <!-- Profile Picture Upload -->
                    <div class="input-group">
                        <i class="fas fa-image"></i>
                        <input type="file" id="profilePic" name="profilePic" accept="image/*">
                        <label for="profilePic" class="upload-btn">Choose File</label>
                        <span id="fileName">No file chosen</span>
                    </div>

                    <!-- Error Message -->
                    <p id="errorMsg" style="color:red;"></p>

                    <button type="submit" class="signup-btn">Sign Up</button>
                    <p class="login-link">Already have an account? <a href="LoginC">Login</a></p>
                </form>
            </div>
        </div>
    </div>

    <!-- JavaScript 연결 -->
    <script src="js/register.js"></script>
</body>
</html>
