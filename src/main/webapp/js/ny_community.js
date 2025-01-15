//내용
document.querySelectorAll(".attention-title").forEach((title) => {
	title.addEventListener("click", () => {

		const targetId = title.getAttribute("data-target");
		const content = document.getElementById(targetId);

		if (content) {

			content.classList.toggle("open");

			if (content.classList.contains("open")) {
				title.textContent = title.textContent.replace("▽", "△");
			} else {
				title.textContent = title.textContent.replace("△", "▽");
			}
		}
	});
});

document.querySelectorAll('.list-title').forEach((title) => {
	title.addEventListener('click', () => {
		const targetId = title.dataset.target;
		const content = document.getElementById(targetId);

		if (content.classList.contains('open')) {
			content.classList.remove('open');
			title.innerHTML = title.innerHTML.replace('△', '▽');
		} else {
			content.classList.add('open');
			title.innerHTML = title.innerHTML.replace('▽', '△');
		}
	});
});



//위에 돌아가기
const backToTopButton = document.getElementById('backToTop');

// スクロール時のイベント
window.addEventListener('scroll', function () {
    // スクロール位置が300px以上の場合にボタンを表示
    if (window.scrollY > 300) {
        backToTopButton.style.display = 'block';
    } else {
        backToTopButton.style.display = 'none';
    }
});

// 上に戻るボタンのクリックイベント
backToTopButton.addEventListener('click', function () {
    // スムーズにページの先頭までスクロール
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
});


//free-post
document.getElementById("postForm").addEventListener("submit", function(e) {
	e.preventDefault(); // ページリロードを防ぐ

	const formData = new FormData(this);
	fetch("BulletboardC", {
		method: "POST",
		body: formData,
	})
		.then(response => response.text())
		.then(html => {
			document.getElementById("postsContainer").innerHTML = html;
		})
		.catch(error => console.error("Error:", error));
});

