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
function validation2(){
	if(document.findPassword.member_id.value==""){
		alert("���̵� �Է����ּ���.");
		document.findPassword.member_id.focus();
		return false;
	}
	if(document.findPassword.member_name.value==""){
		alert("�̸��� �Է����ּ���.");
		document.findPassword.member_name.focus();
		return false;
	}
	if(document.findPassword.member_phone.value==""){
		alert("�ڵ�����ȣ�� �Է����ּ���");
		document.findPassword.member_phone.focus();
		return false;
	}
}
</script>
<title>ID/PWã��</title>
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
<form action="Mem_FindAction.action" name="findId" method="post" onsubmit="return validation();">
<br><br>
<table align="center" width="350" >
	
	<tr height="25">
			<td bgcolor="000000" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><strong>&nbsp;&nbsp;ID ã��</strong></td>
	</tr>
	
</table>

<br>

<table align="center" width="500" >

	<tr bgcolor="#9aafc9">
		<td height="1" colspan="2"></td>
	</tr>

	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="100"><font size="2"><strong>�̸�</strong></font></td>
		<td width="165">
			&nbsp;&nbsp;<input type="text" name="member_name" maxlength="20"/>
		</td>
	</tr>
	
	<tr bgcolor="#9aafc9">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="100"><font size="2"><strong>�ڵ��� ��ȣ</strong></font></td>
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
		<td colspan="2" align="center"><input type="submit" value="ID ã��" class="button"/></td>
	</tr>
</table>

</form>

<br>

<form action="Mem_FindPassword.action" name="findPassword" method="post" onsubmit="return validation2();">

<table align="center" width="350">
	
	<tr height="25">
			<td bgcolor="000000" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><strong>&nbsp;&nbsp;��й�ȣ ����</strong></td>
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
		<td align="center" bgcolor="#e9e9e9" width="100"><font size="2"><strong>�̸�</strong></font></td>
		<td width="165">
			&nbsp;&nbsp;<input type="text" name="member_name" maxlength="20"/>
		</td>
	</tr>
	
	<tr bgcolor="#9aafc9">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="100"><font size="2"><strong>�ڵ��� ��ȣ</strong></font></td>
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
		<td align="left" colspan="2"><font size="2" color="#FF0000">*</font><font size="2"> �Էµ� ������ ��ȿ�� ���, ��й�ȣ�� "1111" �� ���� �˴ϴ�.</font></td>
	</tr>
	
	<tr height="15">
		<td></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center"><input type="submit" value="��й�ȣ ����" class="button"/></td>
	</tr>
</table>
</form>

<br><br>
</body>
</html>