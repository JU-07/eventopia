 function toggleTOC() {
        var toc = document.getElementById('toc');
        if (toc.style.display === 'none') {
            toc.style.display = 'block'; // 펼치기
        } else {
            toc.style.display = 'none'; // 접기
        }
    }
    function showReview(index) {
        var reviews = document.querySelectorAll('.review-item');
        reviews.forEach(function(review, idx) {
            if (idx === index) {
                review.style.display = 'block'; // 클릭된 리뷰만 표시
            } else {
                review.style.display = 'none'; // 나머지 리뷰는 숨기기
            }
        });
    }    
    window.onload = function() {
        showReview(0);
    };
    function displayReview(index) {
        var reviews = document.getElementsByClassName("review-item");
        // 모든 리뷰를 숨긴다.
        for (var i = 0; i < reviews.length; i++) {
            reviews[i].style.display = 'none';
        }
        // 클릭한 리뷰만 보이게 한다.
        document.getElementById("review" + index).style.display = 'block';
    }
    