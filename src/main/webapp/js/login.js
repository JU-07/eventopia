// 로그인 폼 유효성 검사
document.getElementById("loginForm").addEventListener("submit", function(event) {
    const username = document.getElementById("username").value.trim();
    const password = document.getElementById("password").value.trim();
    const errorMsg = document.getElementById("errorMsg");

    // 유효성 검사: 아이디와 비밀번호 공백 검사
    if (username === "" || password === "") {
        event.preventDefault();  // 폼 제출 방지
        errorMsg.textContent = "Please enter both Username and Password.";
        return;
    }

    // 유효성 검사: 아이디와 비밀번호는 영어와 숫자만 가능
    const regex = /^[a-zA-Z0-9]+$/;
    if (!regex.test(username) || !regex.test(password)) {
        event.preventDefault();
        errorMsg.textContent = "Only English letters and numbers are allowed.";
        return;
    }

    // 유효성 검사: 비밀번호는 8자 이상
    if (password.length < 8) {
        event.preventDefault();
        errorMsg.textContent = "Password must be at least 8 characters long.";
        return;
    }

    // 에러가 없을 경우 에러 메시지 초기화
    errorMsg.textContent = "";
});
