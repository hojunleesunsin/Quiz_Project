<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "java.sql.*" %>
    <%@ page import="javax.sql.*"%>
    <%@ page import="javax.naming.*"%>
    <%@page import="java.util.*"%>
    
 <%
    String id = request.getParameter("id");        // �α��� ���������� ���̵�, ��й�ȣ ������ �޾ƿ´� 
     String pw = request.getParameter("pw");
 
     
     Connection conn = null; //���� �����Ҷ�
     PreparedStatement stmt = null;// ��� �� �ѱ涧 
     ResultSet rs = null;//��� �� �ҷ��ö�
     
     try{//���� �����Ѵ�.  
         Context init = new InitialContext();
         DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
         conn = ds.getConnection();
         
         
         String sql = "SELECT * FROM INFO WHERE ID=?"; // ������ 
         stmt = conn.prepareStatement(sql); //conn���� �����ѵ� , statement�� ���� �ѱ��,�������� �����Ѵ�.  
         stmt.setString(1,id);//�������� 1��° ?�� �Է� �� �� id�� ����.  
         rs = stmt.executeQuery();//execute(�����Ѵ�)Query�� 
         
         if(rs.next()){ // ResultSet 
             if(pw.equals(rs.getString("pass"))){ //���� ģ �н������ ���̺� �н����� �� �� ������ 
                 session.setAttribute("id", id); //   
                 out.println("<script>");
                 out.println("alert('�α��� ����!')");
                 out.println("location.href='quiz_info.jsp'"); // admin���� �ѱ� 
                 out.println("</script>");
             }
         }
         
         out.println("<script>");
         out.println("alert('���̵�� �н����带 Ȯ�����ּ���!')");
                 out.println("location.href='../login.jsp'");// �ٸ��� �α������� �ѱ� , ����ó��.
                         out.println("</script>");
     }catch(Exception e){
         e.printStackTrace();
     }finally{
         try{// ���� �ݰ� �� 
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
