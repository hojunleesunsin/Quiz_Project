<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html>
<html>
<%
   String id = null;
   request.setCharacterEncoding("euc-kr");
 
   String info_id = request.getParameter("id"); //id�� �޾ƿ�
 
   Connection conn = null;
   PreparedStatement stmt = null;
   ResultSet rs = null;
 
   try { //������ ���̽��� ����
      Context init = new InitialContext();
      DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
      conn = ds.getConnection();
 
      String sql = "select * from info where id=?"; //id�� ���� ������ ��� ���
      stmt = conn.prepareStatement(sql); //sql�� ���
      stmt.setString(1, info_id);
      rs = stmt.executeQuery();
      rs.next();
 
   } catch (Exception e) {
      e.printStackTrace();
   }
%>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<meta charset="EUC-KR">
<title>���� ���ⷡ</title>
<link rel="stylesheet" href="../css/addrbook.css">
<body>
	<div class="header">
		<div class="title"><a href="quiz_info.jsp">����<br>&nbsp;&nbsp;���ⷡ</a></div>
		<div class="rank"><%=rs.getString("name") %></div>
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