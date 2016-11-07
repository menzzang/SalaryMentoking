<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>스케쥴 우편 번호 검색</title>
<script language="javascript">
function windowclose(area1,area2,area3,area4, zipcode){
	var address=area1+" "+area2+" "+area3+" "+area4;
	opener.document.memJoin.mem_zipcode.value=zipcode;
	opener.document.memJoin.mem_address.value=address;
	/* opener.document.joinForm.checkConfirmId.value="true"; */
	self.close();
}

function windowclose2(area1,area2,area3,area4){
	var address1 = area1;
	var address2 = area2;
	var address3 = area3;
	var address4 = area4;
	opener.document.schedule.schedule_addr1.value=address1;
	opener.document.schedule.schedule_addr2.value=address2;
	opener.document.schedule.schedule_addr3.value=address3;
	opener.document.schedule.schedule_addr4.value=address4;
	self.close();
}


function check(){
	if(zipForm.dong.value==""){
		alert("동이름을 입력하세요");
		zipForm.dong.focus();
		return false;
	}
}
</script>
<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
</head>
<body>

<form name=zipForm method=post action="S_ZipCheckAction.action" onsubmit="return check();">

	<table align="center" width="265" border="0" cellspacing="0" cellpadding="0">

		<tr height="25">
			<td bgcolor="000000" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><font color="black"><strong>&nbsp;&nbsp;우편 번호 검색</strong></font></td>
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
			<td align="center">"동" 단위로 검색해주세요<br>( 예: 관철동 )</td>
		</tr>

		<tr height="10">
			<td></td>
		</tr>
	
		<tr>
			<td align="center">
				<input type="text" name="dong" value="${dong }" size="20" maxlength="20">
				<input type="submit" value="검색">
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
	    <span style="cursor:pointer; display:block; margin-top:10px;" onclick="javascript:windowclose2(
	    '<s:property value="area1"/>',
	    '<s:property value="area2"/>',
	    '<s:property value="area3"/>',
	    '<s:property value="area4"/>'<%-- ,
	    '<s:property value="zipcode"/>' --%>
	    )">
	    &nbsp;
	    <s:property value="area1"/>
	    <s:property value="area2"/>
	    <s:property value="area3"/>
	    <s:property value="area4"/>
	    <%-- <s:property value="zipcode"/> --%>
	    </span>
	    </s:iterator>
	    </td>
	    </tr>
	    
	</table>
	
</body>
</html>