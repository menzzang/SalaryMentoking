<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>���� ��ȣ �˻�</title>
<script language="javascript">
function windowclose(area1,area2){
	var address1=area1;
	var address2=area2;
	opener.document.memJoin.area1.value=address1;
	opener.document.memJoin.address.value=address2; // opener�� ��â�� �����ذ� ,,,,, mentorList.jsp  memjoin�� �ִ� �����ٰ� address.value���� �ִ� address�� �־����
	/* opener.document.joinForm.checkConfirmId.value="true"; */
	self.close();
}
function check(){
	if(zipForm.si.value==""){
		alert("���̸��� �Է��ϼ���");
		zipForm.si.focus();
		return false;
	}
}
</script>
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
</head>
<body>

<form name=zipForm method=post action="ZipCheckAction1.action" onsubmit="return check();">

	<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">

		<tr height="25">
			<td bgcolor="000000" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><font color="black"><strong>&nbsp;&nbsp;���� ã��</strong></font></td>
		</tr>

	</table>

	<br>

	<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
	
		<tr bgcolor="#888888">
			<td height="1"></td>
		</tr>
	
		<tr height="10">
			<td></td>
		</tr>
		
		<tr>
			<td align="center">"��" ������ �˻����ּ���<br>( ��: ����� )</td>
		</tr>

		<tr height="10">
			<td></td>
		</tr>
	
		<tr>
			<td align="center">
				<input type="text" name="si" value="${si}" size="20" maxlength="20">
				<input type="submit" value="�˻�" class="topb">
			</td>
		</tr>

		<tr height="10">
			<td></td>
		</tr>
		
		<tr bgcolor="#888888">
			<td height="1"></td>
		</tr>
		
	</table>

</form>

	<br>
	
	<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">
		<!-- widowclose�� ������ ������ �ö󰡼� ã�� -->
		<tr align="center">
		<td align="center">
		<s:iterator value="%{zipcodeList}" status="rowStatus"> <!-- action���� zipcodeList�� �ҷ��� ����Ʈ -->
	    <span style="cursor:pointer; display:block; margin-top:10px;" onclick="javascript:windowclose(                           
	    '<s:property value="area1"/>',
	    '<s:property value="area2"/>'
	    )">
	    
	     <s:property value="area1"/>&nbsp;
	    <s:property value="area2"/>
	    </span>
	    </s:iterator>
	    </td>
	    </tr>
	    
	</table>
	
</body>
</html>