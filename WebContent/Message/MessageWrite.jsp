<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쪽지 보내기</title>
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">

<script language="JavaScript">

function writeCheck(){
	var userinput = eval("document.messageForm");
	
	if(document.messageForm.message_read.value == ""){
		alert("받는 사람을 입력하세요!");
		document.messageForm.message_read.focus();
		return false;
	}
	if(!userinput.message_content.value){
		alert("내용을 입력하세요");
		return false;
	}
}

</script>
</head>
<body>

<center>
<form name="messageForm" method="post" action="Message_WriteAction.action" onSubmit="return writeCheck()">
	<table width="500px" cellpadding="10">
		<tr>
			<td align="left">
			<img src="/SalaryMentoking/common/image/nametag/message_write.png" />
			</td>
		</tr>
	</table>

	<table width="450px" cellpadding="10">
		<tr height="35px">
			<td width="60px">
				<font size="2"><b>받는 사람</b></font>
			</td>
			
			<td>
				<input type="hidden" name="state" value="${state }" />
				<input type="text" name="message_read" size="45" maxlength="400" value="${message_read }"><br>
				<font size="1"><span>아이디 사이에 쉼표(,)를 넣어 여러명에게 동시에 쪽지를 보낼 수 있습니다.</span></font>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" width="450">
				<textarea name="message_content" cols="62" rows="16" style="height:300px;" ></textarea>
			</td>
		</tr>
		
		<tr align="right">
			<td colspan="2" width="450">
					<input type="submit" name="confirm" value="보내기" class="button">
					<input type="button" class="button" onclick="javascript:window.close()" value="닫기" >
			</td>
		</tr>
	</table>

</form>
</center>

</body>
</html>