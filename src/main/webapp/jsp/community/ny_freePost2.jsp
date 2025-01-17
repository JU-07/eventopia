<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>自由投稿</title>
<link rel="stylesheet" href="css/ny_freePost.css">
<link rel="stylesheet" href="css/ny_postsTable.css">

</head>
<body>
		<input id="username" value="test">
	<div class="container">
		
		<!-- 채팅 화면 -->
		<div style="position:relative; width:100%;">
		<button onclick="sendToIframe(this)" class="chat-btn">Start chat</button>
		<div class="chat-container">
			<iframe id="chatIframe" style="width: 100%; height: 100%;"
				src="http://192.168.2.118:8080/chat"></iframe>
		</div>
		</div>

		<script>
    function sendToIframe(btn) {
    	document.querySelector('.chat-container').style.opacity = 1;
    	btn.style.display = 'none';
        const username = document.getElementById("username").value; // 입력값 가져오기
        console.log(username)
        const iframe = document.getElementById("chatIframe");
        // `postMessage`를 사용하여 `iframe`에 데이터 전달
        iframe.contentWindow.postMessage({ username }, "*");
    }
</script>

	</div>
</body>
</html>
