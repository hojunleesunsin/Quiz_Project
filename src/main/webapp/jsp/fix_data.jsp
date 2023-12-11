<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>

<%@page import="java.util.*"%>	
<!DOCTYPE html>
<html>
<%
	request.setCharacterEncoding("euc-kr");
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String mail = request.getParameter("mail");
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	 
	   try {
	      Context init = new InitialContext();
	      DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	      conn = ds.getConnection();
	/* 원하는 아이디의 정보만 불러온다 */
	      String sql = "UPDATE INFO SET pass=?, mail=? WHERE id=?";
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, pass);
	      pstmt.setString(2, mail);
	      pstmt.setString(3, id);
	      pstmt.executeUpdate();
	      
	      pstmt.close();
	      conn.close();
	   } catch (SQLException e) {
	      e.printStackTrace();
	   }
%>
<h2>회원 정보 수정완료!</h2>
<a href="quiz_info.jsp">홈으로</a>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


</body>
</html>