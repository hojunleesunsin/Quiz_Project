<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center">
	<h3>* ���̵� �ߺ�Ȯ�� *</h3>
    <form method="post" action="idCheckProc.jsp" onsubmit="return blankCheck(this)">
    ���̵� : <input type="text" name="id" maxlength="10" autofocus>
    <input type="submit" value="�ߺ�Ȯ��">
    </form>
    </div>
    
    <script>
    function blankCheck(f){
    	var id=f.id.value;
        id=id.trim();
        if(id.length<4){
        	alert("���̵�� 4�� �̻� �Է����ֽʽÿ�.");
            return false;
        }//if end
        return true;
    }//blankCheck() end
    </script>
</body>
</html>