<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.*"%>
<%
 
    request.setCharacterEncoding("euc-kr");
 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script language="javascript">
	function idCheck(){
		  //��â �����
		  window.open("jsp/idCheckForm.jsp", "idwin", "width=400, height=350");
		}
	 function checked()
	    {    //id���� �����Ѵ�
	        var idtext = document.getElementById("ide");
	            //���̵��� id��
	            var patext = document.getElementById("pass");
	            //��й�ȣ�� id��
	            var cpatext = document.getElementById("cpass");
	           //��й�ȣȮ���� id��
	            var mtext = document.getElementById("mail");
	           //e-mail�� id��
	            var nametext = document.getElementById("name");
	           //�̸��� id��
	           
	    var id = idtext.value;//id��� ������ ���̵� �ڽ����� ������ ���� �����Ѵ�.
        var password = patext.value;//��й�ȣ �ڽ��� ������ ���� ����
        var cpassword = cpatext.value;
        var mail = mtext.value;
        var name = nametext.value;
        
        var regExp1 = /^[a-zA-Z0-9]{4,12}$/;//��ȿ�� �˻� ���Խ�ǥ����
        //|| /(����ǥ������ ����,��) ^(�������) [](����) �ҹ���a-z�빮��A-Z����0-9�� ���� ,�ּ� 4,�ִ� 12�� ���� ����Ѵ�.
        //���̵� ��й�ȣ ��ȿ�� �˻�
        var regExp2 = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;
        //�̸��� ��ȿ���˻�
        var regname = /^[��-��]{2,}$/;
        //�̸� ��ȿ�� �˻�
        
        
        if(!regExp1.test(id))
             //���̵� ��ȿ�� �˻� �� 4~12���� ���� ��ҹ��ڿ� ������ ��ȿ���� �� �´ٸ�
             //������ �ְ� �˶��� ����.
             //�ؿ� ������ ��ȿ�� �˻�
            {
                alert("���Ŀ� ���� ID�� �Է��ϼ���");
                idtext.value = "";
                idtext.focus();
                return false;
            }
        else if(!regExp1.test(password))
        {
            alert("���Ŀ� ���� ��й�ȣ�� �Է��ض�");
            patext.value="";
            patext.focus();
            return false;
        }
        else if(!(cpassword.slice(0,cpassword.length) === password.slice(0,password.length)))//slice�Լ��� �迭������ �迭�� ��� ����,���ϴ� ���� ������ ���ڸ� ��ȯ�Ѵ�cpqssword�迭�� 0��°���� �迭 ���̸�ŭ���ִ� ���ڿ��� ��ȯ�ϰڴ� �̾߱� "==="�� Ÿ�Ա��� ���ؼ� ������ Ʈ� ��ȯ�Ѵ�. �׷��ϱ� ��������� ������ ������ ���ڿ��̸� 
            {//��й�ȣ�� ������ Ȯ���Ѵ�. ��ȿ�� �˻� ��� ��������
                alert("��й�ȣ�� �������� �ʽ��ϴ�.");
                cpatext.value = "";
                cpatext.focus();
                return false;
            }
        else if((cpassword.slice(0,cpassword.length) === id.slice(0,id.length)))
        {//��й�ȣ���� ���ؼ� Ʈ�簡������ �Ϸο´� ���̵��� ���ڿ��� ��й�ȣ�� ���Ѵ�.    ��ȿ�� �˻� ��� ��������
            alert("��й�ȣ�� ID�� ������ �ȵ�");
            patext.value="";
            patext.focus();
            cpatext.value="";
            cpatext.focus();
            return false;
            //��ȿ�� �˻縦 ������ϸ� ��й�ȣ,���Ȯ�α��� �ʱ�ȭ��Ų��. 
        }
        else if(!regExp2.test(mail))
        {
            alert("����ε� ������ �ƴմϴ�.");
            mtext.value="";
            mtext.focus();
            return false;
        }
        else if(!regname.test(name))
        {
            alert("�̸� �ȹٷ� ���");
            nametext.value= "";
            nametext.focus();
            return false;
        }
        else
        {
        	if(true)
        	{
             alert("ȸ�������� �����մϴ�.");
                return true;
            }
            else
            {//���������� ������
                return false;
            }
        }

    }
	 
	 /* function check_jumin() {
         var jumin = document.getElementById('pnum').value +document.getElementById('nnum').value;
         //jumin ������ �ֹι�ȣ ���ڸ�(pnum)+���ڸ�(nnum) �� �־��ش�.
         var fmt = /^\d{6}[1234]\d{6}$/;
         //"\d"<<����, {6}<<���� []<<����,\d{6}
         //����6��,���� [1234]�� �ٽ� ���� 6�� ��ȿ���˻�
         //�ֹ� �� 6�ڸ�, �� 7�ڸ��� ���Ѵ�. "-"ǥ�ð� ������ �������� Ȯ���Ұ�
                 
         if(!fmt.test(jumin)){//fmt�� jumin�� �˻��Ҷ� �����̸�
             //�ߵ�
             return false;
         }
         var birthYear = (jumin.charAt(6) <= "2") ? "19" : "20";
         //���׿����� �ֹ� ����ù��°�ڸ��� 2���� ũ�ų� ������ 
         //�� ���̸� 19�� �����̸� 20�� birthYear�� �ִ´�.
         birthYear += jumin.substr(0,2);//����
         //substr(int,int)<<���� �ε��� ���� ��� ���ڸ� ����Ѵ�. 
         //���ڸ� �ڸ��� �Լ��̰�� 0������ 2���� ���ڿ��� ������´�.
         var birthMonth = jumin.substr(2,2)-1;//��
         var birthDate = jumin.substr(4,2);//��
         var birth = new Date(birthYear,birthMonth,birthDate);
         //��������� ���� �ڸ������迭�� �־���.

         if(birth.getYear() % 100 != jumin.substr(0,2) ||
             birth.getMonth() != birthMonth ||
             birth.getDate() != birthDate) {
             return false;
         } */
             /*//DATA.getYear()<<�� ������ �⵵�� ���Ѵ�. 
             //���� �⵵���� 100�� ���� ������ ���� �ֹ��� �ε��� 0���� 2��°�ڸ� �� �Է��� ����� �⵵�� �ٸ��� ?
             �ֹι�ȣ ��ȿ���˻�� ������ �ڵ����� �Է��ϴ� ��*/
         

         /* var buf = new Array(13);
         for (var i = 0; i <13; i++) 
         buf[i] = parseInt(jumin.charAt(i));//parseInt<<���ڸ� ������ �ٲ���
         //���⼭���� �Է¹��� �ֹι�ȣ�� ������ �ٲ۵� ��ȿ�� �˻縦 �����Ѵ�.
         multipliers = [2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5];
         for(var sum = 0, i=0; i<12;i++)
             sum +=(buf[i] *= multipliers[i]);
         if ((11 - (sum % 11)) % 10 != buf[12]) {
             return false;
         }
         return true;
     }
             
         function checks() {
             if (check_jumin()) {
                 alert("�ùٸ� �ֹι�ȣ");
                 var year1 = document.getElementById("year");

                 var num1 = document.getElementById('pnum');
                 var num2 = num1.value;
                 var num3 = num2.substring(0,2);//�ֹι�ȣ���� ��������� ��Ʈ������ ����
                 var num4 = num2.substring(3,4);
                 var num5 = num2.substring(4,6);
           
                 year1.value = "19" + num3;

                 document.data.mon.value = num4;
                 document.data.day.value = num5;
                 return true;

             }
             else
                 var num1 = document.getElementById('pnum');
                 var num2 = document.getElementById('nnum');
                 alert("�ȹٷν��");
                 num1.value = "";
                 num1.focus();
                 num2.value = "";

                 return false;
         } */

</script>
</head>
<body>
<form action="jsp/joinOk.jsp"  method="post" name="data" onsubmit= "return checked()">
 
<!-- ���̺� ����-->
    <table name= "data" style="border-collapse:collapse; border:1px gray solid; width ="700" height="230" border="1" align="center">
    <!-- ù��  -->    
        <tr>
            <td colspan="2" align = "center" bjcolor="33ffcc" bgcolor="33ffcc">ȸ�� �⺻ ����</td> 
        </tr>
<!-- �ι�°�� ���̵�-->
        <tr>
        	<td align="center" bgcolor="D5D5D5">���̵�</td>
        	<td><input type="text" name="ide" id="ide" size=" 20" maxlength="12"/>
        		<input type="button" value="ID�ߺ�Ȯ��" onclick="idCheck()"/>
        		4~12���� ���� ��ҹ��ڿ� ���ڷθ� �Է�  </td>
        </tr>
<!-- ����° ��й�ȣ -->
        <tr>
            <td align="center" bgcolor="D5D5D5">��й�ȣ</td>
            <td><input type="password" id="pass" name="pass" size="20" maxlength="12">4~12���� ���� ��ҹ��ڿ� ���ڷθ� �Է� </td>
        </tr>
<!-- �׹�° ��й�ȣ Ȯ�� -->
        <tr>
            <td align="center" bgcolor="D5D5D5">��й�ȣ Ȯ��</td>
            <td><input type="password" name="��й�ȣȮ��" id="cpass" size="20" maxlength="12"></td>
        </tr>
        <!-- �ټ���° �̸�  -->
        <tr>
            <td align="center" bgcolor="D5D5D5">�����ּ�</td>
            <td><input type="text" name="mail" id="mail" size="20" ></td>
        </tr>
        <tr>
            <td align="center" bgcolor="D5D5D5">�̸�  </td>
            <td><input type="text" name="name" id="name" size="20"></td>
        </tr> 
        <!-- ������°  -->
        <tr>
            <td colspan="2" align="center" bgcolor="33ffcc">���νŻ� ����</td>
        </tr>
        <!-- �ֹε�Ϲ�ȣ -->
        <tr>
            <td align="center" bgcolor="D5D5D5">�ֹε�Ϲ�ȣ</td>
            <td><input type="text" name="pnum" id ="pnum" size="6" maxlength="6"/> - <input type="text" id="nnum" name="my_name" size="7" maxlength="7">��)123456-1234567</td>
        </tr>
        <!-- ���� -->
        <tr>
            <td align="center" bgcolor="D5D5D5">����</td>
            <td><input type="text" name="year" size="5" maxlength="4" id="year">��
                <select name="mon" id="mon">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                </select> ��
                <select name="day" id ="day">
                    <option value="1">    1    </option>
                    <option value="2">    2    </option>
                    <option value="3">    3    </option>
                    <option value="4">    4    </option>
                    <option value="5">    5    </option>
                    <option value="6">    6    </option>
                    <option value="7">    7    </option>
                    <option value="8">    8    </option>
                    <option value="9">    9    </option>
                    <option value="10">    10    </option>
                    <option value="11">    11    </option>
                    <option value="12">    12    </option>
                    <option value="13">    13    </option>
                    <option value="14">    14    </option>
                    <option value="15">    15    </option>
                    <option value="16">    16    </option>
                    <option value="17">    17    </option>
                    <option value="18">    18    </option>
                    <option value="19">    19    </option>
                    <option value="20">    20    </option>
                    <option value="21">    21    </option>
                    <option value="22">    22    </option>
                    <option value="23">    23    </option>
                    <option value="24">    24    </option>
                    <option value="25">    25    </option>
                    <option value="26">    26    </option> 
                    <option value="27">    27    </option>
                    <option value="28">    28    </option>
                    <option value="29">    29    </option>
                    <option value="30">    30    </option>
                    <option value="31">    31    </option>
                </select>��
            </td>
            </tr>
            </table><br>
            <div align="center">
        <input type="submit" value="ȸ������">
        <input type="reset" value="�ٽ��Է�">
    </div>
    </form>
</body>
</html>