<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
<script>
function deleteForm(){
	
	if(document.deleteform.member_passwd.value == ""){
		alert('��й�ȣ�� �Է��ϼ���');
		document.deleteform.member_passwd.focus();
		return false;
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
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">����</a> > <a href="MP_Mypage.action">����������</a> > <a href="javascript:history.go(-1)">ȸ�� ���� ����</a> > ȸ��Ż��<br></font>
			<img src="/SalaryMentoking/common/image/nametag/myinfo.png" />
		</td>
	</tr>
</table>
<br><br>

<center>
<form name="deleteform" action="Mem_DeleteAction.action" method="post" onsubmit="return deleteForm()">
	<table width="400" >
		<tr>
			<td align="center"><b>ȸ��Ż��</b></td>
		</tr>
		<tr>
			<td><hr></td>
	</table>
	
	<table width="700" >
		<tr>
			<td align="center">
				* ȸ��Ż�� �� ����/��Ƽ�� ���������� ��� ���� �˴ϴ�. *<br>
				* ��й�ȣ�� �Է��Ͻð� [Ż���ϱ�] ��ư�� Ŭ�����ּ���. *
			</td>
		</tr>
		<tr>
			<td><br></td>
		</tr>
		<tr>
			<td align="center">
			��й�ȣ �Է�&nbsp;<input type="password" name="member_passwd" size="12" maxlength="6" /><br><br>
			</td>
		</tr>
			<s:if test="%{deleteResult == -1}">
		<tr>
			<td align="center">
			<font color="red">* ��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է����ּ���</font>
			</td>
		</tr>	
			</s:if>
		<tr>
			<td><br></td>
		</tr>
		<tr>
			<td align="center">
				<input type="submit" value="ȸ��Ż��" class="inputb" />
				<input type="button" value="���ư���" onclick="location.href='MP_ModifyForm.action'" class="inputb"/>
			</td>
		</tr>
	</table>

</form>
</center>
</body>
</html>