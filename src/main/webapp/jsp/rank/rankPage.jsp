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

<body>
<div class="nav-bar">
<div class="nav-items">
<a href="RankC">콜라보 랭킹</a>
<a href="LimitedC">기간한정 랭킹</a>
<a href="RankPageC">역대 콜라보 랭킹</a>
<a href="LimitedPageC">역대 기간한정 랭킹</a>
<div class="settings">
    <span class="settings-icon" onclick="toggleSettingsMenu(event)">게시물</span>
    <div id="settingsMenu" class="settings-menu">
        <button onclick="location.href='RankRegC'">글쓰기</button>
        <button onclick="location.href='edit.jsp'">수정하기</button>
        <button onclick="location.href='delete.jsp'">글삭제하기</button>
    </div>
</div>
</div>
</div>




	<div class="rnakPage-container">
		<c:forEach var="c" items="${collaboPages}">
			<div class="rankPage-wrap"
				onclick="location.href='RankDetailC?id=${c.id}'">
				<div class="rankPage-img">
					<img alt="${c.title}" src="${c.p_img}">
				</div>
				<div class="movie-title">${c.title}</div>
				<div class="rnakPage-actor">${c.p_actor}</div>
			</div>
		</c:forEach>
	</div>



</body>
</html>