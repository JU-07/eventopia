<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<div class="header">
		<h1>로손 이벤트 페이지</h1>
	</div>
<div class="content">
            <div class="date">
                <strong>날짜:</strong>
                <fmt:formatDate value="${event1.sysdate}" pattern="yyyy-MM-dd" />
            </div>
            <div class="img">
                <strong>이미지:</strong> <a href="${event1.imageLink}"> <img
                    alt="Event Image" src="${event1.imageSrc}" />
                </a>
            </div>
            <div class="text">
                <strong>내용:</strong>
                <textarea rows="5" cols="50" readonly>${event1.description}</textarea>
            </div>
            <div class="link">
                <strong>링크:</strong> <a href="${event1.link}" target="_blank">이벤트 자세히 보기</a>
            </div>
            <div class="SNS">
                <button type="button" class="btn-share-tw" data-url="${event1.link}">트위터로 공유하기</button>
                <button type="button" class="btn-share-fb" data-url="${event1.link}">페이스북으로 공유하기</button>
                <button type="button" class="btn-share-ln" data-url="${event1.link}">라인 공유</button>
            </div>
        </div>
    </div>
</body>
</html>