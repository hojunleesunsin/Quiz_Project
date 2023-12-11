<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html>
<html>
<%
   //String id = null;    /* 세션의 아이디가 널값이 거나 관리자가 아니면 로그인 화면으로 */
   if ((session.getAttribute("id") == null) || (!((String) session.getAttribute("id")).equals("admin"))) {
      out.println("<script>");
      out.println("location.href='../login.jsp'");
      out.println("</script>");
   }
 
   Connection conn = null;
   PreparedStatement stmt = null;
   ResultSet rs = null;
 
   try {
      Context init = new InitialContext();
      DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
      conn = ds.getConnection();
/* 디비 연결 */
      String sql = "select * from info";    /*info테이블을 호출한다  */
      stmt = conn.prepareStatement(sql);
      rs = stmt.executeQuery();
   } catch (Exception e) {
      e.printStackTrace();
   }
%>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
*{font-family: 'Gugi', cursive;}
</style>
<link rel="stylesheet" href="../css/login.css">
</head>
<body>
<div class="header">
	<div class="title"><a href="quiz_info.jsp">마즐래<br>&nbsp;&nbsp;마출래</a></div>
	<div style="float:right"><a href="logOut.jsp">로그아웃</a></div>
</div>
<div class="section" align="center">
   <table>
      <tr>
         <td colspan="2">회원 목록</td>
      </tr>
      <%
         while (rs.next()) {
      %>
      <tr><!-- 회원의 아이디를 클릭하면 멤버 인포로 이동 정보를 볼수있다. -->
         <td><a href="member_info.jsp?id=<%=rs.getString("id")%>" style="color: #5b5b5b"> <%=rs.getString("id")%></a></td>
         <td><a href="delete.jsp?id=<%=rs.getString("id")%>" style="color: red">삭제</a></td><!-- 아이디 삭제 -->
      </tr>
      <%
         }
      %>
   </table>
</div>
</body>
</html>