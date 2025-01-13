<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="text-align: center;"><h1> -포켓몬 도감 상세-</h1></div>
<div style="display: flex; justify-content: center;">
<div class="movie-detail">
<div>
<div class="col-1">NO </div>
<div class="col-2">${mo.m_no } </div>
</div>

<div>
<div> <img alt="" src="jsp/movie/movieFile/${mo.m_img }"></div>
</div>
<div>
<div class="col-1">제목 </div>
<div class="col-2">${mo.m_title } </div>
</div>
<div>
<div class="col-1">부연설명  </div>
<div class="col-2">${mo.m_actor } </div>
</div>
<div>
<div class="col-1">스토리 </div>
<div class="col-2">${mo.m_story } </div>
</div>
</div>
</div>
</body>
</html>