 // 모달 열기
function openShareModal() {
    document.getElementById("shareModal").style.display = "block";
}

// 모달 닫기
function closeShareModal() {
    document.getElementById("shareModal").style.display = "none";
}

// SNS 공유 함수
function shareToSNS(platform) {
    let url = encodeURIComponent(window.location.href);
    let text = encodeURIComponent("이 페이지를 확인해보세요!");

    switch (platform) {
        case "twitter":
            window.open(`https://twitter.com/intent/tweet?url=${url}&text=${text}`, "_blank");
            break;
        case "facebook":
            window.open(`https://www.facebook.com/sharer/sharer.php?u=${url}`, "_blank");
            break;
        case "line":
            window.open(`https://social-plugins.line.me/lineit/share?url=${url}`, "_blank");
            break;
        default:
            alert("지원되지 않는 플랫폼입니다.");
    }

    // 모달 닫기
    closeShareModal();
}
