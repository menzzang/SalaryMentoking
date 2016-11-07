<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<script language="javascript">

</script>
<title>비밀번호 리셋 결과</title>
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
<s:if test="resultClass == null">

<table align="center" width="350">

	<tr height="25">
		<td bgcolor="red" align="left" colspan="1" width="10"></td>
		<td align="left" colspan="3"><font color="red"><strong>&nbsp;&nbsp;비밀번호 리셋 실패</strong></font></td>
	</tr>

</table>

<br>

<table align="center" width="350">

	<tr bgcolor="red">
		<td height="1"></td>
	</tr>
	
	<tr height="10">
		<td></td>
	</tr>
	
	<tr>
		<td><font color="red">${member_id }님에 대한 정보가 잘못되었거나, 가입한 아이디가 아닙니다.<br/>회원가입 / 아이디 찾기를 이용하시거나, 정보를 다시 입력해주세요.<br/></font></td>
	</tr>
	
	<tr height="10">
		<td></td>
	</tr>
	
	<tr bgcolor="red">
		<td height="1"></td>
	</tr>

</table>

<br>

<form action="Mem_FindPassword.action" name="findPassword" method="post" onsubmit="return validation2();">

<table align="center" width="350">

	<tr height="25">
		<td bgcolor="000000" align="left" colspan="1" width="10"></td>
		<td align="left" colspan="3"><font color="black"><strong>&nbsp;&nbsp;비밀번호 다시 찾기</strong></font></td>
	</tr>

</table>

<br>

<table align="center" width="350" border="0" cellspacing="0" cellpadding="0">

	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>

	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="200"><font size="2"><strong>ID</strong></font></td>
		<td width="165">
			&nbsp;&nbsp;<input type="text" name="id" maxlength="20"/>
		</td>
	</tr>

	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>

	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="100"><font size="2"><strong>이름</strong></font></td>
		<td width="165">
			&nbsp;&nbsp;<input type="text" name="name" maxlength="20"/>
		</td>
	</tr>
	
	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="100"><font size="2"><strong>핸드폰 번호</strong></font></td>
		<td width="165">
			&nbsp;&nbsp;<input type="text" name="mobile" maxlength="20"/>
		</td>
	</tr>
	
	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>
	
</table>

<br>

<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td align="center"><input type="submit" value="비밀번호 리셋"/></td>
		<td><input type="button" value="닫기" onclick="location.href='LoginForm.action'"/></td>
	</tr>
</table>
</form>
</s:if>

<s:else>

<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">

	<tr height="25">
		<td bgcolor="000000" align="left" colspan="1" width="10"></td>
		<td align="left" colspan="3"><font color="black"><strong>&nbsp;&nbsp;비밀번호 리셋 성공</strong></font></td>
	</tr>

</table>

<br>

<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
	<tr bgcolor="#888888">
		<td height="1" colspan="4"></td>
	</tr>
</table>

<br>

<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>비밀번호가 "<strong>1111</strong>" 로 변경되었습니다.<br/>고객센터 > 회원 정보 수정 에서 비밀번호를 재설정 하실 수 있습니다.</td>
	</tr>
</table>

<br>

<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
	<tr bgcolor="#888888">
		<td height="1" colspan="4"></td>
	</tr>
</table>

<br>

<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td align="center"><input type="button" value="닫기" onclick="location.href='LoginForm.action'"/></td>
	</tr>
</table>

</s:else>
</body>
</html>