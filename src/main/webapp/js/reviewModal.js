// 모달 열기
function openShareModal(reviewId) {
  document.getElementById('sns-modal-' + reviewId).style.display = "block";
}

// 모달 닫기
function closeModal(reviewId) {
  document.getElementById('sns-modal-' + reviewId).style.display = "none";
}

// SNS 공유 기능
function shareOnTwitter(reviewId) {
  const url = encodeURIComponent(window.location.href); // 현재 페이지 URL
  const tweetUrl = `https://twitter.com/intent/tweet?url=${url}`;
  window.open(tweetUrl, "_blank");
}

function shareOnFacebook(reviewId) {
  const url = encodeURIComponent(window.location.href); // 현재 페이지 URL
  const fbUrl = `https://www.facebook.com/sharer/sharer.php?u=${url}`;
  window.open(fbUrl, "_blank");
}

function shareOnLine(reviewId) {
  const url = encodeURIComponent(window.location.href); // 현재 페이지 URL
  const lineUrl = `https://social-plugins.line.me/lineit/share?url=${url}`;
  window.open(lineUrl, "_blank");
}
