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


// ID 중복 체크
document.getElementById("checkIdBtn").addEventListener("click", function () {
    const userId = document.getElementById("user_id").value;

    fetch("/checkId", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded",
        },
        body: `user_id=${encodeURIComponent(userId)}`,
    })
        .then(response => response.json())
        .then(data => {
            if (data.isDuplicate) {
                alert("이미 사용 중인 ID입니다."); // 중복 메시지
            } else {
                alert("사용 가능한 ID입니다."); // 사용 가능 메시지
            }
        })
        .catch(error => console.error("Error:", error));
});

// 비밀번호 확인 로직
document.getElementById("confirmPassword").addEventListener("input", function () {
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;

    if (password !== confirmPassword) {
        document.getElementById("pwCheckMsg").innerText = "Passwords do not match.";
    } else {
        document.getElementById("pwCheckMsg").innerText = "";
    }
});

