<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로손 이벤트 페이지</title>
    <link rel="stylesheet" href="css/event.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>

    <!-- 헤더 -->
    <header class="header">
        <h1>리뷰 페이지</h1>
    </header>

    
    <section class="event-form-section" style="text-align: center">
        <h2>리뷰 등록</h2>
        <div class="movie-form-container">
            <form action="resultRegC" method="post" enctype="multipart/form-data">
                <div class="movie-form">
                    <div class="form-group">
                        <label for="title">이벤트 제목</label>
                        <input id="title" name="title" type="text" placeholder="이벤트 제목" required>
                    </div>

                    <div class="form-group">
                        <label for="Name">상품 이름</label>
                        <input id="Name" name="Name" type="text" placeholder="상품 이름" required>
                    </div>

                    <div class="form-group">
                        <label for="file">파일 업로드</label>
                        <input id="file" name="file" type="file" required>
                    </div>

                    <div class="form-group">
                        <label for="story">상품 설명</label>
                        <textarea id="story" name="story" rows="5" placeholder="상품 설명" required></textarea>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="movie-btn">이벤트 등록</button>
                    </div>
                </div>
            </form>
        </div>
    </section>

 
    <section class="product-list-section" style="text-align: center">
        <h2>상품 목록</h2>
        <div class="product-list-container">
            <div class="product-container">
                <c:forEach var="product" items="${product}">
                    <div class="product-wrap">
                        <div class="product-img">
                            <img alt="${product.p_title}" src="">
                        </div>
                        <div class="product-title" onclick="location.href='EventDetailC?no=${product.p_no}'">
                            ${product.p_title}
                        </div>
                        <div class="product-price">${product.p_price}원</div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <section class="pagination-section">
        <div class="pagination">
            <a href="ReviewPageC?p=1">[처음]</a>
            <c:forEach begin="1" end="${pageCount}" var="i">
                <a href="EventPageC?p=${i}">[${i}]</a>
            </c:forEach>
            <a href="ReviewPageC?p=${pageCount}">[끝]</a>
        </div>
    </section>

</body>
</html>
</html>