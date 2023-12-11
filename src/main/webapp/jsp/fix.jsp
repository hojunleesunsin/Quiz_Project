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
      var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정
 
      //비밀번호 유효성검사
      if (!getCheck.test($("#password").val())) {
         alert("형식에 맞게 입력해주세요");
         $("#password").val("");
         $("#password").focus();
         return false;
      }
 
      //비밀번호 확인란 공백 확인
      if ($("#password_check").val() == "") {
         alert("패스워드 확인란을 입력해주세요");
         $("#password_check").focus();
         return false;
      }
 
      //비밀번호 서로확인
      if ($("#password").val() != $("#password_check").val()) {
         alert("비밀번호가 상이합니다");
         $("#password").val("");
         $("#password_check").val("");
         $("#password").focus();
         return false;
      }
 
      //이메일 공백 확인
      if ($("#mail").val() == "") {
         alert("이메일을 입력해주세요");
         $("#mail").focus();
         return false;
      }
 
      //이메일 유효성 검사
      if (!getMail.test($("#mail").val())) {
         alert("이메일형식에 맞게 입력해주세요")
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
/* 원하는 아이디의 정보만 불러온다 */
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
<title>개인 정보 수정</title>
</head>
<body>
   <form action="fix_data.jsp" name="fix" method="post" onsubmit="return checks()">
      <table border="1" bordercolor="grey" align="center">
         <tr>
            <td colspan="2" bgcolor="lightblue" align="center">회원 기본 정보</td>
         </tr>
         <tr>
            <td bgcolor="lightgrey" align="center">아이디<input type="hidden" name="id" id="id" value="<%=rs.getString("id") %>"></td>
            <td><%=rs.getString("id")%></td>
         </tr>
         <tr>
            <td bgcolor="lightgrey" align="center">비밀번호</td>
            <td><input size="15" type="password" name="pass"
               id="password"> 4~12자의 영문 대소문자와 숫자로만 입력</td>
         </tr>
         <tr>
            <td bgcolor="lightgrey" align="center">비밀번호 확인</td>
            <td><input size="15" type="password" name="password_check"
               id="password_check"></td>
         </tr>
         <tr>
            <td bgcolor="lightgrey" align="center">메일 주소</td>
            <td><input type="text" name="mail" id="mail"> 예)
               id@domain.com</td>
         </tr>
         <tr>
            <td bgcolor="lightgrey" align="center">이름</td>
            <td><%=rs.getString("name")%></td>
         </tr>
         <tr>
            <td colspan="2" bgcolor="lightblue" align="center">개인 신상 정보</td>
         </tr>
         <tr>
            <td bgcolor="lightgrey" align="center">주민등록번호</td>
            <td><%=rs.getString("pnum")%> - <%=rs.getString("nnum")%>
            </td>
         </tr>
         <tr>
            <td align="center" bgcolor="lightgrey"><b>생일</b></td>
            <td><%=rs.getString("year")%>년 <%=rs.getString("mon")%>월 <%=rs.getString("day")%>일
            </td>
         </tr>
         <tr>
            <td colspan="2" align="center"><input type="submit" value="수정완료"></td>
      </table>
   </form>
</body>
</html>
