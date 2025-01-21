<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>${title}</title>
     <style>
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            	
            margin: 0;
        }
       .a1 {
            text-align: center;
        }
        .a2 {
            text-align: center;
            max-width: 600px;
        }
    </style>
</head>
<body>
    <div class="container">
   <div class="a1"><h1>${title}</h1></div>
    <div class="a2">${contentt}</div>
    </div>
</body>
</html>
