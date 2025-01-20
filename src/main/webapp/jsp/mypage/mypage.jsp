<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Page</title>
    <link rel="stylesheet" href="mypage.css">
</head>
<body>
    <div class="sidebar">
        <div class="profile">
            <img src="profile.jpg" alt="Profile Picture" class="profile-img">
            <h2>Welcome, User</h2>
        </div>
        <nav>
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="#settings">Settings</a></li>
            </ul>
        </nav>
    </div>
    
    <div class="main-content">
        <!-- 메인 홈 -->
        <section id="home">
            <h1>Main Home</h1>
            <div class="card-container">
                <div class="card">
                    <h3>Likes</h3>
                    <p>Check your likes here.</p>
                </div>
                <div class="card">
                    <h3>Favorites</h3>
                    <p>Check your favorites here.</p>
                </div>
                <div class="card">
                    <h3>Reviews / Posts</h3>
                    <p>View your reviews and posts here.</p>
                </div>
                <div class="card">
                    <h3>Follow</h3>
                    <button>Add/Check Followers</button>
                </div>
            </div>
        </section>

        <!-- 설정 -->
        <section id="settings">
            <h1>Settings</h1>
            <div class="card-container">
                <div class="card">
                    <h3>Account Settings</h3>
                    <button>Change ID/PW</button>
                    <button>Change Profile</button>
                </div>
                <div class="card">
                    <h3>Follower Management</h3>
                    <button>Manage Followers</button>
                </div>
                <div class="card">
                    <h3>Delete Account</h3>
                    <button class="danger">Delete Account</button>
                </div>
            </div>
        </section>
    </div>
</body>
</html>
