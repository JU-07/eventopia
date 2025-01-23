//// 아이디 중복 확인
//document.getElementById("checkIdBtn").addEventListener("click", function () {
//    const userId = document.getElementById("userId").value;
//    const idCheckMsg = document.getElementById("idCheckMsg");
//
//    fetch("RegisterC?userId=" + encodeURIComponent(userId))
//        .then(response => response.text())
//        .then(data => {
//            if (data === "duplicate") {
//                idCheckMsg.textContent = "ID is already in use.";
//                idCheckMsg.style.color = "red";
//            } else {
//                idCheckMsg.textContent = "ID is available!";
//                idCheckMsg.style.color = "green";
//            }
//        })
//        .catch(error => {
//            console.error("Error checking ID:", error);
//        });
//});
//
//// 비밀번호 일치 확인 및 회원가입
//document.getElementById("registerForm").addEventListener("submit", function (event) {
//    const password = document.getElementById("password").value;
//    const confirmPassword = document.getElementById("confirmPassword").value;
//    const pwCheckMsg = document.getElementById("pwCheckMsg");
//
//    if (password !== confirmPassword) {
//        event.preventDefault(); // 폼 제출 방지
//        pwCheckMsg.textContent = "Passwords do not match.";
//        pwCheckMsg.style.color = "red";
//        return;
//    }
//
//    pwCheckMsg.textContent = "";
//});


document.getElementById("checkIdBtn").addEventListener("click", function () {
    const userId = document.getElementById("userId").value.trim(); // 입력된 아이디 값 가져오기
    const idCheckMsg = document.getElementById("idCheckMsg");

    if (!userId) {
        idCheckMsg.textContent = "Please enter a username.";
        idCheckMsg.style.color = "red";
        return;
    }

	console.log(userId);
	
    // AJAX 요청
    fetch("CheckIdServlet", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: `userId=${encodeURIComponent(userId)}`
    })
        .then(response => response.text())
        .then(data => {
			console.log(data);
            if (data === "exists") {
                idCheckMsg.textContent = "Username is already taken.";
                idCheckMsg.style.color = "red";
            } else if (data === "not_exists") {
                idCheckMsg.textContent = "Username is available!";
                idCheckMsg.style.color = "green";
            } else {
                idCheckMsg.textContent = "Error checking username.";
                idCheckMsg.style.color = "red";
            }
        })
        .catch(error => {
            console.error("Error:", error);
            idCheckMsg.textContent = "Server error. Please try again.";
            idCheckMsg.style.color = "red";
        });
});

