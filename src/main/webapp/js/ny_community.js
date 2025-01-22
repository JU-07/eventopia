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

document.addEventListener("DOMContentLoaded", () => {
	const backButton = document.getElementById("backButton");

	backButton.addEventListener("click", () => {
		// 遷移先のページを指定
		window.location.href = "community/CommunityC";
	});
});

//chat 

function openChat() {
	window.location.href = "FreePostC2";
}


//削除
function deletePost(postId) {
	if (confirm('本当に削除しますか？')) {
		fetch(`FreePostC?postId=${postId}`, {
			method: 'DELETE'
		})
			.then(response => {
				if (response.ok) {
					alert('削除されました');
					window.location.href = 'CommunityC'; // 投稿一覧に戻る
				} else {
					alert('削除に失敗しました');
				}
			})
			.catch(error => {
				console.error('削除エラー:', error);
			});
	}
}

// 削除ボタンをクリックした際の確認
document.querySelector("form[action='DeletePostC'] button").addEventListener("click", function(event) {
	const confirmDelete = confirm("本当に削除しますか？");
	if (!confirmDelete) {
		event.preventDefault(); // 削除をキャンセル
	}
});

// 画像プレビュー (必要に応じて)
document.querySelector("input[type='file']").addEventListener("change", function(event) {
	const fileInput = event.target;
	if (fileInput.files && fileInput.files[0]) {
		const reader = new FileReader();
		reader.onload = function(e) {
			// プレビュー要素に画像を表示 (必要に応じて)
			const imgPreview = document.getElementById("imgPreview");
			if (imgPreview) {
				imgPreview.src = e.target.result;
			}
		};
		reader.readAsDataURL(fileInput.files[0]);
	}
});

document.getElementById('editForm').addEventListener('submit', function(event) {
	const name = document.querySelector('input[name="name"]').value.trim();
	const content = document.querySelector('textarea[name="content"]').value.trim();

	if (!name || !content) {
		event.preventDefault();
		alert('名前と内容は必須です。'); // エラー通知
	}
});

//写真のモダール
