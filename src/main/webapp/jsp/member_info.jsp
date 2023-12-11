<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html>
<html>
<%/* ���� ������ ȸ���� ������ �����ִ�. */
   String id = null;
   if ((session.getAttribute("id") == null) || (!((String) session.getAttribute("id")).equals("admin"))) {
      out.println("<script>");
      out.println("location.href='../login.jsp'");
      out.println("</script>");
   }
 
   String info_id = request.getParameter("id");
 
   Connection conn = null;
   PreparedStatement stmt = null;
   ResultSet rs = null;
 
   try {
      Context init = new InitialContext();
      DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
      conn = ds.getConnection();
 
      String sql = "select * from info where id=?";
      stmt = conn.prepareStatement(sql);
      stmt.setString(1, info_id);
      rs = stmt.executeQuery();
      rs.next();
 
   } catch (Exception e) {
      e.printStackTrace();
   }
%>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/addrbook.css">
</head>
<body>
	<div class="header">
		<div class="title"><a href="quiz_info.jsp">����<br>&nbsp;&nbsp;���ⷡ</a></div>
	</div>

	<div class="option user_info">
			<h2 class="option info_h2">user_info</h2>
			<dl class="option info_border">
				<dt class="option info_dt">
					<label>���̵�</label>
				</dt>
				<dd class="option info_dd">
					<p><%=rs.getString("id")%></p>
				</dd>
				<dt class="option info_dt">
					<label>��й�ȣ</label>
				</dt>
				<dd class="option info_dd">
					<p><%=rs.getString("pass")%></p>
				</dd>
				<dt class="option info_dt">
					<label>�̸���</label>
				</dt>
				<dd class="option info_dd">
					<p><%=rs.getString("mail")%></p>
				</dd>
				<dt class="option info_dt">
					<label>�ֹε�Ϲ�ȣ</label>
				</dt>
				<dd class="option info_dd">
					<p><%=rs.getString("pnum")%> - <%=rs.getString("nnum")%></p>
				</dd>
				<dt class="option info_dt">
					<label>����</label>
				</dt>
				<dd class="option info_dd">
					<p><%=rs.getString("year")%>�� <%=rs.getString("mon")%>�� <%=rs.getString("day")%>��</p>
				</dd>
			</dl>
		</div>
</body>
</html>