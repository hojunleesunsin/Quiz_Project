<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<%
	request.setCharacterEncoding("euc-kr");
    String id = null;/*  아이디를 널값으로 초기화*/
    
    if(session.getAttribute("id") != null){ /*아이디가 있으면  */ 
        id = (String) session.getAttribute("id"); /* 널값으로 초기화된 아이디에 값을 넣음 */
    }else{/* 세션에 아이디가 없으면  로그인 페이지로 이동*/
    out.println("<script>");
    out.println("location.href='../login.jsp'");
    out.println("</script>");
    }
    
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    try { //데이터 베이스에 연결
        Context init = new InitialContext();
        DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
        conn = ds.getConnection();
   
        String sql = "select * from info where id=?"; //id에 대한 정보를 모두 출력
        stmt = conn.prepareStatement(sql); //sql문 출력
        stmt.setString(1, id);
        rs = stmt.executeQuery();
        rs.next();
   
     } catch (Exception e) {
        e.printStackTrace();
     }
%>
<meta charset="EUC-KR">
<title>마즐래 마출래</title>
<link rel="stylesheet" href="../css/addrbook.css">
<style>
	*{font-family: 'Gugi', cursive;}
	body{margin:0;padding:0; height:100%;
   background-image:url("../images/bgimg.jpg"); background-size: cover;}
	img {width: 100px; height: 60px}
	.quiz_content{position: absolute;
					top: 50%;
					left: 50%;
					width: auto;
					height: 800px;
					transform: translate(-50%, -50%);}
	.select_quiz{width: auto;
					height: 360px;
					padding-left: 20px;
					padding-top: 20px;}
</style>
</head>
<body>

<div class="header">
	<div class="title"><a href="quiz_info.jsp">마즐래<br>&nbsp;&nbsp;마출래</a></div>
	<div class="rank"><%=rs.getString("name") %></div>
	
    <div style="float:right"><a href="logOut.jsp">로그아웃</a></div>
	<div style="float:right"><h3 style="color: blue"><%=id%>님이 로그인하셨습니다.</h3></div><br>
	<div style="float:rightbottom"><% 
    if(id.equals("admin")){ /*로그인 후 아이디가 admin 이면 관리자 모드로 실행  */
    %> 
    <a href = "admin-total.jsp">관리자모드</a>
    <%
    }else{
    %><!-- 아이디가 유저면 그냥 자기 것만 건들수 있도록 만듬 -->
    <a href="my_info.jsp?id=<%=id%>">내 정보 보기</a>
    <a href="fix.jsp?id=<%=id%>">내 정보 수정</a>
    <%
    }
    %></div>
</div>
<div align="center" style="margin-top: 10%;">
<table border="1" >
	<tr>
	<th colspan = 2>
	Quiz
	</th>
	</tr>
    <tr>
    <td><div><a href="OX_quiz.jsp">
    <img src = "../images/OXQUIZ.png"/><br>ox 퀴즈
</a></div></td> 
    <td><div><a href="nonsense_quiz.jsp">
    <img src = "../images/nonsense.png"/><br>넌센스
</a></div></td>
    </tr>
    <tr>
    <td><div><a href="lotto.jsp">
    <img src = "../images/lotto.png"/><br>로또 뽑기
</a></div></td> 
    <td><div><a href="clean_test.jsp">
    <img src = "../images/clean.png"/><br> 청결도 테스트
</a></div></td>
    </tr>
    <tr>
    <td><div><a href="language_quiz.jsp">
    <img src = "../images/language.png"/><br>문해력 퀴즈
</a></div></td>
    <td><div><a href="New_word_quiz.jsp">
    <img src = "../images/neword.png"/><br>신조어 퀴즈
</a></div></td>
    </tr>
    <tr>
    <td colspan = 2><div><a href="Coming_soon.jsp">
    <img src = "../images/Coming_soon.png"/><br>
</a></div></td>
    </tr>
</table>
</div>
</body>
</html>