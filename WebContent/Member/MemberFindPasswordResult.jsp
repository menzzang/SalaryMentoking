<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<script language="javascript">

</script>
<title>��й�ȣ ���� ���</title>
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
<s:if test="resultClass == null">

<table align="center" width="350">

	<tr height="25">
		<td bgcolor="red" align="left" colspan="1" width="10"></td>
		<td align="left" colspan="3"><font color="red"><strong>&nbsp;&nbsp;��й�ȣ ���� ����</strong></font></td>
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
		<td><font color="red">${member_id }�Կ� ���� ������ �߸��Ǿ��ų�, ������ ���̵� �ƴմϴ�.<br/>ȸ������ / ���̵� ã�⸦ �̿��Ͻðų�, ������ �ٽ� �Է����ּ���.<br/></font></td>
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
		<td align="left" colspan="3"><font color="black"><strong>&nbsp;&nbsp;��й�ȣ �ٽ� ã��</strong></font></td>
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
		<td align="center" bgcolor="#e9e9e9" width="100"><font size="2"><strong>�̸�</strong></font></td>
		<td width="165">
			&nbsp;&nbsp;<input type="text" name="name" maxlength="20"/>
		</td>
	</tr>
	
	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="100"><font size="2"><strong>�ڵ��� ��ȣ</strong></font></td>
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
		<td align="center"><input type="submit" value="��й�ȣ ����"/></td>
		<td><input type="button" value="�ݱ�" onclick="location.href='LoginForm.action'"/></td>
	</tr>
</table>
</form>
</s:if>

<s:else>

<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">

	<tr height="25">
		<td bgcolor="000000" align="left" colspan="1" width="10"></td>
		<td align="left" colspan="3"><font color="black"><strong>&nbsp;&nbsp;��й�ȣ ���� ����</strong></font></td>
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
		<td>��й�ȣ�� "<strong>1111</strong>" �� ����Ǿ����ϴ�.<br/>������ > ȸ�� ���� ���� ���� ��й�ȣ�� �缳�� �Ͻ� �� �ֽ��ϴ�.</td>
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
		<td align="center"><input type="button" value="�ݱ�" onclick="location.href='LoginForm.action'"/></td>
	</tr>
</table>

</s:else>
</body>
</html>