const slider = document.querySelector(".slider");
const slides = document.querySelectorAll(".slider img");
const slideCount = slides.length;
let currentIndex = 1; // 첫 번째 이미지를 보여줌

// 슬라이드를 앞뒤로 복제
const firstClone = slides[0].cloneNode(true);
const lastClone = slides[slides.length - 1].cloneNode(true);

slider.appendChild(firstClone);
slider.insertBefore(lastClone, slides[0]);

// 슬라이더 초기 위치 설정
slider.style.transform = `translateX(-1200px)`;

// 슬라이드 이동 관련 함수
function moveToNextSlide() {
	currentIndex++;
	slider.style.transition = "transform 0.5s ease-in-out"; // 0.3초로 변경
	slider.style.transform = `translateX(-${1200 * currentIndex}px)`;

	if (currentIndex === slideCount + 1) {
		setTimeout(() => {
			slider.style.transition = "none"; // 애니메이션 끄기
			currentIndex = 1; // 처음 슬라이드로 이동
			slider.style.transform = `translateX(-1200px)`;
		}, 500); // 애니메이션 시간과 동일 (0.5초)
	}
}

// 슬라이드 이동을 멈추기 위해 setInterval ID를 저장
let intervalId = setInterval(moveToNextSlide, 3000); // 3초마다 이동

// 슬라이드 일시정지 및 재시작
slider.addEventListener("mouseover", () => {
	clearInterval(intervalId); // 자동 슬라이드 멈춤
});

slider.addEventListener("mouseout", () => {
	intervalId = setInterval(moveToNextSlide, 3000); // 자동 슬라이드 재시작
});

// 왼쪽 및 오른쪽 버튼 제어
const leftBtn = document.querySelector(".left-btn");
const rightBtn = document.querySelector(".right-btn");

rightBtn.addEventListener("click", () => {
	clearInterval(intervalId); // 자동 슬라이드 멈춤
	currentIndex++;
	slider.style.transition = "transform 0.5s ease-in-out"; // 0.3초로 변경
	slider.style.transform = `translateX(-${1200 * currentIndex}px)`;

	if (currentIndex === slideCount + 1) {
		setTimeout(() => {
			slider.style.transition = "none";
			currentIndex = 1;
			slider.style.transform = `translateX(-1200px)`;
		}, 300); // 애니메이션 시간과 동일 (0.3초)
	}

	// 3초 후 자동 슬라이드 재시작
	intervalId = setTimeout(() => {
		intervalId = setInterval(moveToNextSlide, 3000);
	}, 3000);
});

leftBtn.addEventListener("click", () => {
	clearInterval(intervalId); // 자동 슬라이드 멈춤
	currentIndex--;
	slider.style.transition = "transform 0.5s ease-in-out"; // 0.3초로 변경
	slider.style.transform = `translateX(-${1200 * currentIndex}px)`;

	if (currentIndex === 0) {
		setTimeout(() => {
			slider.style.transition = "none";
			currentIndex = slideCount;
			slider.style.transform = `translateX(-${1200 * currentIndex}px)`;
		}, 500); // 애니메이션 시간과 동일 (0.3초)
	}

	// 3초 후 자동 슬라이드 재시작
	intervalId = setTimeout(() => {
		intervalId = setInterval(moveToNextSlide, 3000);
	}, 3000);
});