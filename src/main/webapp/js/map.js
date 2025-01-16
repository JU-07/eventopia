let map;
let service;
let infowindow;

let latitude;
let longitude;

// 현재 위치를 비동기로 가져온 후 initMap 호출
async function getCurrentLoc() {
    return new Promise((resolve, reject) => {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(
                function (position) {
                    latitude = position.coords.latitude; // 위도
                    longitude = position.coords.longitude; // 경도
                    console.log(`위도: ${latitude}, 경도: ${longitude}`);
                    resolve(); // 위치를 성공적으로 가져온 경우
                },
                function (error) {
                    console.error("위치를 가져올 수 없습니다:", error);
                    reject(error); // 위치 가져오기에 실패한 경우
                }
            );
        } else {
            console.error("이 브라우저는 Geolocation API를 지원하지 않습니다.");
            reject(new Error("Geolocation API not supported."));
        }
    });
}

async function initApp() {
    try {
        await getCurrentLoc(); // 현재 위치 가져오기
        initMap(); // 지도 초기화
    } catch (error) {
        console.error("앱 초기화 중 오류 발생:", error);
    }
}

function initMap() {
    const current = new google.maps.LatLng(latitude, longitude);

    infowindow = new google.maps.InfoWindow();
    map = new google.maps.Map(document.getElementById("map"), {
        center: current,
        zoom: 16,
    });
	let companies = [{ name : 'セブンイレブン', imgURL : 'icon/s_logo.webp'}, {name : 'gs편의점', imgURL : 'icon/l_logo.webp'},{name : 'CU편의점', imgURL : 'icon/f_logo.png'}];
    const request = {
        keyword: "",
        fields: ["name", "geometry"],
        radius: 100, // 검색 반경 (단위: 미터)
        location: { lat: latitude, lng: longitude },
    };

    service = new google.maps.places.PlacesService(map);
	for(let i = 0; i < 3; i ++){
	request.keyword = companies[i].name;
					
	companyMarkers(service, map, request, companies[i].imgURL);	
	}
	
}

function companyMarkers(service, map, request, imgURL){
    service.nearbySearch(request, (results, status) => {
        if (status === google.maps.places.PlacesServiceStatus.OK && results) {
            for (let i = 0; i < results.length; i++) {
                createMarker(results[i], imgURL);
				console.log(results[i])
            }

            map.setCenter(results[0].geometry.location);
        }
    });
	
}

function createMarker(place, imgURL) {
	console.log(imgURL)
    if (!place.geometry || !place.geometry.location) return;

    const marker = new google.maps.Marker({
        map,
        position: place.geometry.location,
		icon: {
		        url: imgURL, // 프로젝트 내 images 폴더에서 blue-dot.png 파일 불러오기
		        scaledSize: new google.maps.Size(20, 20), // 크기 조정
		        fillOpacity: 0.8, // 투명도
		    },		
    });

    google.maps.event.addListener(marker, "click", () => {
        let content = `<b>${place.name}</b><hr/><img src="${place.icon}"><br>${place.vicinity}`;
        infowindow.setContent(content);
        infowindow.open(map, marker);
    });
}

// 앱 초기화
initApp();
