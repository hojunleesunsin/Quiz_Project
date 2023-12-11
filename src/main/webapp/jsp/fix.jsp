<%@ page language="java" contentType="text/html; charset=euc-kr"
   pageEncoding="euc-kr"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language="javascript"
   src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script>
   function checks() {
      var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
      var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
      var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //���� ����
 
      //��й�ȣ ��ȿ���˻�
      if (!getCheck.test($("#password").val())) {
         alert("���Ŀ� �°� �Է����ּ���");
         $("#password").val("");
         $("#password").focus();
         return false;
      }
 
      //��й�ȣ Ȯ�ζ� ���� Ȯ��
      if ($("#password_check").val() == "") {
         alert("�н����� Ȯ�ζ��� �Է����ּ���");
         $("#password_check").focus();
         return false;
      }
 
      //��й�ȣ ����Ȯ��
      if ($("#password").val() != $("#password_check").val()) {
         alert("��й�ȣ�� �����մϴ�");
         $("#password").val("");
         $("#password_check").val("");
         $("#password").focus();
         return false;
      }
 
      //�̸��� ���� Ȯ��
      if ($("#mail").val() == "") {
         alert("�̸����� �Է����ּ���");
         $("#mail").focus();
         return false;
      }
 
      //�̸��� ��ȿ�� �˻�
      if (!getMail.test($("#mail").val())) {
         alert("�̸������Ŀ� �°� �Է����ּ���")
         $("#mail").val("");
         $("#mail").focus();
         return false;
      }
      return true;
   }
</script>
<%
   String id = request.getParameter("id");
   request.setCharacterEncoding("euc-kr");
 
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
 
   try {
      Context init = new InitialContext();
      DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
      conn = ds.getConnection();
/* ���ϴ� ���̵��� ������ �ҷ��´� */
      String sql = "select * from info where id=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      rs = pstmt.executeQuery();
      rs.next();
 
   } catch (Exception e) {
      e.printStackTrace();
   }
   
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>���� ���� ����</title>
</head>
<body>
   <form action="fix_data.jsp" name="fix" method="post" onsubmit="return checks()">
      <table border="1" bordercolor="grey" align="center">
         <tr>
            <td colspan="2" bgcolor="lightblue" align="center">ȸ�� �⺻ ����</td>
         </tr>
         <tr>
            <td bgcolor="lightgrey" align="center">���̵�<input type="hidden" name="id" id="id" value="<%=rs.getString("id") %>"></td>
            <td><%=rs.getString("id")%></td>
         </tr>
         <tr>
            <td bgcolor="lightgrey" align="center">��й�ȣ</td>
            <td><input size="15" type="password" name="pass"
               id="password"> 4~12���� ���� ��ҹ��ڿ� ���ڷθ� �Է�</td>
         </tr>
         <tr>
            <td bgcolor="lightgrey" align="center">��й�ȣ Ȯ��</td>
            <td><input size="15" type="password" name="password_check"
               id="password_check"></td>
         </tr>
         <tr>
            <td bgcolor="lightgrey" align="center">���� �ּ�</td>
            <td><input type="text" name="mail" id="mail"> ��)
               id@domain.com</td>
         </tr>
         <tr>
            <td bgcolor="lightgrey" align="center">�̸�</td>
            <td><%=rs.getString("name")%></td>
         </tr>
         <tr>
            <td colspan="2" bgcolor="lightblue" align="center">���� �Ż� ����</td>
         </tr>
         <tr>
            <td bgcolor="lightgrey" align="center">�ֹε�Ϲ�ȣ</td>
            <td><%=rs.getString("pnum")%> - <%=rs.getString("nnum")%>
            </td>
         </tr>
         <tr>
            <td align="center" bgcolor="lightgrey"><b>����</b></td>
            <td><%=rs.getString("year")%>�� <%=rs.getString("mon")%>�� <%=rs.getString("day")%>��
            </td>
         </tr>
         <tr>
            <td colspan="2" align="center"><input type="submit" value="�����Ϸ�"></td>
      </table>
   </form>
</body>
</html>
