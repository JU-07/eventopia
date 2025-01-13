<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="MovieRegC" method="post" enctype="multipart/form-data">
<div class="movie-reg">
            <div>
                <div>Title</div>
                <div>
                    <input name="title">
                </div>
            </div>
            <div>
                <div>Actor</div>
                <div>
                    <input name="actor">
                </div>
            </div>
            <div>
                <div>File</div>
                <div>
                    <input name="image" >
                </div>
            </div>
            <div>
                <div>Story</div>
                <div>
                    <textarea rows="5" cols="40" name="story"></textarea>
                </div>
            </div>
            <div>
                <div>
                    <button class="movie-btn">Add</button>
                </div>
            </div>
        </div>
</div>
</form>
</body>
</html>