<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet" href="css/rank.css">
<style type="text/css">
/* 기본 스타일 */

.top-ranked {
    background-color: #fff5cc; /* 황금색 배경 */
    border: 2px solid #ffcc00; /* 강조된 테두리 */
    font-weight: bold;
}



.rank {
    align-self: center;
}

.review-row {
    position: relative;
   
    padding: 15px;
    margin-bottom: 20px;
    border-radius: 10px;
    box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.1);
}

.rank-label {
    position: absolute;
    top: 10px;
    left: 10px;
    font-size: 50px;  /* 아이콘 크기 조정 */
    line-height: 1;
    z-index: 10;
}

.product-image {
    width: 250px;
    height: 200px;
    border-radius: 10px;
}

</style>
</head>
<body>
<div class="nav-bar"> 	
<div class="nav-items">
<a href="RankC">콜라보 랭킹</a>
<a href="LimitedC">콜라보 랭킹</a>
<a href="RankPageC">역대 콜라보 랭킹</a>
<a href="LimitedPageC">역대 기간한정 랭킹</a>
<a href="#">미니 게임</a>
<a href="RankRegC">게시물 등록</a>
</div>
</div>


	<h1 class="h1rank">랭킹 순위</h1>

	<div class="container">
		<div>
			<div style="text-align: center;; margin-bottom: 20px; color: #666;">기간한정
				Top 5</div>
			<c:forEach items="${product }" var="p" varStatus="status">
				<div class="review-row ${status.index < 3 ? 'top-ranked' : ''}">
				<c:choose>
            <c:when test="${status.index == 0}">
                <div class="rank-label">🥇</div>
            </c:when>
            <c:when test="${status.index == 1}">
                <div class="rank-label">🥈</div>
            </c:when>
            <c:when test="${status.index == 2}">
                <div class="rank-label">🥉</div>
            </c:when>
        </c:choose>
				
					<img src="${p.image_url}" alt="Sample Image" style= "width: 250px; height: 200px " /> 
						
					<div class="span-container">
						<span>${p.p_name}</span> <span>${p.p_price}円</span> <span>${p.p_exp}</span> <span>${p.p_category }</span>
				
					</div>
				</div>
			</c:forEach>
		</div>
	<canvas id="myChart" width="650" height="600"></canvas>
	</div>


	<button class="fixed-button" onclick="openModal()">투표하기</button>

	<div class="modal-overlay" id="modal-overlay"></div>
	<form id="voteForm" action="LimitedC" method="POST">
		<div class="modal" id="modal">
			<div class="modal-header">투표 페이지</div>
			<div class="modal-body">
				<div class="modal-content">
					<div style="color: black;">
						<c:forEach items="${product }" var="p">
							<div class="review-row">
								<span>${p.p_name}</span> <span>${p.p_price}원</span> <span>${p.p_category}</span>
								<img src="${p.image_url}" alt="Sample Image" width="70"
									height="70" /> <span><input type="checkbox"
									name="check" value="${p.p_no}" /></span>
							</div>
						</c:forEach>

					</div>

				</div>


				<div class="modal-footer">
					<button type="button" onclick="submitVote()">투표 완료</button>
					<button type="button" onclick="closeModal()">닫기</button>
				</div>
			</div>
		</div>
	</form>
	<script>
		// 모달 열기 
		function openModal() {
			document.getElementById('modal').style.display = 'block';
			document.getElementById('modal-overlay').style.display = 'block';
		}

		// 모달 닫기 
		function closeModal() {
			document.getElementById('modal').style.display = 'none';
			document.getElementById('modal-overlay').style.display = 'none';
		}

		function submitVote() {
			const form = document.getElementById('voteForm');
			form.submit();
		}
	</script>


	<script>
 //  데이터 가져오기
 document.addEventListener("DOMContentLoaded", () => {
	 console.log('ajax call')
 
    fetch('/Eventopia/ChartAPI')
        .then(response => response.json()) // JSON 데이터 파싱
        .then(data => {
        	
        
            // 데이터를 차트 형식으로 변환
            const labels = data.map(product => product.p_name); 
            const counts = data.map(product => product.p_count); 

    
        const ctx = document.getElementById('myChart').getContext('2d');
        const myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: '득표수',
                    data: counts,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
            	responsive: false,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
        });
        });
    </script>
</body>
</html>