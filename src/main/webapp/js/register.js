// 아이디 중복 확인
document.getElementById("checkIdBtn").addEventListener("click", function () {
    const userId = document.getElementById("userId").value;
    const idCheckMsg = document.getElementById("idCheckMsg");

    fetch("RegisterC?userId=" + encodeURIComponent(userId))
        .then(response => response.text())
        .then(data => {
            if (data === "duplicate") {
                idCheckMsg.textContent = "ID is already in use.";
                idCheckMsg.style.color = "red";
            } else {
                idCheckMsg.textContent = "ID is available!";
                idCheckMsg.style.color = "green";
            }
        })
        .catch(error => {
            console.error("Error checking ID:", error);
        });
});

// 비밀번호 일치 확인 및 회원가입
document.getElementById("registerForm").addEventListener("submit", function (event) {
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;
    const pwCheckMsg = document.getElementById("pwCheckMsg");

    if (password !== confirmPassword) {
        event.preventDefault(); // 폼 제출 방지
        pwCheckMsg.textContent = "Passwords do not match.";
        pwCheckMsg.style.color = "red";
        return;
    }

    pwCheckMsg.textContent = "";
});
