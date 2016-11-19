<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쪽지 읽기</title>
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
</head>
<body>

<center>
<form name="messageForm" method="post" action="Message_ReWriteForm.action">
	<table width="500px" cellpadding="10">
		<tr>
			<td align="left">
				<c:if test="${ state == 'read' }">
				<img src="/SalaryMentoking/common/image/nametag/message_view1.png" />
				</c:if>
				<c:if test="${ state == 'send' }">
				<img src="/SalaryMentoking/common/image/nametag/message_view2.png" />
				</c:if>
			</td>
		</tr>
	</table>
	
	<table width="450px" cellpadding="10">
		<tr height="35px">
			<td width="60px">
				<input type="hidden" name="message_no" value="${message_no }" />
				<input type="hidden" name="state" value="${state }" />
				
				<c:if test="${ state == 'send' }">
					<b>받는 사람</b>
				</c:if>
				<c:if test="${ state == 'read' }">
					<b>보낸 사람</b>
				</c:if>
			</td>
			
			<td>
				<c:if test="${ state == 'read' }">
					<input type="text" name="message_read" size="45" maxlength="400" value="<s:property value='resultClassMsg.message_send' />" readonly>
				</c:if>
				<c:if test="${ state == 'send' }">
					<input type="text" name="message_send" size="45" maxlength="400" value="<s:property value='resultClassMsg.message_read' />"	 readonly>
				</c:if>

			</td>
		</tr>
		
		<tr>
			<td colspan="2" width="450">
				<textarea name="message_content" cols="62" rows="25" style="height:300px;" readonly ><s:property value="resultClassMsg.message_content"/></textarea>
			</td>
		</tr>
		
		<tr align="right">
			<td colspan="2" width="450">
				<font size="2">보낸날짜 : <s:property value="resultClassMsg.message_senddate" />
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<c:if test="${state == 'read' }">
					<div align="center">
						<input type="submit" name="confirm" value="답장하기" class="button" />
						<input type="button" value="닫기" class="button" onclick="javascript:window.close()" />
				</c:if>
				<c:if test="${state == 'send' }">
					<div align="center">
						<input type="button" value="닫기" class="button" onclick="javascript:window.close()" />
					</div>
				</c:if>
				</font>
	</table>
</form>

</body>
</html>