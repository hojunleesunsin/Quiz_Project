<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html>
<html>
<%
   //String id = null;    /* ������ ���̵� �ΰ��� �ų� �����ڰ� �ƴϸ� �α��� ȭ������ */
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
/* ��� ���� */
      String sql = "select * from info";    /*info���̺��� ȣ���Ѵ�  */
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
	<div class="title"><a href="quiz_info.jsp">����<br>&nbsp;&nbsp;���ⷡ</a></div>
	<div style="float:right"><a href="logOut.jsp">�α׾ƿ�</a></div>
</div>
<div class="section" align="center">
   <table>
      <tr>
         <td colspan="2">ȸ�� ���</td>
      </tr>
      <%
         while (rs.next()) {
      %>
      <tr><!-- ȸ���� ���̵� Ŭ���ϸ� ��� ������ �̵� ������ �����ִ�. -->
         <td><a href="member_info.jsp?id=<%=rs.getString("id")%>" style="color: #5b5b5b"> <%=rs.getString("id")%></a></td>
         <td><a href="delete.jsp?id=<%=rs.getString("id")%>" style="color: red">����</a></td><!-- ���̵� ���� -->
      </tr>
      <%
         }
      %>
   </table>
</div>
</body>
</html>