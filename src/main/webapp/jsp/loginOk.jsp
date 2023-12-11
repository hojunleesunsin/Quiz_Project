<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "java.sql.*" %>
    <%@ page import="javax.sql.*"%>
    <%@ page import="javax.naming.*"%>
    <%@page import="java.util.*"%>
    
 <%
    String id = request.getParameter("id");        // 로그인 페이지에서 아이디, 비밀번호 정보를 받아온다 
     String pw = request.getParameter("pw");
 
     
     Connection conn = null; //디비랑 연결할때
     PreparedStatement stmt = null;// 디비에 값 넘길때 
     ResultSet rs = null;//디비 값 불러올때
     
     try{//디비와 연결한다.  
         Context init = new InitialContext();
         DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
         conn = ds.getConnection();
         
         
         String sql = "SELECT * FROM INFO WHERE ID=?"; // 쿼리문 
         stmt = conn.prepareStatement(sql); //conn으로 연결한뒤 , statement로 값을 넘긴다,쿼리문을 실행한다.  
         stmt.setString(1,id);//쿼리문에 1번째 ?로 입력 될 값 id가 들어간다.  
         rs = stmt.executeQuery();//execute(실행한다)Query를 
         
         if(rs.next()){ // ResultSet 
             if(pw.equals(rs.getString("pass"))){ //내가 친 패스워드랑 테이블에 패스워드 비교 후 같으면 
                 session.setAttribute("id", id); //   
                 out.println("<script>");
                 out.println("alert('로그인 성공!')");
                 out.println("location.href='quiz_info.jsp'"); // admin으로 넘김 
                 out.println("</script>");
             }
         }
         
         out.println("<script>");
         out.println("alert('아이디와 패스워드를 확인해주세요!')");
                 out.println("location.href='../login.jsp'");// 다르면 로그인으로 넘김 , 예외처리.
                         out.println("</script>");
     }catch(Exception e){
         e.printStackTrace();
     }finally{
         try{// 전부 닫고 끝 
             rs.close();
             stmt.close();
             conn.close();
         }catch(Exception e){
             e.printStackTrace();
         }
     }
    
 
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
 
</body>
</html>
