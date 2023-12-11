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
		  //새창 만들기
		  window.open("jsp/idCheckForm.jsp", "idwin", "width=400, height=350");
		}
	 function checked()
	    {    //id값을 연결한다
	        var idtext = document.getElementById("ide");
	            //아이디의 id값
	            var patext = document.getElementById("pass");
	            //비밀번호의 id값
	            var cpatext = document.getElementById("cpass");
	           //비밀번호확인의 id값
	            var mtext = document.getElementById("mail");
	           //e-mail의 id값
	            var nametext = document.getElementById("name");
	           //이름의 id값
	           
	    var id = idtext.value;//id라는 변수에 아이디 박스에서 쓰여진 값을 대입한다.
        var password = patext.value;//비밀번호 박스에 쓰여진 값을 대입
        var cpassword = cpatext.value;
        var mail = mtext.value;
        var name = nametext.value;
        
        var regExp1 = /^[a-zA-Z0-9]{4,12}$/;//유효성 검사 정규식표현법
        //|| /(정규표현식의 시작,끝) ^(문장시작) [](범위) 소문자a-z대문자A-Z숫자0-9를 포함 ,최소 4,최대 12자 까지 허용한다.
        //아이디 비밀번호 유효성 검사
        var regExp2 = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;
        //이메일 유효성검사
        var regname = /^[가-힝]{2,}$/;
        //이름 유효성 검사
        
        
        if(!regExp1.test(id))
             //아이디 유효성 검사 후 4~12자의 영문 대소문자와 숫자의 유효성이 안 맞다면
             //공백을 주고 알람을 띄운다.
             //밑에 동일한 유효성 검사
            {
                alert("형식에 맞춰 ID를 입력하세요");
                idtext.value = "";
                idtext.focus();
                return false;
            }
        else if(!regExp1.test(password))
        {
            alert("형식에 맞춰 비밀번호를 입력해라");
            patext.value="";
            patext.focus();
            return false;
        }
        else if(!(cpassword.slice(0,cpassword.length) === password.slice(0,password.length)))//slice함수는 배열에쓴다 배열에 담긴 시작,원하는 지점 까지의 문자를 반환한다cpqssword배열의 0번째부터 배열 길이만큼에있는 문자열을 반환하겠단 이야기 "==="는 타입까지 비교해서 같으면 트룽를 반환한다. 그러니깐 어느한쪽이 정수고 한쪽이 문자열이면 
            {//비밀번호가 같은지 확인한다. 유효성 검사 통과 못했을때
                alert("비밀번호가 동일하지 않습니다.");
                cpatext.value = "";
                cpatext.focus();
                return false;
            }
        else if((cpassword.slice(0,cpassword.length) === id.slice(0,id.length)))
        {//비밀번호끼리 비교해서 트루가나오면 일로온다 아이디의 문자열과 비밀번호를 비교한다.    유효성 검사 통과 못했을때
            alert("비밀번호가 ID랑 같은면 안되");
            patext.value="";
            patext.focus();
            cpatext.value="";
            cpatext.focus();
            return false;
            //유효성 검사를 통과못하면 비밀번호,비번확인까지 초기화시킨다. 
        }
        else if(!regExp2.test(mail))
        {
            alert("제대로된 메일이 아닙니다.");
            mtext.value="";
            mtext.focus();
            return false;
        }
        else if(!regname.test(name))
        {
            alert("이름 똑바로 써라");
            nametext.value= "";
            nametext.focus();
            return false;
        }
        else
        {
        	if(true)
        	{
             alert("회원가입을 진행합니다.");
                return true;
            }
            else
            {//엘스문안의 엘스문
                return false;
            }
        }

    }
	 
	 /* function check_jumin() {
         var jumin = document.getElementById('pnum').value +document.getElementById('nnum').value;
         //jumin 변수에 주민번호 앞자리(pnum)+뒷자리(nnum) 를 넣어준다.
         var fmt = /^\d{6}[1234]\d{6}$/;
         //"\d"<<숫자, {6}<<갯수 []<<범위,\d{6}
         //숫자6개,범위 [1234]에 다시 숫자 6개 유효성검사
         //주번 앞 6자리, 뒤 7자리를 뜻한다. "-"표시가 없으니 오류나면 확인할것
                 
         if(!fmt.test(jumin)){//fmt로 jumin을 검사할때 거짓이면
             //발동
             return false;
         }
         var birthYear = (jumin.charAt(6) <= "2") ? "19" : "20";
         //삼항연산자 주번 뒤의첫번째자리가 2보다 크거나 같으면 
         //즉 참이면 19를 거짓이면 20을 birthYear에 넣는다.
         birthYear += jumin.substr(0,2);//생년
         //substr(int,int)<<지정 인덱스 부터 몇개의 문자를 출력한다. 
         //문자를 자르는 함수이경우 0번부터 2개의 문자열을 가지고온다.
         var birthMonth = jumin.substr(2,2)-1;//월
         var birthDate = jumin.substr(4,2);//일
         var birth = new Date(birthYear,birthMonth,birthDate);
         //생년월일을 각각 자른다음배열에 넣었따.

         if(birth.getYear() % 100 != jumin.substr(0,2) ||
             birth.getMonth() != birthMonth ||
             birth.getDate() != birthDate) {
             return false;
         } */
             /*//DATA.getYear()<<는 지금의 년도를 구한다. 
             //지금 년도에서 100을 나눈 나머지 값이 주민의 인덱스 0부터 2번째자리 즉 입력한 사람의 년도와 다르면 ?
             주민번호 유효성검사뒤 생일을 자동으로 입력하는 곳*/
         

         /* var buf = new Array(13);
         for (var i = 0; i <13; i++) 
         buf[i] = parseInt(jumin.charAt(i));//parseInt<<문자를 정수로 바꿔줌
         //여기서부터 입력받은 주민번호를 정수로 바꾼뒤 유효성 검사를 시작한다.
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
                 alert("올바른 주민번호");
                 var year1 = document.getElementById("year");

                 var num1 = document.getElementById('pnum');
                 var num2 = num1.value;
                 var num3 = num2.substring(0,2);//주민번호에서 생년월일을 스트링으로 뺀다
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
                 alert("똑바로써라");
                 num1.value = "";
                 num1.focus();
                 num2.value = "";

                 return false;
         } */

</script>
</head>
<body>
<form action="jsp/joinOk.jsp"  method="post" name="data" onsubmit= "return checked()">
 
<!-- 테이블 시작-->
    <table name= "data" style="border-collapse:collapse; border:1px gray solid; width ="700" height="230" border="1" align="center">
    <!-- 첫줄  -->    
        <tr>
            <td colspan="2" align = "center" bjcolor="33ffcc" bgcolor="33ffcc">회원 기본 정보</td> 
        </tr>
<!-- 두번째줄 아이디-->
        <tr>
        	<td align="center" bgcolor="D5D5D5">아이디</td>
        	<td><input type="text" name="ide" id="ide" size=" 20" maxlength="12"/>
        		<input type="button" value="ID중복확인" onclick="idCheck()"/>
        		4~12자의 영문 대소문자와 숫자로만 입력  </td>
        </tr>
<!-- 세번째 비밀번호 -->
        <tr>
            <td align="center" bgcolor="D5D5D5">비밀번호</td>
            <td><input type="password" id="pass" name="pass" size="20" maxlength="12">4~12자의 영문 대소문자와 숫자로만 입력 </td>
        </tr>
<!-- 네번째 비밀번호 확인 -->
        <tr>
            <td align="center" bgcolor="D5D5D5">비밀번호 확인</td>
            <td><input type="password" name="비밀번호확인" id="cpass" size="20" maxlength="12"></td>
        </tr>
        <!-- 다섯번째 이름  -->
        <tr>
            <td align="center" bgcolor="D5D5D5">메일주소</td>
            <td><input type="text" name="mail" id="mail" size="20" ></td>
        </tr>
        <tr>
            <td align="center" bgcolor="D5D5D5">이름  </td>
            <td><input type="text" name="name" id="name" size="20"></td>
        </tr> 
        <!-- 여섯번째  -->
        <tr>
            <td colspan="2" align="center" bgcolor="33ffcc">개인신상 정보</td>
        </tr>
        <!-- 주민등록번호 -->
        <tr>
            <td align="center" bgcolor="D5D5D5">주민등록번호</td>
            <td><input type="text" name="pnum" id ="pnum" size="6" maxlength="6"/> - <input type="text" id="nnum" name="my_name" size="7" maxlength="7">예)123456-1234567</td>
        </tr>
        <!-- 생일 -->
        <tr>
            <td align="center" bgcolor="D5D5D5">생일</td>
            <td><input type="text" name="year" size="5" maxlength="4" id="year">년
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
                </select> 월
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
                </select>일
            </td>
            </tr>
            </table><br>
            <div align="center">
        <input type="submit" value="회원가입">
        <input type="reset" value="다시입력">
    </div>
    </form>
</body>
</html>