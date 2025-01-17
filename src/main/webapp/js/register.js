// 아이디 중복 확인
document.getElementById("checkIdBtn").addEventListener("click", function () {
    const userId = document.getElementById("userId").value;
    const idCheckMsg = document.getElementById("idCheckMsg");

    fetch("checkId?userId=" + userId)
        .then(response => response.text())
        .then(data => {
            if (data === "duplicate") {
                idCheckMsg.textContent = "ID is already in use.";
                idCheckMsg.style.color = "red";
            } else {
                idCheckMsg.textContent = "ID is available!";
                idCheckMsg.style.color = "green";
            }
        });
});

// 비밀번호 일치 확인
document.getElementById("registerForm").addEventListener("submit", function (event) {
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;
    const pwCheckMsg = document.getElementById("pwCheckMsg");

    if (password !== confirmPassword) {
        event.preventDefault();
        pwCheckMsg.textContent = "Passwords do not match.";
    } else {
        pwCheckMsg.textContent = "";
    }
});


// 파일 선택 시 파일명 표시
//document.getElementById("profilePic").addEventListener("change", function() {
//    const fileName = this.files[0]?.name || "No file chosen";
//    document.getElementById("fileName").textContent = fileName;
//});
