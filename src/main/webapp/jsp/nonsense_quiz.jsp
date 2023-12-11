<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<meta charset="EUC-KR">
<title>마즐래 마출래</title>
<style>
*{font-family: 'Gugi', cursive;}
a:link, a:visited {
     background-color: #8e44ad;
     color: white;
     padding: 15px 25px;
     text-align: center;
     text-decoration: none;
     display: inline-block;
}
 a:hover, a:active {
     background-color: #732d91;
}
a:focus{
    outline: none;
    background-color: #5e3370;
}
</style>
<link rel="stylesheet" href="../css/style.css">
<script src="../js/nonsense.js" defer charset="UTF-8"></script>
</head>
<body>
    <div class="quiz_container">
    <a href="quiz_info.jsp">다른 퀴즈 풀러가기</a>
        <div class="question_container">
            <h2 id="question"></h2>
            
            
            <ul>
                <li>
                    <input type="radio" class="answer" id="a" name="answer">
                    <label id="a_text" for="a"></label>
                </li>
                <li>
                    <input type="radio" class="answer" id="b" name="answer">
                    <label id="b_text" for="b"></label>
                </li>

            </ul>
        </div>
        <div id="result" align = "center"></div>
        <button id="submit">확인</button>
      <form action="result.jsp">
        
        </form>
    </div>
  
</body>
</html>