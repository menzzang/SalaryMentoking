<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>���� ��ȣ �˻�</title>
<script language="javascript">
function windowclose(zipcode,area1,area2,area3,area4){
	var address=area1+" "+area2+" "+area3+" "+area4;
	opener.document.memJoin.member_zipcode.value=zipcode;
	opener.document.memJoin.member_address.value=address;
	/* opener.document.joinForm.checkConfirmId.value="true"; */
	self.close();
}
function check(){
	if(zipForm.dong.value==""){
		alert("���̸��� �Է��ϼ���");
		zipForm.dong.focus();
		return false;
	}
}
</script>
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
</head>
<body>

<form name=zipForm method=post action="ZipCheckAction.action" onsubmit="return check();">

	<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">

		<tr height="25">
			<td bgcolor="000000" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><font color="black"><strong>&nbsp;&nbsp;���� ��ȣ �˻�</strong></font></td>
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
			<td align="center">"��" ������ �˻����ּ���<br>( ��: ��ö�� )</td>
		</tr>

		<tr height="10">
			<td></td>
		</tr>
	
		<tr>
			<td align="center">
				<input type="text" name="dong" value="${dong }" size="20" maxlength="20">
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
		
		<tr align="center">
		<td align="center">
		<s:iterator value="%{zipcodeList}" status="rowStatus">
	    <span style="cursor:pointer; display:block; margin-top:10px;" onclick="javascript:windowclose(
	    '<s:property value="zipcode"/>',
	    '<s:property value="area1"/>',
	    '<s:property value="area2"/>',
	    '<s:property value="area3"/>',
	    '<s:property value="area4"/>'
	    )">
	    <s:property value="zipcode"/>&nbsp;
	    <s:property value="area1"/>
	    <s:property value="area2"/>
	    <s:property value="area3"/>
	    <s:property value="area4"/>
	    </span>
	    </s:iterator>
	    </td>
	    </tr>
	    
	</table>
	
</body>
</html>