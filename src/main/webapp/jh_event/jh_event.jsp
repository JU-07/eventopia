<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event Page</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', () => {
    // 트위터 공유
    document.querySelectorAll('.btn-share-tw').forEach(button => {
        button.addEventListener('click', (event) => {
            const sendText = '편의점 콜라보';
            const pageUrl = event.target.dataset.url;
            window.open(`https://twitter.com/intent/tweet?text=${sendText}&url=${pageUrl}`);
        });
    });

    // 페이스북 공유
    document.querySelectorAll('.btn-share-fb').forEach(button => {
        button.addEventListener('click', (event) => {
            const pageUrl = event.target.dataset.url;
            window.open(`http://www.facebook.com/sharer/sharer.php?u=${pageUrl}`);
        });
    });

    // 라인 공유
    document.querySelectorAll('.btn-share-ln').forEach(button => {
        button.addEventListener('click', (event) => {
            const pageUrl = event.target.dataset.url;
            window.open(`https://social-plugins.line.me/lineit/share?url=${pageUrl}`);
        });
    });
});
</script>
<style>
.event-container {
    border: 1px solid #ddd;
    padding: 20px;
    margin: 20px auto;
    width: 50%;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    font-family: Arial, sans-serif;
}

.event-container h1 {
    text-align: center;
    color: #333;
}

.content div {
    margin-bottom: 20px;
}

.img img {
    max-width: 100%;
    height: auto;
}
</style>
</head>
<body>
    <div class="event-container">
        <div class="head">
            <h1>Event Page 1</h1>
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

    <div class="event-container">
        <div class="head">
            <h1>Event Page 2</h1>
        </div>
        <div class="content">
            <div class="date">
                <strong>날짜:</strong>
                <fmt:formatDate value="${event2.sysdate}" pattern="yyyy-MM-dd" />
            </div>
            <div class="img">
                <strong>이미지:</strong> <a href="${event2.imageLink}"> <img
                    alt="Event Image" src="${event2.imageSrc}" />
                </a>
            </div>
            <div class="text">
                <strong>내용:</strong>
                <textarea rows="5" cols="50" readonly>${event2.description}</textarea>
            </div>
            <div class="link">
                <strong>링크:</strong> <a href="${event2.link}" target="_blank">이벤트 자세히 보기</a>
            </div>
            <div class="SNS">
                <button type="button" class="btn-share-tw" data-url="${event2.link}">트위터로 공유하기</button>
                <button type="button" class="btn-share-fb" data-url="${event2.link}">페이스북으로 공유하기</button>
                <button type="button" class="btn-share-ln" data-url="${event2.link}">라인 공유</button>
            </div>
        </div>
    </div>
</body>
</html>
