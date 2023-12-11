<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html>
<html>
<%
   String id = null;
 
   if ((session.getAttribute("id") == null) || (!((String) session.getAttribute("id")).equals("admin"))) {
      out.println("<script>");
      out.println("location.href='login.jsp'");
      out.println("</script>");
   }
 
   String delete_id = request.getParameter("id");
    /* 삭제하기로한 아이디 값을 가지고온다. */
   Connection conn = null;
   PreparedStatement stmt = null;
   ResultSet rs = null;
 
   try {
      Context init = new InitialContext();
      DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
      conn = ds.getConnection();
    /* 아이디를 삭제한다. */
      String sql = "delete from info where id=?";
      stmt = conn.prepareStatement(sql);
      stmt.setString(1, delete_id);
      stmt.executeQuery();
 
      out.println("<script>");
      out.println("location.href='admin-total.jsp'");    /* "삭제에 실패하면 어드민 토탈로 다시간다" */
      out.println("</script>");
      
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      try {
         stmt.close();
         conn.close();
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
%>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>