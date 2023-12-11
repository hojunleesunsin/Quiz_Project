<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@page import="java.util.*"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
	<h3>* 아이디 중복 확인 결과 *</h3>
	</div>
<%
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	boolean result=false;
	
	try{
		Context init = new InitialContext();
	    DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	    conn = ds.getConnection();
	    
	    String sql = "select * from info where id=?";
	    
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1,id);
	    rs=pstmt.executeQuery();
	    if(rs.next()){
	    	result=true;
	    }
	}catch(SQLException e){
		System.out.println(e.getMessage());
	}finally{
		rs.close();
		pstmt.close();	
		conn.close();
	}
	
%>
<%    
	if(result) { %>
	<div align=center>
	<br><br>
	<h4>이미 사용중인 ID 입니다.</h4>
	</div>
	<%} else { %>
	<div align=center>
	<br><br>
	<h4>입력하신 <%=id %>는 사용하실수 있는 ID입니다.</h4>
	</div>
<% } %>
</body>
</html>