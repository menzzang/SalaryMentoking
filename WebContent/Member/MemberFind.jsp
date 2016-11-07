<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<script language="javascript">
function validation(){
	if(document.findId.member_name.value==""){
		alert("이름을 입력해주세요.");
		document.findId.member_name.focus();
		return false;
	}
	if(document.findId.member_phone.value==""){
		alert("핸드폰번호를 입력해주세요");
		document.findId.member_phone.focus();
		return false;
	}
}
function validation2(){
	if(document.findPassword.member_id.value==""){
		alert("아이디를 입력해주세요.");
		document.findPassword.member_id.focus();
		return false;
	}
	if(document.findPassword.member_name.value==""){
		alert("이름을 입력해주세요.");
		document.findPassword.member_name.focus();
		return false;
	}
	if(document.findPassword.member_phone.value==""){
		alert("핸드폰번호를 입력해주세요");
		document.findPassword.member_phone.focus();
		return false;
	}
}
</script>
<title>ID/PW찾기</title>
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
</head>
<body>
<br><br><br><br><br><br><br><br><br><br>
<center>
<table width="1000" > 
	<tr>
		<td align="left">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > 아이디/비밀번호 찾기<br></font>
		</td>
	</tr>
</table>
<form action="Mem_FindAction.action" name="findId" method="post" onsubmit="return validation();">
<br><br>
<table align="center" width="350" >
	
	<tr height="25">
			<td bgcolor="000000" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><strong>&nbsp;&nbsp;ID 찾기</strong></td>
	</tr>
	
</table>

<br>

<table align="center" width="500" >

	<tr bgcolor="#9aafc9">
		<td height="1" colspan="2"></td>
	</tr>

	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="100"><font size="2"><strong>이름</strong></font></td>
		<td width="165">
			&nbsp;&nbsp;<input type="text" name="member_name" maxlength="20"/>
		</td>
	</tr>
	
	<tr bgcolor="#9aafc9">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="100"><font size="2"><strong>핸드폰 번호</strong></font></td>
		<td width="165">
			&nbsp;&nbsp;<input type="text" name="member_phone" maxlength="20"/>
		</td>
	</tr>
	
	<tr bgcolor="#9aafc9">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="15">
		<td></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center"><input type="submit" value="ID 찾기" class="button"/></td>
	</tr>
</table>

</form>

<br>

<form action="Mem_FindPassword.action" name="findPassword" method="post" onsubmit="return validation2();">

<table align="center" width="350">
	
	<tr height="25">
			<td bgcolor="000000" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><strong>&nbsp;&nbsp;비밀번호 리셋</strong></td>
	</tr>
	
</table>

<br>

<table align="center" width="500">

	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>

	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="200"><font size="2"><strong>ID</strong></font></td>
		<td width="165">
			&nbsp;&nbsp;<input type="text" name="member_id" maxlength="20"/>
		</td>
	</tr>
	
	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="100"><font size="2"><strong>이름</strong></font></td>
		<td width="165">
			&nbsp;&nbsp;<input type="text" name="member_name" maxlength="20"/>
		</td>
	</tr>
	
	<tr bgcolor="#9aafc9">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="100"><font size="2"><strong>핸드폰 번호</strong></font></td>
		<td width="165">
			&nbsp;&nbsp;<input type="text" name="member_phone" maxlength="20"/>
		</td>
	</tr>
	
	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="10">
		<td></td>
	</tr>
	
	<tr>
		<td align="left" colspan="2"><font size="2" color="#FF0000">*</font><font size="2"> 입력된 정보가 유효할 경우, 비밀번호가 "1111" 로 리셋 됩니다.</font></td>
	</tr>
	
	<tr height="15">
		<td></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center"><input type="submit" value="비밀번호 리셋" class="button"/></td>
	</tr>
</table>
</form>

<br><br>
</body>
</html>