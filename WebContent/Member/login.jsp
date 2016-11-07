<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css"/> 
<title>login 페이지</title>

<script type="text/javascript">
	function loginForm() {
		if (document.loginform.member_id.value == "") {
			alert('아이디를 입력하세요');
			document.loginform.member_id.focus();
			return false;
		}

		else if (document.loginform.member_passwd.value == "") {
			alert('비밀번호를 입력하세요');
			document.loginform.member_passwd.focus();
			return false;
		}
		
		//아이디저장 체크가 되있으면 setCookie로 id값을 전달
		if(document.loginform.idcheck.checked == true) {					 // 아이디 저장을 체크 하였을때
			setCookie("id", document.loginform.member_id.value, 7); //쿠키이름을 cookie_id로 아이디입력필드값을 7일동안 저장
		}else{// 아이디 저장을 체크 하지 않았을때
			setCookie("id", document.loginform.member_id.value, 0); //날짜를 0으로 저장하여 쿠키삭제
		}

		return true;
	}

	window.onload = function() {
		document.loginform.member_id.focus();
	};

	function next() {

		if (event.keyCode == 9) {
			event.returnValue = false;
			document.loginform.member_passwd.focus();
		}
	}
	
	function confirmSave(checkbox){		//아이디 저장 체크시 알람창
		var isRemember;
		
		if(checkbox.checked){
			isRemember = confirm("이 PC에 아이디를 저장하시겠습니까? 개인정보 유출에 주의해주세요");
			
			if(!isRemember)
				checkbox.checked = false;
		}
	}

	function setCookie(name, value, expiredays){						//아이디 쿠키값을 받아 저장
		var todayDate = new Date();
		todayDate.setDate(todayDate.getDate() + expiredays);
		document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	}
	
	//아이디 저장 쿠키값을 불러온다.
	function getCookie(Name) {
		var search = Name + "=";

		if (document.cookie.length > 0) { 
			offset = document.cookie.indexOf(search);

			if (offset != -1) { 			
				offset += search.length; 	
				end = document.cookie.indexOf(";", offset); 

				if (end == -1)
					end = document.cookie.length;

				return unescape(document.cookie.substring(offset, end));
	
			}
		}
	}
	
	//새로고침 될때마다 실행
	window.onload = function() {
		if (getCookie("id") != null) { 				// getCookie함수로 cookie_id라는 이름의 쿠키를 불러옴
			document.loginform.member_id.value = getCookie("id"); //이름이 member_id인곳에 getCookie("id")값을 넣어줌
			document.loginform.idcheck.checked = true; 		// 체크는 체크됨으로
		}
	}
</script>


</head>
<body>
<br><br><br><br><br><br><br><br><br><br>
<center>
<table width="1000" > 
	<tr>
		<td align="left">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > 로그인<br></font>
		</td>
	</tr>
</table>


<center>
	<form name="loginform" action="LoginAction.action" method="post" onsubmit="return loginForm()">

		<table border="0" cellpadding="7" cellspacing="0" width="400" bgcolor="white">
			<tr>
				<td align="center" colspan="3">
				<img src="/SalaryMentoking/common/image/nametag/login.png" />
				</td>
			</tr>
			<tr height="15">
				<td bgcolor="#EAECEE" colspan="3"></td>
			</tr>
			<tr>
				<td align="center" width="100" bgcolor="#EAECEE">아이디</td>
				<td bgcolor="#EAECEE"><input type="text" name="member_id" onkeydown="next()"
					style="ime-mode: disabled; width: 130px; height: 17px; border: 1">
				</td>
				<td rowspan="2" align="center" bgcolor="#EAECEE">
				<input type="submit" value="로그인" 
					style="height: 60px; border: 1; cursor: pointer;" class="button"></td> 
			</tr>

			<tr>
				<td align="center" bgcolor="#EAECEE">비밀번호</td>
				<td bgcolor="#EAECEE"><input type="password" name="member_passwd"
					style="ime-mode: disabled; width: 130px; height: 16px; border: 1"></td>

			</tr>

			<tr>
				<td colspan="3" align="center" bgcolor="#EAECEE">
					<input type="checkbox" name="idcheck" onclick="confirmSave(this)">아이디 저장</input>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="Mem_SelectForm.action" >회원가입</a>&nbsp;|&nbsp;
					<a href="Mem_FindForm.action" >아이디/비밀번호 찾기</a>
				</td>
			</tr>

		</table>
	
	</form>
<br><br><br><br><br><br>
</center>
</body>
</html>