// 탭 전환 함수
function showTab(tabId) {
    // 모든 콘텐츠와 버튼 숨기기
    document.querySelectorAll('.tab-content').forEach(tab => {
        tab.style.display = 'none'; // 콘텐츠 숨기기
    });
    document.querySelectorAll('.tab-buttons').forEach(buttonGroup => {
        buttonGroup.style.display = 'none'; // 버튼 그룹 숨기기
    });

    // 선택된 콘텐츠와 버튼 표시
    const content = document.getElementById(tabId); // 콘텐츠 ID 선택
    const buttons = document.getElementById(`${tabId}-buttons`); // 버튼 그룹 ID 선택

    if (content) {
        content.style.display = 'block'; // 콘텐츠 표시
        console.log(`Content shown: ${content.id}`);
    } else {
        console.error(`Content with id ${tabId} not found`);
    }

    if (buttons) {
        buttons.style.display = 'block'; // 버튼 그룹 표시
        console.log(`Buttons shown: ${buttons.id}`);
    } else {
        console.error(`Buttons with id ${tabId}-buttons not found`);
    }
}

// 페이지 로드 시 기본 탭 설정
document.addEventListener('DOMContentLoaded', () => {
    showTab('home'); // 기본적으로 'home' 탭을 표시
});
