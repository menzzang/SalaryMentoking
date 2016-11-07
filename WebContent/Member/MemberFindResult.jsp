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
</script>
<title>ID 찾기 결과</title>
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

<s:if test="list.size() <= 0">

<form action="Mem_FindAction.action" name="findId" method="post" onsubmit="return validation();">

<table align="center" width="265">

	<tr height="25">
		<td bgcolor="red" align="left" colspan="1" width="10"></td>
		<td align="left" colspan="3"><font color="red"><strong>&nbsp;&nbsp;ID 찾기 실패</strong></font></td>
	</tr>

</table>

<br>

<table align="center" width="265">

	<tr bgcolor="red">
		<td height="1"></td>
	</tr>
	
	<tr height="10">
		<td></td>
	</tr>
	
	<tr>
		<td><font color="red">회원 목록에 없는 사용자입니다. ID와 핸드폰번호를 확인해주세요.</font></td>
	</tr>
	
	<tr height="10">
		<td></td>
	</tr>
	
	<tr bgcolor="red">
		<td height="1"></td>
	</tr>

</table>

<br>

<table align="center" width="265">

	<tr height="25">
		<td bgcolor="000000" align="left" colspan="1" width="10"></td>
		<td align="left" colspan="3"><font color="black"><strong>&nbsp;&nbsp;ID 다시 찾기</strong></font></td>
	</tr>

</table>

<br>

<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
	
	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>

	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="100"><font size="2"><strong>이름</strong></font></td>
		<td width="165">
			&nbsp;&nbsp;<input type="text" name="member_name" maxlength="20"/>
		</td>
	</tr>
	
	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="100"><font size="2"><strong>핸드폰 번호</strong></font></td>
		<td width="165">
			&nbsp;&nbsp;<input type="text" name="member_phone" maxlength="20"/>
		</td>
	</tr>
	
	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="15">
		<td></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center"><input type="submit" class="inputb" value="ID 찾기"/>
		<input type="button" value="닫기" onclick="location.href='LoginForm.action'"/></td>
	</tr>
</table>
</form>
</s:if>

<s:else>

<table align="center" width="265" >

	<tr height="25">
		<td bgcolor="000000" align="left" colspan="1" width="10"></td>
		<td align="left" colspan="3"><font color="black"><strong>&nbsp;&nbsp;ID 찾기 결과</strong></font></td>
	</tr>

</table>

<br>

<table align="center" width="265" >
	<tr bgcolor="000000">
		<td height="1" colspan="4"></td>
	</tr>
</table>

<s:iterator value="list" status="stat">

<br>

<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>회원님의 ID는 "<s:property value="member_id"/>" 입니다.<br/></td>
	</tr>
</table>

</s:iterator>

<br>

<table align="center" width="265">
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