<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<script language="javascript">
function validation(){
	if(document.findId.member_name.value==""){
		alert("�̸��� �Է����ּ���.");
		document.findId.member_name.focus();
		return false;
	}
	if(document.findId.member_phone.value==""){
		alert("�ڵ�����ȣ�� �Է����ּ���");
		document.findId.member_phone.focus();
		return false;
	}
}
</script>
<title>ID ã�� ���</title>
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
</head>
<body>
<br><br><br><br><br><br><br><br><br><br>
<center>
<table width="1000" > 
	<tr>
		<td align="left">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">����</a> > ���̵�/��й�ȣ ã��<br></font>
		</td>
	</tr>
</table>

<s:if test="list.size() <= 0">

<form action="Mem_FindAction.action" name="findId" method="post" onsubmit="return validation();">

<table align="center" width="265">

	<tr height="25">
		<td bgcolor="red" align="left" colspan="1" width="10"></td>
		<td align="left" colspan="3"><font color="red"><strong>&nbsp;&nbsp;ID ã�� ����</strong></font></td>
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
		<td><font color="red">ȸ�� ��Ͽ� ���� ������Դϴ�. ID�� �ڵ�����ȣ�� Ȯ�����ּ���.</font></td>
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
		<td align="left" colspan="3"><font color="black"><strong>&nbsp;&nbsp;ID �ٽ� ã��</strong></font></td>
	</tr>

</table>

<br>

<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
	
	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>

	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="100"><font size="2"><strong>�̸�</strong></font></td>
		<td width="165">
			&nbsp;&nbsp;<input type="text" name="member_name" maxlength="20"/>
		</td>
	</tr>
	
	<tr bgcolor="000000">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="100"><font size="2"><strong>�ڵ��� ��ȣ</strong></font></td>
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
		<td colspan="2" align="center"><input type="submit" class="inputb" value="ID ã��"/>
		<input type="button" value="�ݱ�" onclick="location.href='LoginForm.action'"/></td>
	</tr>
</table>
</form>
</s:if>

<s:else>

<table align="center" width="265" >

	<tr height="25">
		<td bgcolor="000000" align="left" colspan="1" width="10"></td>
		<td align="left" colspan="3"><font color="black"><strong>&nbsp;&nbsp;ID ã�� ���</strong></font></td>
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
		<td>ȸ������ ID�� "<s:property value="member_id"/>" �Դϴ�.<br/></td>
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
		<td align="center"><input type="button" value="�ݱ�" onclick="location.href='LoginForm.action'"/></td>
	</tr>
</table>

</s:else>
</body>
</html>