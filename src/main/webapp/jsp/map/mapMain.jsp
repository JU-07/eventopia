<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="js/map.js">
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBQsyE-sXuxVD0qnrf51po1SNS3luOxkPU"></script>
<style>
#map {
	height: 600px;
	width: 100%;
}
</style>
</head>
<body>

	<div id="map"></div>
	<!-- <script>
		// Google 지도 초기화 함수
		function initMap() {
			// 도쿄 중심 좌표
			const tokyoCenter = {
				lat : 35.6895,
				lng : 139.6917
			};

			// 지도 옵션
			const mapOptions = {
				center : tokyoCenter, // 지도 중심을 도쿄로 설정
				zoom : 14, // 확대/축소 레벨
			};

			// 지도 생성
			const map = new google.maps.Map(document.getElementById("map"),
					mapOptions);

			// 도쿄 중심에 마커 추가
			new google.maps.Marker({
				position : tokyoCenter,
				map : map,
				title : "도쿄 중심부"
			});
		}

		// 페이지 로드 시 지도 초기화
		window.onload = initMap;
	</script> -->
	<script src="js/map.js"></script>
</body>
</html>