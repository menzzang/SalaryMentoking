<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>���̵� �ߺ� Ȯ��</title>
<script language="javascript">
function windowclose(){
	opener.document.memJoin.member_id.value="${member_id}";
	/* opener.document.joinForm.checkConfirmId.value="true"; */
	window.close();
}
function check(){
	if(idChk.member_id.value==""){
		alert("���̵� �Է��� �ּ���");
		idChk.member_id.focus();
		return false;
	}
}
</script>
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
</head>
<body>

<s:if test="member_chkId==1">

	<form name=idChk onsubmit="return check();">
	
	<table align="center" width="265">
	
		<tr height="25">
			<td bgcolor="red" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><font color="red"><strong>&nbsp;&nbsp;ID �ߺ�</strong></font></td>
		</tr>
	
	</table>

	<br>

	<table align="center" width="265" >
	
		<tr bgcolor="red">
			<td height="1"></td>
		</tr>
		
		<tr height="10">
			<td></td>
		</tr>
		
		<tr>
			<td><font color="red">"${member_id }" �� �̹� ������� ���̵��Դϴ�. �ٸ� ���̵� ������ �ּ���</font></td>
		</tr>
		
		<tr height="10">
			<td></td>
		</tr>
		
		<tr bgcolor="red">
			<td height="1"></td>
		</tr>
	
	</table>
	
	<br>
	<br>

	<table align="center" width="265">

		<tr height="25">
			<td bgcolor="000000" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><font color="black"><strong>&nbsp;&nbsp;ID �ߺ� Ȯ��</strong></font></td>
		</tr>

	</table>

	<br>

	<table align="center" width="265" >
	
		<tr bgcolor="000000">
			<td height="1"></td>
		</tr>
	
		<tr height="10">
			<td></td>
		</tr>
	
		<tr align="center">
			<td>
				<input type=text maxlength=20 name="member_id"/>
				<input type=submit value="ID �ߺ�Ȯ��" class="inputb"/>
			</td>
		<tr>
		
		<tr height="10">
			<td></td>
		</tr>
	
		<tr bgcolor="000000">
			<td height="1"></td>
		</tr>
	
		<tr height="20">
			<td></td>
		</tr>
		
		<tr>
			<td align="center"><input type="button"  value="�ݱ�" onclick="windowclose()"/></td>
		</tr>
		
	</table>

	</form>
	
</s:if>

<s:else>

	<table align="center" width="265" >

		<tr height="25">
			<td bgcolor="000000" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><font color="black"><strong>&nbsp;&nbsp;��� ����</strong></font></td>
		</tr>

	</table>

	<br>

	<table align="center" width="265" >
	
		<tr bgcolor="000000">
			<td height="1"></td>
		</tr>
	
		<tr height="10">
			<td></td>
		</tr>
		
		<tr>
			<td>�Է��Ͻ� "${member_id }" �� ����� �� �ִ� ���̵��Դϴ�.</td>
		</tr>
		
		<tr height="10">
			<td></td>
		</tr>
		
		<tr bgcolor="000000">
			<td height="1"></td>
		</tr>
		
		<tr height="20">
			<td></td>
		</tr>
		
		<tr>
			<td align="center"><input type="button" value="�ݱ�" onclick="windowclose()"/></td>
		</tr>
	</table>
</s:else>
</body>
</html>