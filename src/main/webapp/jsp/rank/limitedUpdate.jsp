<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
   <script src="js/ckeditor.js"></script>
<title>Insert title here</title>
</head>
<body>
<form action="RankRegBC" method="post">
        <label>제목:</label>
        <input type="text" name="title" required><br><br>
        
        <label>부연설명:</label>
        <input name="actor" id="actor"><br><br>
       
        <label>image:</label>
        <input name="image"><br><br>
        
        <textarea name="content" id="editor"></textarea>
        <br>
        <button type="submit">등록</button>
    
    
    
    
    
    </form>

    <script>
        ClassicEditor
            .create(document.querySelector('#editor'), {
                toolbar: [
                    'heading', '|', 'bold', 'italic', '|', 'alignment', '|', 'link', 'bulletedList', 'numberedList', '|', 'imageUpload', '|', 'undo', 'redo'
                ],
                alignment: {
                    options: ['left', 'center', 'right', 'justify'] // 정렬 옵션 추가
                }
            })
            .catch(error => {
                console.error(error);
            });
    </script>
</body>
</html>