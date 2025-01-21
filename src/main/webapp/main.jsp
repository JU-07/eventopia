<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css">
<script type="text/javascript" src="js/main.js" defer></script>
</head>
<body>
	<div style="position: relative;">
		<button class="slider-btn left-btn">
			<img src="Icon/main/arr_visual.png" alt="" />
		</button>
		<div class="slider-container">
			<div class="slider">
				<img src="Icon/main/famima_event1.jpg" alt="Slide 1" /> <img
					src="Icon/main/seven_event1.jpg" alt="Slide 2" /> <img
					src="Icon/main/seven_event2.jpg" alt="Slide 3" /> <img
					src="Icon/main/lawson_event1.jpg" alt="Slide 4" /> <img
					src="Icon/main/famima_event2.jpg" alt="Slide 5" />
			</div>
		</div>
		<button class="slider-btn right-btn">
			<img src="Icon/main/arr_visual.png" alt="" />
		</button>
	</div>
	<div class="EMoving">
		<span>EVENTOPIA</span><span>EVENTOPIA</span><span>EVENTOPIA</span>
	</div>
	<div class="event-container">
		<div class="event-item">
			<div class="event-logo">
				<img src="icon/logo/l_logo.webp" alt="Lawson Logo"
					onclick="location.href='LowsonC'" />
			</div>
			<div class="event-content lawson">
				<div class="event-title">이벤트 제목</div>
				<img src="icon/main/lawson_event1.jpg" class="event-img" />
				<div class="event-txt">이벤트 내용</div>
				<div class="event-user">
					<div>좋아요</div>
					<div>공유</div>
				</div>
			</div>
		</div>
		<div class="event-item">
			<div class="event-logo">
				<img src="icon/logo/s_logo.webp" alt="Seven Logo"
					onclick="location.href='SevenC'" />
			</div>
			<div class="event-content seven">
				<div class="event-title">이벤트 제목</div>
				<img src="icon/main/seven_event1.jpg" class="event-img" />
				<div class="event-txt">이벤트 내용</div>
				<div class="event-user">
					<div>좋아요</div>
					<div>공유</div>
				</div>
			</div>
		</div>

		<div class="event-item">
			<div class="event-logo">
				<img src="icon/logo/f_logo.png" alt="Family Logo"
					onclick="location.href='FamilyC'" />
			</div>
			<div class="event-content family">
				<div class="event-title">이벤트 제목</div>
				<img src="icon/main/famima_event1.jpg" class="event-img" />
				<div class="event-txt">이벤트 내용</div>
				<div class="event-user">
					<div>좋아요</div>
					<div>공유</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
