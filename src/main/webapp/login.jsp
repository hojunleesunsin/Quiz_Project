<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α��� ��</title>
<style>
*{font-family: 'Gugi', cursive;}
</style>
<link rel="stylesheet" href="login.css">
</head>
<body>
<div class="header">
	<div class="title"><a href="main_page.html">����<br>&nbsp;&nbsp;���ⷡ</a></div>
</div>
<form action="jsp/loginOk.jsp" name ="login" method="post"> <!-- ���̵�, ��й�ȣ������ �α���OK�� �����ų� ȸ���������� �̵� -->
<div align = "center" class="section">
<table border="1">
	<tr>
	<th colspan = 2> �α���</th>
	</tr>
    <tr>
     
    <td colspan = 2><input type="text" name="id" id="id" placeholder = "���̵�" style="width:340px; height:20px"></td>
    </tr>
    <tr>
    <td colspan = 2><input type="password" name="pw" id="pw" placeholder = "��й�ȣ" style="width:340px; height:20px"></td>
    </tr>
    <tr>
    <td colspan = 2><input type="submit" value="�α���" style="width:340px; height:40px;"></td>
    
    </tr>
</table>
<a href="join.jsp" style="float: right; position: relative;">ȸ������</a>
</div>

</form>
</body>
</html>
