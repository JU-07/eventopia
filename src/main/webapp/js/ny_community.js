// 指定した要素のクリックイベントを設定
document.querySelectorAll(".attention-title").forEach((title) => {
	if (title) {
		title.addEventListener("click", () => {
			const targetId = title.getAttribute("data-target");
			const content = document.getElementById(targetId);

			if (content) {
				content.classList.toggle("open");
				title.textContent = content.classList.contains("open")
					? title.textContent.replace("▽", "△")
					: title.textContent.replace("△", "▽");
			}
		});
	}
});

// 上に戻るボタンの設定
const backToTopButton = document.getElementById('backToTop');

if (backToTopButton) {
	// スクロール位置に応じてボタンを表示・非表示
	window.addEventListener('scroll', function() {
		backToTopButton.style.display = window.scrollY > 300 ? 'block' : 'none';
	});

	// クリックでスムーズスクロール
	backToTopButton.addEventListener('click', function() {
		window.scrollTo({
			top: 0,
			behavior: 'smooth'
		});
	});
}

// 投稿一覧の更新
function updatePosts() {
	fetch('/PostsTable') // 必要なエンドポイントに変更してください
		.then(response => {
			if (!response.ok) {
				throw new Error("投稿一覧の更新に失敗しました");
			}
			return response.text();
		})
		.then(html => {
			document.getElementById('postsContainer').innerHTML = html;
		})
		.catch(err => console.error('投稿一覧の更新でエラーが発生しました:', err));
}

// 投稿フォームの送信処理
document.getElementById("postForm").addEventListener("submit", function(event) {
	event.preventDefault(); // デフォルトのフォーム送信を防止

	const formData = new FormData(this);

	fetch("FreePostC", {
		method: "POST",
		body: formData
	})
		.then(response => response.text()) // サーバーからのHTMLレスポンスを取得
		.then(html => {
			// 投稿一覧のHTMLを更新
			document.getElementById("postsContainer").innerHTML = html;
			this.reset(); // フォームをリセット
		})
		.catch(error => console.error("投稿処理でエラーが発生しました:", error));
});


