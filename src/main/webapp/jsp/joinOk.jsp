<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
   
<%@page import="java.util.*"%>

<%
/* �ѱ� �������� */ 
    request.setCharacterEncoding("euc-kr");
%>

    <%
    Connection conn =null;
    
    try{
 
         Context init = new InitialContext();
         DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
         conn = ds.getConnection();
         out.println("<h3>����Ǿ����ϴ�</h3>");
        
    } catch (Exception e) {
        out.println("<h3>���ῡ �����Ͽ����ϴ�</h3>");
        e.printStackTrace();
     } /* �����ͺ��̽��Ϳ��� */
  try{ /* ȸ�����Կ� �����ߴ� ������� ���� �޾ƿ� */
        String id = request.getParameter("ide");
        String pass = request.getParameter("pass");
        String mail = request.getParameter("mail");
        String name = request.getParameter("name");
        String pnum = request.getParameter("pnum");
        String nnum = request.getParameter("my_name");
        String year = request.getParameter("year");
        String mon = request.getParameter("mon");
        String day = request.getParameter("day");
        
        /* String sql = "insert into login(id,pass,mail,name ,pnum,my_name,year,mon,day,hobby,intro) values(?,?,?,?,?,?,?,?,?,?,?)"; */
        String sql = "insert into info(id,pass,mail,name,pnum,nnum,year,mon,day) values(?,?,?,?,?,?,?,?,?)";
        /* ������, ���� ���� Į���� ���� ?�� �־��ش٤� */
        PreparedStatement pstmt=conn.prepareStatement(sql);
        /* ������ ����  , �տ� ���� ��ȣ������ ?��ġ�� �°� ����.*/
        pstmt.setString(1,id);
        pstmt.setString(2,pass);
        pstmt.setString(3,mail);
        pstmt.setString(4,name);
        pstmt.setString(5,pnum);
        pstmt.setString(6,nnum);
        pstmt.setString(7,year);
        pstmt.setString(8,mon);
        pstmt.setString(9,day);
        
        pstmt.executeUpdate();
        
        pstmt.close();
        conn.close();
  }catch(Exception e){
	  out.println("<h3>�������</h3>");
	  e.printStackTrace();
  }
  /* ȸ�����Գ����� �α��� �������� �̵� */
  response.sendRedirect("../login.jsp");
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>