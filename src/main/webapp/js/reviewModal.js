// 페이지가 완전히 로드된 후에 실행
document.addEventListener("DOMContentLoaded", function() {
	// 모달 열기
	window.openShareModal = function(reviewId) {
		// 모든 모달을 숨기기
		const modals = document.querySelectorAll('.modal');
		modals.forEach(modal => modal.style.display = 'none');

		// 해당 리뷰 ID에 맞는 모달을 열기
		const modal = document.getElementById('sns-modal-' + reviewId);
		if (modal) {
			modal.style.display = 'block';
		}
	}

	// 모달 닫기
	window.closeModal = function(reviewId) {
		const modal = document.getElementById('sns-modal-' + reviewId);
		if (modal) {
			modal.style.display = 'none';
		}
	}
});