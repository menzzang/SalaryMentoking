<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
<script>
function check(){
		alert("등록된 멘토정보가 없습니다");
}
</script>
</head>
<body>

<s:if test="%{result == -1}">
<script>check()</script>
</s:if>
<br><br><br><br><br><br><br><br><br><br>
<center>
<table width="1000" > 
	<tr>
		<td align="left">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > 마이페이지<br></font>
			<img src="/SalaryMentoking/common/image/nametag/mypage.png" />
		</td>
	</tr>
</table>

<br><br><br>

<table width="600" height="180" border="0">
	<tr>
		<td align="center">
			<s:a href="MP_ModifyForm.action">
			<img src="/SalaryMentoking/common/image/mypage1.png" onmouseover="this.style.opacity='0.8'" onmouseout="this.style.opacity='1'"/></s:a> 
		</td>
		<td align="center">
			<s:a href="MP_MyList.action" >
			<img src="/SalaryMentoking/common/image/mypage4.png" onmouseover="this.style.opacity='0.8'" onmouseout="this.style.opacity='1'"/></s:a>
		</td>
	<s:if test ="#session.member_index==1">
		<td align="center">
			<s:a href="MP_MTorGetNo.action">
			<img src="/SalaryMentoking/common/image/mypage3.png" onmouseover="this.style.opacity='0.8'" onmouseout="this.style.opacity='1'"/></s:a>
		</td>
		<td align="center">
			<s:a href="AP_MentorAction.action">
			<img src="/SalaryMentoking/common/image/mypage2.png" onmouseover="this.style.opacity='0.8'" onmouseout="this.style.opacity='1'"/></s:a>
		</td>
	</s:if>
	<s:else>
		<td align="center">
			<s:a href="AP_MenteeAction.action"> 
			<img src="/SalaryMentoking/common/image/mypage2.png" onmouseover="this.style.opacity='0.8'" onmouseout="this.style.opacity='1'"/></s:a>
		</td>
	</tr>
	</s:else>
</table>
<br>
<br>
<br>
<br>
<br><br><br>
</body>
</center>
</html>