<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<script>
	function testLogin(){
		alert("�α����� �ʿ��� �����Դϴ�");
		location.href="LoginForm.action";
	}    

</script>

</head>

<body> 

<s:if test="#session.member_id == null">	<!-- ��α��� �� -->

<table width="100%">
	<tr>
		<td align="left">
			<font color="#d2d2d2">MENTORING PROJECT</font>
		</td>
		<td align="right" >
			<s:a href="LoginForm.action" >�α���</s:a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<s:a href="Mem_SelectForm.action" >ȸ������</s:a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<s:a href="javascript:testLogin();">����������</s:a>&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	<tr>
		<td height="1" colspan="2" bgcolor="#e0e0e0"></td>
	</tr> 
	
</table>


</s:if>
<s:else>	<!-- �α��� �� -->

<table width="100%">
	<tr>
		<td align="left">
			<font color="#d2d2d2">MENTORING PROJECT</font>
		</td>
		<td align="right">
		<strong>'${ session.member_id }' �� ȯ���մϴ�! </strong>
		&nbsp;&nbsp;|&nbsp;&nbsp;
		<s:a href="LogoutAction.action">�α׾ƿ�</s:a>&nbsp;&nbsp;|&nbsp;&nbsp;
		<s:a href="MP_Mypage.action">����������</s:a>&nbsp;&nbsp;|&nbsp;&nbsp;
		<s:a href="Message_ListAction.action?state=read">������</s:a>&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	<tr>
		<td colspan="7" height="1" bgcolor="#e0e0e0"></td>
	</tr>
	
</table>
</s:else>
<br>
<center>
<table width="1000" align="center">
	<tr>
		<td width="1000" align="center">
			<input type="image" src="/SalaryMentoking/common/image/mainlogo1.png" onClick="location.href='MainAction.action'" onfocus="this.blur()" onmouseover="this.style.opacity='0.7'" onmouseout="this.style.opacity='1'"/>
		</td>
	</tr>
</table>
 
<!-- <table width="100%">
	<tr>
	<td height="1" bgcolor="lightgray"></td>
	</tr>
</table> -->
</center>
</body>

</html>