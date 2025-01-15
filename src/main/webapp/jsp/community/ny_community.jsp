<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/ny_community.css">

</head>
<body>

	<div class="community-container">
		<h1 class="text">コミュニティ</h1>

		<div class="button-container">
			<form action="FreePostC" method="get">
				<button class="free-post" >自由投稿</button>
			</form>
			<form action="SharePostC" method="get">
				<button class="share-post">情報共有</button>
			</form>
		</div>
	</div>

	<div class="attention-container">
		<h3>Attention(注意事項)</h3>
		<div class="attention">
			<div class="attention-item">
				<div class="attention-title" data-target="content-1">はじめに ▽</div>
				<div class="attention-content" id="content-1">
					イベントピアは、会員同士が自由で健全なコミュニケーションや、コラボイベント情報交換などを行うことができるサイトを目指しています。<br>
					多種多様な価値観をもつ皆様が、コミュニティでお互いに情報を発信する中で、新しいことを学ぶ活力を得たり、実社会では話しづらいお悩みへの解決策を議論しあう、それにより広がる輪を通じて日々の生活に新たな楽しみを生まれることを重要視しています。
					<br> <br>
					一方で、コミュニティで発信される情報はポジティブな話題ばかりではありません。価値観が異なる人が交流すれば、必然的に衝突も発生するものです。<br>
					運営側としても、皆様に一定のルールやマナーの遵守をお願いしたいと思います。しかし、制限を厳しくしてコミュニケーションを阻害してしまうことは、本来の目指す姿ではありません。
					<br> <br>
					下部分では、主に皆様にご理解いただきたい利用時のルール、マナー、運営側の対応を中心に説明しております。<br>
					また、より良いコミュニティにしていくために、皆様が、他者に思いやりの心をもって、自身の発言には責任を伴いコメントをすることを心掛けてください。
					<br> <br>
					皆様と一緒に少しずつ理想的なコミュニティになれるよう精進していきますので、何卒、ご理解とご協力のほどよろしくお願いいたします。
				</div>
			</div>
			<br>
			<div class="attention-item">
				<div class="attention-title" data-target="content-2">投稿ルール ▽</div>
				<div class="attention-content" id="content-2">
					イベントピアコミュニティサイトは、様々な方が閲覧しています。利用する際は、主に以下の行為を禁止事項としていますので、投稿内容やプロフィール情報の表現についてご配慮ください。<br>
					各禁止事項の行為を選択しますと、不適切な投稿例など、詳細を確認できます。
					<ul class="attention-list">
						<li class="list-item">
							<div class="list-title" data-target="list-1">1.個人情報を書かない ▽</div>
							<div class="list-content" id="list-1">
								電話番号、メールアドレス、他のSNSのID、詳細な住所、所属団体、自動車のナンバープレート、表札、個人を特定できるURLなど、個人の特定に繋がる可能性がある情報を要求したり、投稿やプロフィール情報等で公開することは控えてください。トラブルに巻き込まれる可能性が非常に高くなります。
								<br> 不適切な例 ：
								<ul class="list-example">
									<li class="list">○さんのLINEのIDを教えて。</li>
									<li class="list">私の📱は090-xxxx-xxxxだよ。</li>
									<li class="list">アドレスはabc@.yyyy.zzzです。</li>
									<li class="list-none">※投稿写真にも上記の個人情報は含まないようにご注意ください。</li>
								</ul>
							</div>
						</li>
						<li class="list-item">
							<div class="list-item">
								<div class="list-title" data-target="list-2">2.出会い目的の利用をしない
									▽</div>
								<div class="list-content" id="list-2">
									イベントピアコミュニティサイトでは、交際相手を探すためのサービス（出会い系サイト）ではありません。他者との実社会での交際を目的とした交際・交流を求める表現、実社会での出会いを目的とした投稿は禁止しています。また、出会いの相手紹介など、出会いを斡旋するような行為も固くお断りします。
									<br> 不適切な例 ：
									<ul class="list-example">
										<li class="list">彼女募集中！</li>
										<li class="list">彼氏募集中！</li>
										<li class="list">私とデートしてください。</li>
									</ul>
								</div>
							</div>
						</li>
						<li class="list-item">
							<div class="list-item">
								<div class="list-title" data-target="list-3">3.誹謗中傷をしない ▽</div>
								<div class="list-content" id="list-3">
									一般的に許容される範疇を超えて相手を非難したり、一方的な主張を繰り返す行為は、相手の心をひどく傷つけ、利用者間でのトラブルの元になります。他者の人格を否定するような誹謗中傷、他者の感情を逆撫でするような挑発的な発言、争いをたきつけるような悪口は投稿しないでください。
									<br> 不適切な例 ：
									<ul class="list-example">
										<li class="list">○○さんキモイ。</li>
										<li class="list">○○さんは嘘付きだから無視しよう。</li>
									</ul>
								</div>
							</div>
						</li>
						<li class="list-item">
							<div class="list-item">
								<div class="list-title" data-target="list-4">4.荒らし、迷惑行為をしない
									▽</div>
								<div class="list-content" id="list-4">
									記事の内容とは無関係な内容、意味不明な内容、同一の内容を繰り返し投稿するなど、明らかにコミュニケーションを阻害するような迷惑行為は、つきまといによる嫌がらせ行為と判断される場合があり、禁止しています。もし、会員がコミュニティ内でつきまとい行為にあった場合は、被害にあった当事者から事務局までご連絡ください。相手に対して警告や利用停止等の措置を検討します。
									<br> 不適切な例 ：
									<ul class="list-example">
										<li class="list">バカヤロー</li>
										<li class="list">あ ※一文字</li>
									</ul>
								</div>
							</div>
						</li>
						<li class="list-item">
							<div class="list-item">
								<div class="list-title" data-target="list-5">5.なりすまし行為をしない
									▽</div>
								<div class="list-content" id="list-5">
									事務局、他の利用者、第三者の名前など、自身とは無関係なプロフィール情報で他者になりすまして投稿することを禁止しています。もし、会員がコミュニティ内でなりすまし行為にあった場合は、被害にあった当事者から事務局までご連絡ください。相手に対して警告や利用停止等の措置を検討します。
									<br> 不適切な例 ：
									<ul class="list-example">
										<li class="list">イベントピアの○○です。</li>
									</ul>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<button class="back-to-top" id="backToTop">▲ 上にもどる</button>
	</div>

</body>
<script src="js/ny_community.js" defer></script>
</html>