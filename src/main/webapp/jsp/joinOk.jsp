<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
   
<%@page import="java.util.*"%>

<%
/* 한글 깨짐방지 */ 
    request.setCharacterEncoding("euc-kr");
%>

    <%
    Connection conn =null;
    
    try{
 
         Context init = new InitialContext();
         DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
         conn = ds.getConnection();
         out.println("<h3>연결되었습니다</h3>");
        
    } catch (Exception e) {
        out.println("<h3>연결에 실패하였습니다</h3>");
        e.printStackTrace();
     } /* 데이터베이스와연결 */
  try{ /* 회원가입에 기입했던 내용들의 값을 받아옴 */
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
        /* 쿼리문, 값을 넣을 칼럼을 적고 ?를 넣어준다ㅣ */
        PreparedStatement pstmt=conn.prepareStatement(sql);
        /* 쿼리문 실행  , 앞에 적힌 번호에따라 ?위치에 맞게 들어간다.*/
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
	  out.println("<h3>연결실패</h3>");
	  e.printStackTrace();
  }
  /* 회원가입끝나면 로그인 페이지로 이동 */
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