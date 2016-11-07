<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원 가입</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
</head>
<body>

<br><br><br><br><br><br><br><br><br><br>
<center>
	<table width="1000" > 
		<tr>
			<td align="left">
				<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > 회원가입<br></font>
				<img src="/SalaryMentoking/common/image/nametag/join.png" />
			</td>
		</tr>
	</table>
	<br>	
	<table align="center" width="850" border="0" cellspacing="0" cellpadding="0">
	<tr align="center">
		<td align="center">
			<s:a href="Mem_JoinForm.action?member_index=1">
				<img src="/SalaryMentoking/common/image/join_mentor.jpg" onmouseover="this.style.opacity='0.8'" onmouseout="this.style.opacity='1'"/>
				<%-- <s:hidden name="member_index" value="1" /> --%>
			</s:a> 
		</td>
		<td align="center">
			<s:a href="Mem_JoinForm.action?member_index=2">
				<img src="/SalaryMentoking/common/image/join_mentee.jpg" onmouseover="this.style.opacity='0.8'" onmouseout="this.style.opacity='1'"/>
				<%-- <s:hidden name="member_index" value="1" /> --%>
			</s:a> 
		</td>
	</tr>
	</table>	
	<br>
	<br>
</body>
</html>