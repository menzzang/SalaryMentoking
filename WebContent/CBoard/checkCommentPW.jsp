<%@ page contentType="text/html; charset=euc-kr" language="java" pageEncoding="euc-kr" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//w3c//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>��й�ȣ Ȯ��</title>
		<link rel="stylesheet" href="/Lee/common/css/css.css" type="text/css"/>
</head>
<body>

<h2>��й�ȣ Ȯ��</h2>
	<form action="CC_CheckAction.action" method="post" >
		<s:hidden name="ccomment_no" value="%{ccomment_no}" />
		<s:hidden name="cboard_no" value="%{cboard_no}" />
		<s:hidden name="currentPage" value="%{currentPage}" />
		
		<table width="250" border="0" cellspacing="0" cellpadding="0">
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>
			<tr>
				<td width="100" bgcolor="#F4F4F4">��й�ȣ �Է�</td>
				<td width="150" bgcolor="#FFFFFF">
					&nbsp;&nbsp;<s:textfield name="ccomment_passwd" theme="simple" cssStyle="width:100px" maxlength="20" />
					&nbsp;&nbsp;<input type="submit" name="submit" value="Ȯ��" class="inputb">
				</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>
		</table>
	</form>
</body>