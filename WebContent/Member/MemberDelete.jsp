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
		alert('비밀번호를 입력하세요');
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
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > <a href="MP_Mypage.action">마이페이지</a> > <a href="javascript:history.go(-1)">회원 정보 수정</a> > 회원탈퇴<br></font>
			<img src="/SalaryMentoking/common/image/nametag/myinfo.png" />
		</td>
	</tr>
</table>
<br><br>

<center>
<form name="deleteform" action="Mem_DeleteAction.action" method="post" onsubmit="return deleteForm()">
	<table width="400" >
		<tr>
			<td align="center"><b>회원탈퇴</b></td>
		</tr>
		<tr>
			<td><hr></td>
	</table>
	
	<table width="700" >
		<tr>
			<td align="center">
				* 회원탈퇴 시 멘토/멘티의 개인정보는 모두 삭제 됩니다. *<br>
				* 비밀번호를 입력하시고 [탈퇴하기] 버튼을 클릭해주세요. *
			</td>
		</tr>
		<tr>
			<td><br></td>
		</tr>
		<tr>
			<td align="center">
			비밀번호 입력&nbsp;<input type="password" name="member_passwd" size="12" maxlength="6" /><br><br>
			</td>
		</tr>
			<s:if test="%{deleteResult == -1}">
		<tr>
			<td align="center">
			<font color="red">* 비밀번호가 틀렸습니다. 다시 입력해주세요</font>
			</td>
		</tr>	
			</s:if>
		<tr>
			<td><br></td>
		</tr>
		<tr>
			<td align="center">
				<input type="submit" value="회원탈퇴" class="inputb" />
				<input type="button" value="돌아가기" onclick="location.href='MP_ModifyForm.action'" class="inputb"/>
			</td>
		</tr>
	</table>

</form>
</center>
</body>
</html>