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
    String id = null;/*  ���̵� �ΰ����� �ʱ�ȭ*/
    
    if(session.getAttribute("id") != null){ /*���̵� ������  */ 
        id = (String) session.getAttribute("id"); /* �ΰ����� �ʱ�ȭ�� ���̵� ���� ���� */
    }else{/* ���ǿ� ���̵� ������  �α��� �������� �̵�*/
    out.println("<script>");
    out.println("location.href='../login.jsp'");
    out.println("</script>");
    }
    
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    try { //������ ���̽��� ����
        Context init = new InitialContext();
        DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
        conn = ds.getConnection();
   
        String sql = "select * from info where id=?"; //id�� ���� ������ ��� ���
        stmt = conn.prepareStatement(sql); //sql�� ���
        stmt.setString(1, id);
        rs = stmt.executeQuery();
        rs.next();
   
     } catch (Exception e) {
        e.printStackTrace();
     }
%>
<meta charset="EUC-KR">
<title>���� ���ⷡ</title>
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
	<div class="title"><a href="quiz_info.jsp">����<br>&nbsp;&nbsp;���ⷡ</a></div>
	<div class="rank"><%=rs.getString("name") %></div>
	
    <div style="float:right"><a href="logOut.jsp">�α׾ƿ�</a></div>
	<div style="float:right"><h3 style="color: blue"><%=id%>���� �α����ϼ̽��ϴ�.</h3></div><br>
	<div style="float:rightbottom"><% 
    if(id.equals("admin")){ /*�α��� �� ���̵� admin �̸� ������ ���� ����  */
    %> 
    <a href = "admin-total.jsp">�����ڸ��</a>
    <%
    }else{
    %><!-- ���̵� ������ �׳� �ڱ� �͸� �ǵ�� �ֵ��� ���� -->
    <a href="my_info.jsp?id=<%=id%>">�� ���� ����</a>
    <a href="fix.jsp?id=<%=id%>">�� ���� ����</a>
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
    <img src = "../images/OXQUIZ.png"/><br>ox ����
</a></div></td> 
    <td><div><a href="nonsense_quiz.jsp">
    <img src = "../images/nonsense.png"/><br>�ͼ���
</a></div></td>
    </tr>
    <tr>
    <td><div><a href="lotto.jsp">
    <img src = "../images/lotto.png"/><br>�ζ� �̱�
</a></div></td> 
    <td><div><a href="clean_test.jsp">
    <img src = "../images/clean.png"/><br> û�ᵵ �׽�Ʈ
</a></div></td>
    </tr>
    <tr>
    <td><div><a href="language_quiz.jsp">
    <img src = "../images/language.png"/><br>���ط� ����
</a></div></td>
    <td><div><a href="New_word_quiz.jsp">
    <img src = "../images/neword.png"/><br>������ ����
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