// 탭 전환 함수
function showTab(tabId) {
	
	 // 전달받은 tabId 값 출력
    console.log(`Clicked Tab ID: ${tabId}`);
    
    // 모든 콘텐츠와 버튼 숨기기
    document.querySelectorAll('.tab-content').forEach(tab => tab.classList.add('hidden')); // 메인 콘텐츠 숨기기
    document.querySelectorAll('.tab-buttons').forEach(button => button.classList.add('hidden')); // 버튼 그룹 숨기기

    // 선택된 탭과 버튼 보이기
    const content = document.getElementById(tabId); // 선택된 탭의 콘텐츠
    const buttons = document.getElementById(`${tabId}-buttons`); // 선택된 탭의 버튼 그룹

    if (content) {
        content.classList.remove('hidden'); // 콘텐츠 표시
    }
    if (buttons) {
        buttons.classList.remove('hidden'); // 버튼 그룹 표시
    }
}
