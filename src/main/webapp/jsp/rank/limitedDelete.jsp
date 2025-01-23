<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/rankPage.css">
<style>
    .settings-menu {
        display: none;
        position: absolute;
        background: #fff;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    }
    .settings-menu button {
        display: block;
        width: 100%;
        padding: 8px 10px;
        border: none;
        background: none;
        text-align: left;
        cursor: pointer;
    }
    .settings-menu button:hover {
        background: #f0f0f0;
    }
    .settings-icon {
        cursor: pointer;
        position: relative;
    }
    
   
    .delete-btn {
        position: absolute;
        top: 10px;
        right: 10px;
        background-color: red;
        color: white;
        border: none;
        border-radius: 50%;
        width: 25px;
        height: 25px;
        font-size: 16px;
        cursor: pointer;
        text-align: center;
        line-height: 25px;
        font-weight: bold;
    }
    .rankPage-wrap {
        position: relative; /* 삭제 버튼 위치를 위해 부모 요소 설정 */
        border: 1px solid #ddd;
        border-radius: 5px;
        padding: 10px;
        background: #fff;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
</style>

<script>
    function toggleSettingsMenu(event) {
        const menu = document.getElementById("settingsMenu");
        if (menu.style.display === "none" || menu.style.display === "") {
            menu.style.display = "block";
        } else {
            menu.style.display = "none";
        }
        event.stopPropagation();
    }

    // 메뉴가 열려 있을 때, 바깥 영역 클릭 시 메뉴 닫기
    document.addEventListener("click", function () {
        const menu = document.getElementById("settingsMenu");
        if (menu) {
            menu.style.display = "none";
        }
    });
</script>
</head>
<link rel="stylesheet" href="css/rankPage.css">
<body>
<div class="nav-bar">
<div class="nav-items">
<a href="RankC">콜라보 랭킹</a>
<a href="#">기간한정 랭킹</a>
<a href="RankPageC">역대 콜라보 랭킹</a>
<a href="LimitedPageC">역대 기간한정 랭킹</a>
 <a href="LimitedPageC">완료</a>
        
    </div>
</div>

 
    
        
<div class="rnakPage-container">
    <c:forEach var="l" items="${limited}">
        <div class="rankPage-wrap" onclick="deletePost(event, '${l.id}')">
            <button class="delete-btn" >×</button>
            <div class="rankPage-img">
                <img alt="${l.title}" src="${l.p_img}">
            </div>
            <div class="movie-title">${l.title}</div>
            <div class="rnakPage-actor">${l.p_actor}</div>
        </div>
    </c:forEach>
</div>

<script>
    function deletePost(event, postId) {
        event.stopPropagation(); // 부모 요소 클릭 방지

        if (confirm("정말 삭제하시겠습니까?")) {
            // AJAX 요청으로 삭제 처리 (예시)
            fetch(`LimitedDeleteC2?id=${postId}`, {
                method: 'POST',
            }).then(response => {
                if (response.ok) {
                    alert("삭제되었습니다.");
                    event.target.closest('.rankPage-wrap').remove(); // 화면에서 제거
                } else {
                    alert("삭제에 실패했습니다.");
                }
            }).catch(error => {
                console.error("삭제 오류:", error);
            });
        }
    }
</script>



</html>