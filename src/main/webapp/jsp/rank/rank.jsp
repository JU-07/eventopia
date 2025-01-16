<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>



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
 	justify-content:space-between;
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

@media (max-width: 600px) {
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
		<div >
			<div style="text-align: center;; margin-bottom: 20px; color: #666;">콜라보
				Top 5</div>
			<c:forEach items="${product }" var="p">
				<div class="review-row">
					<img src="${p.image_url}" alt="Sample Image" width="200"height="200" />
					<div class="span-container">
					<span>${p.p_name}</span>
					 <span>${p.p_price}円</span> 
					 <span>${p.p_exp}</span>
<%-- 					   <div>
                <!-- 득표율 그래프 -->
                <div class="progress-bar">
                    <div class="progress" style="width: ${p.p_count}%;"></div>
                </div>
                <span>${p.p_count}% 득표</span>
            </div>
					 <div>
                <!-- 각 상품에 대한 차트를 표시할 Canvas -->
                <canvas id="chart-" width="200" height="200"></canvas>
</div> --%>
            
				</div></div>
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
		// 모달 열기 함수
		function openModal() {
			document.getElementById('modal').style.display = 'block';
			document.getElementById('modal-overlay').style.display = 'block';
		}

		// 모달 닫기 함수
		function closeModal() {
			document.getElementById('modal').style.display = 'none';
			document.getElementById('modal-overlay').style.display = 'none';
		}

		function submitVote() {
			const form = document.getElementById('voteForm');
			form.submit();
		}
		
		
		
 	</script>
<!-- <script type="text/javascript">
//JSP 페이지에서 서버 데이터를 JSON으로 변환 후 전달


const productData = ${product}; // 서버에서 전달받은 product 리스트


 document.addEventListener("DOMContentLoaded", () => {
    productData.forEach(product => {
        const ctx = document.getElementById(`chart-${product.p_no}`).getContext("2d");

        // Chart.js를 사용하여 차트 생성
        new Chart(ctx, {
            type: 'doughnut', // 도넛형 차트
            data: {
                labels: ['득표 수', '잔여 수'], // 득표 수와 다른 값을 비교
                datasets: [{
                    data: [product.p_count, 100 - product.p_count], // 득표 수 기반 데이터
                    backgroundColor: ['#4CAF50', '#E0E0E0'],
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { display: false },
                    tooltip: { enabled: true }
                }
            }
        });
    });
}); 


</script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> -->
</body>
</html>