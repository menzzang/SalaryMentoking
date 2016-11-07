<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>우편 번호 검색</title>
<script language="javascript">
function windowclose(area1,area2){
	var address1=area1;
	var address2=area2;
	opener.document.memJoin.area1.value=address1;
	opener.document.memJoin.address.value=address2; // opener가 그창을 열어준곳 ,,,,, mentorList.jsp  memjoin에 있는 곳에다가 address.value값에 있는 address를 넣어줘라
	/* opener.document.joinForm.checkConfirmId.value="true"; */
	self.close();
}
function check(){
	if(zipForm.si.value==""){
		alert("시이름을 입력하세요");
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
			<td align="left" colspan="3"><font color="black"><strong>&nbsp;&nbsp;멘토 찾기</strong></font></td>
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
			<td align="center">"시" 단위로 검색해주세요<br>( 예: 서울시 )</td>
		</tr>

		<tr height="10">
			<td></td>
		</tr>
	
		<tr>
			<td align="center">
				<input type="text" name="si" value="${si}" size="20" maxlength="20">
				<input type="submit" value="검색" class="topb">
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
		<!-- widowclose를 누르면 맨위로 올라가서 찾음 -->
		<tr align="center">
		<td align="center">
		<s:iterator value="%{zipcodeList}" status="rowStatus"> <!-- action에서 zipcodeList를 불러온 리스트 -->
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