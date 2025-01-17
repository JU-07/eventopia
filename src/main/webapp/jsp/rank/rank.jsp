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
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
}

h1 {
	text-align: center;
	color: #333;
	margin-top: 20px;
}

.container {
	display: flex;
	justify-content: space-between;
	margin: 20px auto;
	width: 90%; /* 컨테이너 너비 */
}

.review-row {
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 100%;
	margin: 3px auto;
	padding: 10px;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.review-row img {
	border-radius: 4px;
}

.span-container {
	display: flex;
	flex-direction: column; /* 세로로 텍스트 배치 */
	gap: 10px; /* 각 텍스트 간 간격 */
	justify-content: center; /* 컨테이너 내부에서 중앙 정렬 */
	min-width: 200px; /* 모든 텍스트 컨테이너 너비를 고정 */
	padding-left: 10px; /* 텍스트 시작점 보정 */
}

@media ( max-width : 600px) {
	.span-container {
		flex-direction: column;
		gap: 10px;
	}
}

.modal {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 1000;
	background: white;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	border-radius: 8px;
	width: 90%;
	max-width: 400px;
}

.modal-content {
	max-height: 400px; /* 모달 내용의 최대 높이 */
	overflow-y: auto; /* 내용이 넘칠 경우 스크롤 활성화 */
}

.modal-overlay {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 999;
}

.modal-header {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
	color: #333;
}

.modal-footer {
	margin-top: 20px;
	text-align: right;
}

.modal-footer button {
	padding: 5px 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.modal-footer button:first-child {
	background-color: #4CAF50;
	color: white;
	margin-right: 10px;
}

.modal-footer button:last-child {
	background-color: #f44336;
	color: white;
}

.fixed-button {
	position: fixed;
	right: 20px;
	top: 50%;
	transform: translateY(-50%);
	z-index: 100;
	background-color: #007BFF;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	cursor: pointer;
}

.fixed-button:hover {
	background-color: #0056b3;
}

.progress-bar {
	width: 100%; /* 전체 너비 */
	background-color: #f0f0f0; /* 배경색 */
	border: 1px solid #ddd; /* 테두리 */
	border-radius: 10px;
	overflow: hidden;
	height: 20px; /* 높이 */
	margin-top: 10px;
}

.progress {
	height: 100%; /* 내부 진행 상태 */
	background-color: #4CAF50; /* 진행 색상 */
	text-align: center;
	line-height: 20px; /* 텍스트 정렬 */
	color: white;
	font-weight: bold;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
	<a href="RankPageC">역대랭킹</a>
	<h1>랭킹 순위</h1>

	<div class="container">
		<div>
			<div style="text-align: center;; margin-bottom: 20px; color: #666;">콜라보
				Top 5</div>
			<c:forEach items="${product }" var="p">
				<div class="review-row">
					<img src="${p.image_url}" alt="Sample Image" width="200"
						height="200" />
					<div class="span-container">
						<span>${p.p_name}</span> <span>${p.p_price}円</span> <span>${p.p_exp}</span>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>


	<button class="fixed-button" onclick="openModal()">투표하기</button>

	<div class="modal-overlay" id="modal-overlay"></div>
	<form id="voteForm" action="RankC" method="POST">
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
	<canvas id="myChart" width="200px" height="200px"></canvas>
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