const convenienceStores = [
	{ name: "세븐일레븐 신주쿠", lat: 35.6895, lng: 139.6917, type: "seven" },
	{ name: "로손 시부야", lat: 35.6581, lng: 139.7017, type: "lawson" },
	{ name: "패밀리마트 이케부쿠로", lat: 35.7323, lng: 139.7109, type: "family" }
];

let map; // 지도 객체를 전역 변수로 선언

// Google 지도 초기화 함수
function initMap() {
	const defaultCenter = { lat: 35.6895, lng: 139.6917 }; // 도쿄 중심 좌표

	// 지도 생성
	map = new google.maps.Map(document.getElementById("map"), {
		center: defaultCenter,
		zoom: 12
	});

	// 편의점 마커 추가
	convenienceStores.forEach(store => {
		new google.maps.Marker({
			position: { lat: store.lat, lng: store.lng },
			map: map,
			title: store.name
		});
	});

	// Geolocation으로 현재 위치 가져오기
	getCurrentLocation();
}

// Geolocation API로 현재 위치 가져오기
function getCurrentLocation() {
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(
			(position) => {
				const currentLocation = {
					lat: position.coords.latitude,
					lng: position.coords.longitude
				};

				// 현재 위치를 지도 중심으로 설정
				map.setCenter(currentLocation);

				// 현재 위치 마커 추가
				new google.maps.Marker({
					position: currentLocation,
					map: map,
					title: "현재 위치",
					icon: "http://maps.google.com/mapfiles/ms/icons/blue-dot.png" // 파란색 마커
				});
			},
			(error) => {
				console.error("현재 위치를 가져올 수 없습니다: ", error.message);
				alert("현재 위치를 가져올 수 없습니다.");
			}
		);
	} else {
		alert("이 브라우저는 Geolocation API를 지원하지 않습니다.");
	}
}

// 페이지 로드 시 지도 초기화
window.onload = initMap;