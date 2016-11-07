<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %> 

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<link rel="stylesheet" href="/SalaryMentoking/CSS/css/css.css" type="text/css">
	
	<SCRIPT type="text/javascript">
		function validation() {
		
			var frm = document.forms(0);
			
			if(frm.userguide_content.value == "") {
				alert("제목을 입력해주세요.");
				return false;
			} 
			
			else if(frm.userguide_passwd.value == "") {
				alert("내용을 입력해주세요.");
				return false;			
			} 
			
			return true;
		}
	</SCRIPT>
</head>

<body>

<br><br><br><br><br><br><br><br><br><br>
<center>
<table width="1000" > 
	<tr>
		<td align="left">
			<font color="#999999">&nbsp;&nbsp;&nbsp;&nbsp;> <a href="MainAction.action">메인</a> > <a href="UG_ViewAction.action">유저 가이드</a> > 글 쓰기<br></font>
			<img src="/SalaryMentoking/common/image/nametag/userguide.png" /> 
		</td>
	</tr>
</table>
<br><br>
  	
  	<s:if test="resultClass == NULL">
  		<table width="850" border="0" cellspacing="0" cellpadding="2" align="center">
  			<tr height = "25">
  				<td bgcolor="000000" align="left" colspan="1" width="10"></td>
  				<td align="left" colspan="3"><strong>User Guide 글쓰기</strong></td>
  			</tr>
  		</table>
			<form action="UG_WriteAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
			
	</s:if>
	<!--처음에 글을 작성시엔 resultClass에는  아무 값이 없으므로 if문에 들어오며,
	작성완료 버튼을 클릭하면, list를 보여주게 하는 역할임
	-->

	<s:else>
		<table width="850" border="0" cellspacing="0" cellpadding="2" align="center">
  			<tr height = "25">
  				<td bgcolor="000000" align="left" colspan="1" width="10"></td>
  				<td align="left" colspan="3"><strong>User Guide 수정하기</strong></td>
  			</tr>
  		</table>
		  <form action="UG_ModifyAction.action" method="post" enctype="multipart/form-data">
		  <s:hidden name="userguide_no" value="%{resultClass.userguide_no}" />
		  <s:hidden name="currentPage" value="%{currentPage}" />
		  <s:hidden name="old_file" value="%{resultClass.userguide_filesav}" />
	</s:else>
	<!-- checkSuccess.jsp에서 CB_ModifyForm.action으로 가면서
	struts에서 CboardWrite.jsp를 부르면서 실행되어지는 것임
	 --> 
	 
	 <table width="850" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td align="right" colspan="2"><font color="#FF0000">*</font>는 필수 입력사항입니다.</td>
        </tr>
        

        							
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
       <tr height="30">
          <td bgcolor="#F4F4F4" align="center"><strong> 첨부파일 </strong></td>
          <td bgcolor="#FFFFFF">
            <s:file name="upload" theme="simple"/>
            
            <s:if test="resultClass.userguide_fileorg != NULL">
		&nbsp; * <s:property value="resultClass.userguide_fileorg" /> 파일이 등록되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.
	</s:if>
						
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
        
		<tr height="300">
          <td bgcolor="#F4F4F4" align="center"><strong><font color="#FF0000">*</font> 사이트설명 </strong></td>
          <td bgcolor="#FFFFFF" valign="top">
            <s:textarea name="userguide_content" theme="simple" value="%{resultClass.userguide_content}" cols="100" rows="20" />
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
        <tr height="100">
          <td bgcolor="#F4F4F4" align="center"><strong><font color="#FF0000">*</font> 멘티도움말 </strong></td>
          <td bgcolor="#FFFFFF" valign="top">
            <s:textarea name="userguide_content2" theme="simple" value="%{resultClass.userguide_content2}" cols="100" rows="10" />
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
        <tr height="100">
          <td bgcolor="#F4F4F4" align="center"><strong><font color="#FF0000">*</font> 멘토도움말 </strong></td>
          <td bgcolor="#FFFFFF" valign="top">
            <s:textarea name="userguide_content3" theme="simple" value="%{resultClass.userguide_content3}" cols="100" rows="10" />
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
        
        

        
             	<tr height="30">
          <td bgcolor="#F4F4F4" align="center"><strong><font color="#FF0000">*</font> 비밀번호 </strong></td>
          <td bgcolor="#FFFFFF">
            <s:textfield name="userguide_passwd" theme="simple" value="%{resultClass.userguide_passwd}" cssStyle="width:100px" maxlength="20"/>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
        
        <tr>
          <td height="10" colspan="2"></td>
        </tr>
        
        
        <tr>
          <td align="right" colspan="2">
          	<input name="submit" type="submit" value="작성완료" class="button">
            <input name="list" type="button" value="취소"  class="button" onClick="javascript:location.href='UG_ViewAction.action?currentPage=<s:property value="currentPage" />'">
          </td>
        </tr>

    </table>
    </form>

  </body>
</html>





















